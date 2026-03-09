class AppConstants {
  static const String appName = 'OpenClaw';
  static const String version = '1.8.5';
  static const String packageName = 'com.nxg.openclawproot';

  /// Matches ANSI escape sequences (e.g. color codes in terminal output).
  static final ansiEscape = RegExp(r'\x1b\[[0-9;]*[a-zA-Z]');

  static const String authorName = 'Mithun Gowda B';
  static const String authorEmail = 'mithungowda.b7411@gmail.com';
  static const String githubUrl = 'https://github.com/mithun50/openclaw-termux';
  static const String license = 'MIT';

  static const String githubApiLatestRelease =
      'https://api.github.com/repos/mithun50/openclaw-termux/releases/latest';

  // NextGenX
  static const String orgName = 'NextGenX';
  static const String orgEmail = 'nxgextra@gmail.com';
  static const String instagramUrl = 'https://www.instagram.com/nexgenxplorer_nxg';
  static const String youtubeUrl = 'https://youtube.com/@nexgenxplorer?si=UG-wBC8UIyeT4bbw';
  static const String playStoreUrl = 'https://play.google.com/store/apps/dev?id=8262374975871504599';

  static const String gatewayHost = '127.0.0.1';
  static const int gatewayPort = 18789;
  static const String gatewayUrl = 'http://$gatewayHost:$gatewayPort';

  // ========== 中国镜像源配置 ==========
  // 使用清华源和淘宝源加速国内下载
  
  // Ubuntu rootfs - 清华源
  static const String ubuntuRootfsUrlCN =
      'https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cdimage/ubuntu-base/releases/24.04/release/ubuntu-base-24.04.3-base-';
  
  // Node.js - 清华源 (使用 http)
  static const String nodeBaseUrlCN =
      'http://mirrors.tuna.tsinghua.edu.cn/nodejs-release/v$nodeVersion/node-v$nodeVersion-linux-';
  
  // apt 软件源 - 中科大源 (Ubuntu 24.04 noble)
  // 传统格式，用于 /etc/apt/sources.list
  
  // x86_64 架构使用普通 ubuntu 源
  static const String aptSourcesListCN = '''
deb https://mirrors.ustc.edu.cn/ubuntu noble main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu noble-updates main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu noble-backports main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu noble-security main restricted universe multiverse
''';

  // ARM 架构 (aarch64, armhf) 使用 ubuntu-ports 源
  static const String aptSourcesListPortsCN = '''
deb https://mirrors.ustc.edu.cn/ubuntu-ports noble main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu-ports noble-updates main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu-ports noble-backports main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu-ports noble-security main restricted universe multiverse
''';

  // npm - 淘宝源 (使用 http)
  static const String npmRegistryCN = 'http://registry.npmmirror.com';

  // ========== 原始源配置（海外用户） ==========
  
  static const String ubuntuRootfsUrl =
      'https://cdimage.ubuntu.com/ubuntu-base/releases/24.04/release/ubuntu-base-24.04.3-base-';
  static const String rootfsArm64 = '${ubuntuRootfsUrl}arm64.tar.gz';
  static const String rootfsArmhf = '${ubuntuRootfsUrl}armhf.tar.gz';
  static const String rootfsAmd64 = '${ubuntuRootfsUrl}amd64.tar.gz';

  // Node.js binary tarball — downloaded directly by Flutter, extracted by Java.
  // Bypasses curl/gpg/NodeSource which fail inside proot.
  static const String nodeVersion = '22.13.1';
  static const String nodeBaseUrl =
      'https://nodejs.org/dist/v$nodeVersion/node-v$nodeVersion-linux-';

  static String getNodeTarballUrl(String arch) {
    switch (arch) {
      case 'aarch64':
        return '${nodeBaseUrl}arm64.tar.xz';
      case 'arm':
        return '${nodeBaseUrl}armv7l.tar.xz';
      case 'x86_64':
        return '${nodeBaseUrl}x64.tar.xz';
      default:
        return '${nodeBaseUrl}arm64.tar.xz';
    }
  }

  static const int healthCheckIntervalMs = 5000;
  static const int maxAutoRestarts = 5;

  // Node constants
  static const int wsReconnectBaseMs = 350;
  static const double wsReconnectMultiplier = 1.7;
  static const int wsReconnectCapMs = 8000;
  static const String nodeRole = 'node';
  static const int pairingTimeoutMs = 300000;

  static const String channelName = 'com.nxg.openclawproot/native';
  static const String eventChannelName = 'com.nxg.openclawproot/gateway_logs';

  static String getRootfsUrl(String arch) {
    switch (arch) {
      case 'aarch64':
        return rootfsArm64;
      case 'arm':
        return rootfsArmhf;
      case 'x86_64':
        return rootfsAmd64;
      default:
        return rootfsArm64;
    }
  }

  /// 获取国内镜像源的 Ubuntu rootfs URL
  static String getRootfsUrlCN(String arch) {
    switch (arch) {
      case 'aarch64':
        return '${ubuntuRootfsUrlCN}arm64.tar.gz';
      case 'arm':
        return '${ubuntuRootfsUrlCN}armhf.tar.gz';
      case 'x86_64':
        return '${ubuntuRootfsUrlCN}amd64.tar.gz';
      default:
        return '${ubuntuRootfsUrlCN}arm64.tar.gz';
    }
  }

  /// 获取国内镜像源的 Node.js tarball URL
  static String getNodeTarballUrlCN(String arch) {
    switch (arch) {
      case 'aarch64':
        return '${nodeBaseUrlCN}arm64.tar.xz';
      case 'arm':
        return '${nodeBaseUrlCN}armv7l.tar.xz';
      case 'x86_64':
        return '${nodeBaseUrlCN}x64.tar.xz';
      default:
        return '${nodeBaseUrlCN}arm64.tar.xz';
    }
  }
}
