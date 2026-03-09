import 'dart:io';
import 'package:dio/dio.dart';
import '../constants.dart';
import '../models/setup_state.dart';
import 'native_bridge.dart';

class BootstrapService {
  final Dio _dio = Dio();

  void _updateSetupNotification(String text, {int progress = -1}) {
    try {
      NativeBridge.updateSetupNotification(text, progress: progress);
    } catch (_) {}
  }

  void _stopSetupService() {
    try {
      NativeBridge.stopSetupService();
    } catch (_) {}
  }

  Future<SetupState> checkStatus() async {
    try {
      final complete = await NativeBridge.isBootstrapComplete();
      if (complete) {
        return const SetupState(
          step: SetupStep.complete,
          progress: 1.0,
          messageKey: 'setupComplete',
        );
      }
      return const SetupState(
        step: SetupStep.checkingStatus,
        progress: 0.0,
        messageKey: 'setupRequired',
      );
    } catch (e) {
      return SetupState(
        step: SetupStep.error,
        error: 'Failed to check status: $e',
        messageKey: 'failedToCheckStatus',
        messageArgs: {'error': e.toString()},
      );
    }
  }

  Future<void> runFullSetup({
    required void Function(SetupState) onProgress,
  }) async {
    try {
      // Start foreground service to keep app alive during setup
      try {
        await NativeBridge.startSetupService();
      } catch (_) {} // Non-fatal if service fails to start

      // Step 0: Setup directories
      onProgress(const SetupState(
        step: SetupStep.checkingStatus,
        progress: 0.0,
        messageKey: 'settingUpDirectories',
      ));
      _updateSetupNotification('Setting up directories...', progress: 2);
      try { await NativeBridge.setupDirs(); } catch (_) {}
      try { await NativeBridge.writeResolv(); } catch (_) {}

      // Step 1: Download rootfs (清华源)
      final arch = await NativeBridge.getArch();
      final rootfsUrl = AppConstants.getRootfsUrlCN(arch);
      final filesDir = await NativeBridge.getFilesDir();

      // Direct Dart fallback: ensure config dir + resolv.conf exist (#40).
      // 使用国内 DNS (阿里 DNS + 114 DNS)
      const resolvContent = 'nameserver 223.5.5.5\nnameserver 114.114.114.114\n';
      try {
        final configDir = '$filesDir/config';
        final resolvFile = File('$configDir/resolv.conf');
        if (!resolvFile.existsSync()) {
          Directory(configDir).createSync(recursive: true);
          resolvFile.writeAsStringSync(resolvContent);
        }
        // Also write into rootfs /etc/ so DNS works even if bind-mount fails
        final rootfsResolv = File('$filesDir/rootfs/ubuntu/etc/resolv.conf');
        if (!rootfsResolv.existsSync()) {
          rootfsResolv.parent.createSync(recursive: true);
          rootfsResolv.writeAsStringSync(resolvContent);
        }
      } catch (_) {}
      final tarPath = '$filesDir/tmp/ubuntu-rootfs.tar.gz';

      _updateSetupNotification('Downloading Ubuntu rootfs...', progress: 5);
      onProgress(const SetupState(
        step: SetupStep.downloadingRootfs,
        progress: 0.0,
        messageKey: 'downloadingUbuntuRootfs',
      ));

      await _dio.download(
        rootfsUrl,
        tarPath,
        onReceiveProgress: (received, total) {
          if (total > 0) {
            final progress = received / total;
            final mb = (received / 1024 / 1024).toStringAsFixed(1);
            final totalMb = (total / 1024 / 1024).toStringAsFixed(1);
            // Map download to 5-30% of overall progress
            final notifProgress = 5 + (progress * 25).round();
            _updateSetupNotification('Downloading rootfs: $mb / $totalMb MB', progress: notifProgress);
            onProgress(SetupState(
              step: SetupStep.downloadingRootfs,
              progress: progress,
              messageKey: 'downloadingProgress',
              messageArgs: {'current': mb, 'total': totalMb},
            ));
          }
        },
      );

      // Step 2: Extract rootfs (30-45%)
      _updateSetupNotification('Extracting rootfs...', progress: 30);
      onProgress(const SetupState(
        step: SetupStep.extractingRootfs,
        progress: 0.0,
        messageKey: 'extractingRootfsWait',
      ));
      await NativeBridge.extractRootfs(tarPath);
      onProgress(const SetupState(
        step: SetupStep.extractingRootfs,
        progress: 1.0,
        messageKey: 'rootfsExtracted',
      ));

      // 配置 apt 国内源（Ubuntu 官方中国镜像）- DEB822 格式
      // 使用 sed 替换 /etc/apt/sources.list.d/ubuntu.sources 中的 URIs
      // x86 架构: cn.archive.ubuntu.com/ubuntu
      // ARM 架构: cn.ports.ubuntu.com/ubuntu-ports
      final isPorts = (arch != 'x86_64');
      final cnMirror = isPorts 
          ? 'http://cn.ports.ubuntu.com/ubuntu-ports/'
          : 'http://cn.archive.ubuntu.com/ubuntu/';
      
      await NativeBridge.runInProot(
        'sed -i "s|URIs: http://archive.ubuntu.com/ubuntu/|URIs: $cnMirror|g" /etc/apt/sources.list.d/ubuntu.sources; '
        'sed -i "s|URIs: http://security.ubuntu.com/ubuntu/|URIs: $cnMirror|g" /etc/apt/sources.list.d/ubuntu.sources; '
        'echo "=== ubuntu.sources ==="; '
        'cat /etc/apt/sources.list.d/ubuntu.sources; '
        'echo "=== end ==="',
      );

      // Install bionic bypass + cwd-fix + node-wrapper BEFORE using node.
      // The wrapper patches process.cwd() which returns ENOSYS in proot.
      await NativeBridge.installBionicBypass();

      // Step 3: Install Node.js (45-80%)
      // Fix permissions inside proot (Java extraction may miss execute bits)
      _updateSetupNotification('Fixing rootfs permissions...', progress: 45);
      onProgress(const SetupState(
        step: SetupStep.installingNode,
        progress: 0.0,
        messageKey: 'fixingRootfsPermissions',
      ));
      // Blanket recursive chmod on all bin/lib directories.
      // Java tar extraction loses execute bits; dpkg needs tar, xz,
      // gzip, rm, mv, etc. — easier to fix everything than enumerate.
      await NativeBridge.runInProot(
        'chmod -R 755 /usr/bin /usr/sbin /bin /sbin '
        '/usr/local/bin /usr/local/sbin 2>/dev/null; '
        'chmod -R +x /usr/lib/apt/ /usr/lib/dpkg/ /usr/libexec/ '
        '/var/lib/dpkg/info/ /usr/share/debconf/ 2>/dev/null; '
        'chmod 755 /lib/*/ld-linux-*.so* /usr/lib/*/ld-linux-*.so* 2>/dev/null; '
        'mkdir -p /var/lib/dpkg/updates /var/lib/dpkg/triggers; '
        'echo permissions_fixed',
      );

      // --- Install base packages via apt-get (like Termux proot-distro) ---
      // Now that our proot matches Termux exactly (env -i, clean host env,
      // proper flags), dpkg works normally. No need for Java-side deb
      // extraction — let dpkg+tar handle it inside proot like Termux does.
      _updateSetupNotification('Updating package lists...', progress: 48);
      onProgress(const SetupState(
        step: SetupStep.installingNode,
        progress: 0.1,
        messageKey: 'updatingPackageLists',
      ));
      await NativeBridge.runInProot('apt-get update -y');

      _updateSetupNotification('Installing base packages...', progress: 52);
      onProgress(const SetupState(
        step: SetupStep.installingNode,
        progress: 0.15,
        messageKey: 'installingBasePackages',
      ));
      // ca-certificates: HTTPS for npm/git
      // git: openclaw has git deps (@whiskeysockets/libsignal-node)
      // python3, make, g++: node-gyp needs these to compile native addons
      //   (npm's bundled node-gyp runs as a JS module, not a spawned process,
      //    so proot-compat.js spawn mock can't intercept it)
      // dpkg extracts via tar inside proot — permissions are correct.
      // Post-install scripts (update-ca-certificates) run automatically.
      // Pre-configure tzdata to avoid interactive continent/timezone prompt
      // (tzdata is a dependency of python3 and ignores DEBIAN_FRONTEND on
      // first install if no timezone is pre-set).
      await NativeBridge.runInProot(
        'ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime && '
        'echo "Etc/UTC" > /etc/timezone',
      );
      await NativeBridge.runInProot(
        'apt-get install -y --no-install-recommends '
        'ca-certificates git python3 make g++ curl wget',
      );

      // Git config (.gitconfig) is written by installBionicBypass() on the
      // Java side — directly to $rootfsDir/root/.gitconfig — rewrites
      // SSH→HTTPS for npm git deps (no SSH keys in proot).

      // --- Install Node.js via binary tarball ---
      // Download from Tsinghua mirror (faster in China).
      // Includes node + npm + corepack.
      final nodeTarUrl = AppConstants.getNodeTarballUrlCN(arch);
      final nodeTarPath = '$filesDir/tmp/nodejs.tar.xz';

      onProgress(SetupState(
        step: SetupStep.installingNode,
        progress: 0.3,
        messageKey: 'downloadingNodejs',
        messageArgs: {'version': AppConstants.nodeVersion},
      ));
      _updateSetupNotification('Downloading Node.js...', progress: 55);
      await _dio.download(
        nodeTarUrl,
        nodeTarPath,
        onReceiveProgress: (received, total) {
          if (total > 0) {
            final progress = 0.3 + (received / total) * 0.4;
            final mb = (received / 1024 / 1024).toStringAsFixed(1);
            final totalMb = (total / 1024 / 1024).toStringAsFixed(1);
            // Map Node download to 55-70% of overall
            final notifProgress = 55 + ((received / total) * 15).round();
            _updateSetupNotification('Downloading Node.js: $mb / $totalMb MB', progress: notifProgress);
            onProgress(SetupState(
              step: SetupStep.installingNode,
              progress: progress,
              messageKey: 'downloadingNodejsProgress',
              messageArgs: {'current': mb, 'total': totalMb},
            ));
          }
        },
      );

      _updateSetupNotification('Extracting Node.js...', progress: 72);
      onProgress(const SetupState(
        step: SetupStep.installingNode,
        progress: 0.75,
        messageKey: 'extractingNodejs',
      ));
      await NativeBridge.extractNodeTarball(nodeTarPath);

      _updateSetupNotification('Verifying Node.js...', progress: 78);
      onProgress(const SetupState(
        step: SetupStep.installingNode,
        progress: 0.9,
        messageKey: 'verifyingNodejs',
      ));
      // node-wrapper.js patches broken proot syscalls before loading npm.
      // /usr/local/bin is on PATH, so node finds the tarball's npm.
      const wrapper = '/root/.openclaw/node-wrapper.js';
      const nodeRun = 'node $wrapper';
      // npm from nodejs.org tarball is at /usr/local/lib/node_modules/npm
      const npmCli = '/usr/local/lib/node_modules/npm/bin/npm-cli.js';
      await NativeBridge.runInProot(
        'node --version && $nodeRun $npmCli --version',
      );
      onProgress(const SetupState(
        step: SetupStep.installingNode,
        progress: 1.0,
        messageKey: 'nodejsInstalled',
      ));

      // Step 4: Install OpenClaw (80-98%)
      _updateSetupNotification('Installing OpenClaw...', progress: 82);
      onProgress(const SetupState(
        step: SetupStep.installingOpenClaw,
        progress: 0.0,
        messageKey: 'installingOpenClawWait',
      ));
      // Install openclaw — fork/exec works now with our Termux-matching proot.
      // 使用淘宝 npm 镜像加速下载
      await NativeBridge.runInProot(
        '$nodeRun $npmCli config set registry ${AppConstants.npmRegistryCN} && $nodeRun $npmCli install -g openclaw',
        timeout: 1800,
      );

      _updateSetupNotification('Creating bin wrappers...', progress: 92);
      onProgress(const SetupState(
        step: SetupStep.installingOpenClaw,
        progress: 0.7,
        messageKey: 'creatingBinWrappers',
      ));
      // npm global install creates symlinks for bin entries, but symlinks
      // can fail silently in proot. Create shell wrappers from Java side
      // (reads package.json directly from rootfs filesystem — no escaping).
      await NativeBridge.createBinWrappers('openclaw');

      _updateSetupNotification('Verifying OpenClaw...', progress: 96);
      onProgress(const SetupState(
        step: SetupStep.installingOpenClaw,
        progress: 0.9,
        messageKey: 'verifyingOpenClaw',
      ));
      await NativeBridge.runInProot('openclaw --version || echo openclaw_installed');
      onProgress(const SetupState(
        step: SetupStep.installingOpenClaw,
        progress: 1.0,
        messageKey: 'openClawInstalled',
      ));

      // Step 5: Bionic Bypass already installed (before node verification)
      _updateSetupNotification('Setup complete!', progress: 100);
      onProgress(const SetupState(
        step: SetupStep.configuringBypass,
        progress: 1.0,
        messageKey: 'bionicBypassConfigured',
      ));

      // Done
      _stopSetupService();
      onProgress(const SetupState(
        step: SetupStep.complete,
        progress: 1.0,
        messageKey: 'setupCompleteReady',
      ));
    } on DioException catch (e) {
      _stopSetupService();
      onProgress(SetupState(
        step: SetupStep.error,
        error: 'Download failed: ${e.message}. Check your internet connection.',
        messageKey: 'downloadFailed',
        messageArgs: {'error': e.message ?? 'Unknown error'},
      ));
    } catch (e) {
      _stopSetupService();
      onProgress(SetupState(
        step: SetupStep.error,
        error: 'Setup failed: $e',
        messageKey: 'setupFailed',
        messageArgs: {'error': e.toString()},
      ));
    }
  }
}