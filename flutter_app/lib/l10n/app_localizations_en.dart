// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'OpenClaw';

  @override
  String get quickActions => 'QUICK ACTIONS';

  @override
  String get terminal => 'Terminal';

  @override
  String get terminalSubtitle => 'Open Ubuntu shell with OpenClaw';

  @override
  String get webDashboard => 'Web Dashboard';

  @override
  String get webDashboardSubtitle => 'Open OpenClaw dashboard in browser';

  @override
  String get startGatewayFirst => 'Start gateway first';

  @override
  String get token => 'Token';

  @override
  String get copyDashboardUrl => 'Copy dashboard URL';

  @override
  String get dashboardUrlCopied => 'Dashboard URL copied';

  @override
  String get onboarding => 'Onboarding';

  @override
  String get onboardingSubtitle => 'Configure API keys and binding';

  @override
  String get configure => 'Configure';

  @override
  String get configureSubtitle => 'Manage gateway settings';

  @override
  String get aiProviders => 'AI Providers';

  @override
  String get aiProvidersSubtitle => 'Configure models and API keys';

  @override
  String get packages => 'Packages';

  @override
  String get packagesSubtitle => 'Install optional tools (Go, Homebrew, SSH)';

  @override
  String get sshAccess => 'SSH Access';

  @override
  String get sshAccessSubtitle => 'Remote terminal access via SSH';

  @override
  String get logs => 'Logs';

  @override
  String get logsSubtitle => 'View gateway output and errors';

  @override
  String get snapshot => 'Snapshot';

  @override
  String get snapshotSubtitle => 'Backup or restore your config';

  @override
  String get node => 'Node';

  @override
  String get nodeConnectedToGateway => 'Connected to gateway';

  @override
  String get nodeDeviceCapabilities => 'Device capabilities for AI';

  @override
  String versionBy(String author, String org) {
    return 'by $author | $org';
  }

  @override
  String get settings => 'Settings';

  @override
  String get general => 'GENERAL';

  @override
  String get autoStartGateway => 'Auto-start gateway';

  @override
  String get autoStartGatewayDesc => 'Start the gateway when the app opens';

  @override
  String get batteryOptimization => 'Battery Optimization';

  @override
  String get batteryOptimized => 'Optimized (may kill background sessions)';

  @override
  String get batteryUnrestricted => 'Unrestricted (recommended)';

  @override
  String get setupStorage => 'Setup Storage';

  @override
  String get storageGranted =>
      'Granted — proot can access /sdcard. Revoke if not needed.';

  @override
  String get storageNotGranted => 'Allow access to shared storage';

  @override
  String get nodeSection => 'NODE';

  @override
  String get enableNode => 'Enable Node';

  @override
  String get enableNodeDesc => 'Provide device capabilities to the gateway';

  @override
  String get nodeConfiguration => 'Node Configuration';

  @override
  String get nodeConfigurationDesc => 'Connection, pairing, and capabilities';

  @override
  String get systemInfo => 'SYSTEM INFO';

  @override
  String get architecture => 'Architecture';

  @override
  String get prootPath => 'PRoot path';

  @override
  String get rootfs => 'Rootfs';

  @override
  String get installed => 'Installed';

  @override
  String get notInstalled => 'Not installed';

  @override
  String get nodejs => 'Node.js';

  @override
  String get openclaw => 'OpenClaw';

  @override
  String get goGolang => 'Go (Golang)';

  @override
  String get homebrew => 'Homebrew';

  @override
  String get openSSH => 'OpenSSH';

  @override
  String get maintenance => 'MAINTENANCE';

  @override
  String get exportSnapshot => 'Export Snapshot';

  @override
  String get exportSnapshotDesc => 'Backup config to Downloads';

  @override
  String get importSnapshot => 'Import Snapshot';

  @override
  String get importSnapshotDesc => 'Restore config from backup';

  @override
  String get rerunSetup => 'Re-run setup';

  @override
  String get rerunSetupDesc => 'Reinstall or repair the environment';

  @override
  String get about => 'ABOUT';

  @override
  String get aiGatewayForAndroid => 'AI Gateway for Android';

  @override
  String get checkForUpdates => 'Check for Updates';

  @override
  String get checkForUpdatesDesc => 'Check GitHub for a newer release';

  @override
  String get developer => 'Developer';

  @override
  String get gitHub => 'GitHub';

  @override
  String get contact => 'Contact';

  @override
  String get license => 'License';

  @override
  String get instagram => 'Instagram';

  @override
  String get youTube => 'YouTube';

  @override
  String get playStore => 'Play Store';

  @override
  String get email => 'Email';

  @override
  String snapshotSaved(String path) {
    return 'Snapshot saved to $path';
  }

  @override
  String exportFailed(String error) {
    return 'Export failed: $error';
  }

  @override
  String noSnapshotFound(String path) {
    return 'No snapshot found at $path';
  }

  @override
  String get snapshotRestored =>
      'Snapshot restored successfully. Restart the gateway to apply.';

  @override
  String importFailed(String error) {
    return 'Import failed: $error';
  }

  @override
  String get updateAvailable => 'Update Available';

  @override
  String updateAvailableDesc(String current, String latest) {
    return 'A new version is available.\n\nCurrent: $current\nLatest: $latest';
  }

  @override
  String get later => 'Later';

  @override
  String get download => 'Download';

  @override
  String get onLatestVersion => 'You\'re on the latest version';

  @override
  String get couldNotCheckUpdates => 'Could not check for updates';

  @override
  String get gateway => 'Gateway';

  @override
  String get running => 'Running';

  @override
  String get starting => 'Starting';

  @override
  String get error => 'Error';

  @override
  String get stopped => 'Stopped';

  @override
  String get copyUrl => 'Copy URL';

  @override
  String get urlCopiedToClipboard => 'URL copied to clipboard';

  @override
  String get openDashboard => 'Open dashboard';

  @override
  String get startGateway => 'Start Gateway';

  @override
  String get stopGateway => 'Stop Gateway';

  @override
  String get viewLogs => 'View Logs';

  @override
  String get setupOpenClaw => 'Setup OpenClaw';

  @override
  String get setupDescNotStarted =>
      'This will download Ubuntu, Node.js, and OpenClaw into a self-contained environment.';

  @override
  String get setupDescStarted =>
      'Setting up the environment. This may take several minutes.';

  @override
  String get downloadUbuntuRootfs => 'Download Ubuntu rootfs';

  @override
  String get extractRootfs => 'Extract rootfs';

  @override
  String get installNodejs => 'Install Node.js';

  @override
  String get installOpenClaw => 'Install OpenClaw';

  @override
  String get configureBionicBypass => 'Configure Bionic Bypass';

  @override
  String get setupComplete => 'Setup complete!';

  @override
  String get optionalPackages => 'OPTIONAL PACKAGES';

  @override
  String get beginSetup => 'Begin Setup';

  @override
  String get retrySetup => 'Retry Setup';

  @override
  String get configureApiKeys => 'Configure API Keys';

  @override
  String get requiresStorage =>
      'Requires ~500MB of storage and an internet connection';

  @override
  String get install => 'Install';

  @override
  String get uninstall => 'Uninstall';

  @override
  String get nodeConfigurationTitle => 'Node Configuration';

  @override
  String get gatewayConnection => 'GATEWAY CONNECTION';

  @override
  String get localGateway => 'Local Gateway';

  @override
  String get localGatewayDesc => 'Auto-pair with gateway on this device';

  @override
  String get remoteGateway => 'Remote Gateway';

  @override
  String get remoteGatewayDesc => 'Connect to a gateway on another device';

  @override
  String get gatewayHost => 'Gateway Host';

  @override
  String get gatewayPort => 'Gateway Port';

  @override
  String get gatewayToken => 'Gateway Token';

  @override
  String get gatewayTokenHint => 'Paste token from gateway dashboard URL';

  @override
  String get gatewayTokenHelper => 'Found in dashboard URL after #token=';

  @override
  String get connect => 'Connect';

  @override
  String get pairing => 'PAIRING';

  @override
  String get approveCodeOnGateway => 'Approve this code on the gateway:';

  @override
  String get capabilities => 'CAPABILITIES';

  @override
  String get camera => 'Camera';

  @override
  String get cameraDesc => 'Capture photos and video clips';

  @override
  String get canvas => 'Canvas';

  @override
  String get canvasDesc => 'Not available on mobile';

  @override
  String get location => 'Location';

  @override
  String get locationDesc => 'Get device GPS coordinates';

  @override
  String get screenRecording => 'Screen Recording';

  @override
  String get screenRecordingDesc =>
      'Record device screen (requires consent each time)';

  @override
  String get flashlight => 'Flashlight';

  @override
  String get flashlightDesc => 'Toggle device torch on/off';

  @override
  String get vibration => 'Vibration';

  @override
  String get vibrationDesc => 'Trigger haptic feedback and vibration patterns';

  @override
  String get sensors => 'Sensors';

  @override
  String get sensorsDesc =>
      'Read accelerometer, gyroscope, magnetometer, barometer';

  @override
  String get serial => 'Serial';

  @override
  String get serialDesc => 'Bluetooth and USB serial communication';

  @override
  String get deviceInfo => 'DEVICE INFO';

  @override
  String get deviceId => 'Device ID';

  @override
  String get nodeLogs => 'NODE LOGS';

  @override
  String get noLogsYet => 'No logs yet';

  @override
  String get paired => 'Paired';

  @override
  String get connecting => 'Connecting';

  @override
  String get enableNodeButton => 'Enable Node';

  @override
  String get disableNodeButton => 'Disable Node';

  @override
  String get activeModel => 'Active Model';

  @override
  String get selectProviderToConfigure =>
      'Select a provider to configure its API key and model.';

  @override
  String get active => 'Active';

  @override
  String get configured => 'Configured';

  @override
  String get apiKey => 'API Key';

  @override
  String get model => 'Model';

  @override
  String get saveAndActivate => 'Save & Activate';

  @override
  String get removeConfiguration => 'Remove Configuration';

  @override
  String get sshAccessTitle => 'SSH Access';

  @override
  String get serviceControl => 'SERVICE CONTROL';

  @override
  String get sshServerRunning => 'SSH server running';

  @override
  String get sshServerStopped => 'SSH server stopped';

  @override
  String get port => 'Port';

  @override
  String get startServer => 'Start Server';

  @override
  String get stopServer => 'Stop Server';

  @override
  String get rootPassword => 'ROOT PASSWORD';

  @override
  String get setRootPasswordDesc => 'Set the root password for SSH login.';

  @override
  String get newPassword => 'New password';

  @override
  String get enterPassword => 'Enter password';

  @override
  String get setPassword => 'Set Password';

  @override
  String get passwordCannotBeEmpty => 'Password cannot be empty';

  @override
  String get rootPasswordUpdated => 'Root password updated';

  @override
  String failedToSetPassword(String error) {
    return 'Failed to set password: $error';
  }

  @override
  String get connectionInfo => 'CONNECTION INFO';

  @override
  String get user => 'User';

  @override
  String get ipAddresses => 'IP Addresses';

  @override
  String get connectFromAnotherDevice => 'Connect from another device:';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get openSshNotInstalled => 'OpenSSH not installed';

  @override
  String get openSshNotInstalledDesc =>
      'Install the OpenSSH package first from the Packages screen.';

  @override
  String get openPackages => 'Open Packages';

  @override
  String get gatewayLogs => 'Gateway Logs';

  @override
  String get filterLogs => 'Filter logs...';

  @override
  String get noLogsYetStartGateway => 'No logs yet. Start the gateway.';

  @override
  String get noMatchingLogs => 'No matching logs.';

  @override
  String get logsCopiedToClipboard => 'Logs copied to clipboard';

  @override
  String get screenshot => 'Screenshot';

  @override
  String get autoScrollOn => 'Auto-scroll on';

  @override
  String get autoScrollOff => 'Auto-scroll off';

  @override
  String get copyAllLogs => 'Copy all logs';

  @override
  String screenshotSaved(String filename) {
    return 'Screenshot saved: $filename';
  }

  @override
  String get failedToCaptureScreenshot => 'Failed to capture screenshot';

  @override
  String get optionalPackagesTitle => 'Optional Packages';

  @override
  String get goDesc => 'Go programming language compiler and tools';

  @override
  String get homebrewDesc => 'The missing package manager for Linux';

  @override
  String get openSshDesc => 'Secure shell client and server';

  @override
  String get loading => 'Loading...';

  @override
  String get retry => 'Retry';

  @override
  String get done => 'Done';

  @override
  String get startingDotdotdot => 'Starting...';

  @override
  String get loadingDotdotdot => 'Loading...';

  @override
  String get splashLoading => 'Loading...';

  @override
  String get checkingSetupStatus => 'Checking setup status...';

  @override
  String get terminalTitle => 'Terminal';

  @override
  String get startingTerminal => 'Starting terminal...';

  @override
  String get webDashboardTitle => 'Web Dashboard';

  @override
  String get failedToLoadDashboard => 'Failed to load dashboard';

  @override
  String get openclawConfigure => 'OpenClaw Configure';

  @override
  String get startingConfigure => 'Starting configure...';

  @override
  String get openclawOnboarding => 'OpenClaw Onboarding';

  @override
  String get startingOnboarding => 'Starting onboarding...';

  @override
  String get copiedToClipboardMsg => 'Copied to clipboard';

  @override
  String get providerAnthropic => 'Anthropic';

  @override
  String get providerAnthropicDesc =>
      'Claude models — advanced reasoning and coding';

  @override
  String get providerOpenai => 'OpenAI';

  @override
  String get providerOpenaiDesc => 'GPT and o-series models';

  @override
  String get providerGoogle => 'Google Gemini';

  @override
  String get providerGoogleDesc => 'Gemini family of multimodal models';

  @override
  String get providerOpenrouter => 'OpenRouter';

  @override
  String get providerOpenrouterDesc => 'Unified API for hundreds of models';

  @override
  String get providerNvidia => 'NVIDIA NIM';

  @override
  String get providerNvidiaDesc => 'GPU-optimized inference endpoints';

  @override
  String get providerDeepseek => 'DeepSeek';

  @override
  String get providerDeepseekDesc => 'High-performance open models';

  @override
  String get providerXai => 'xAI';

  @override
  String get providerXaiDesc => 'Grok models from xAI';

  @override
  String get esc => 'ESC';

  @override
  String get ctrl => 'CTRL';

  @override
  String get alt => 'ALT';

  @override
  String get tab => 'TAB';

  @override
  String get enter => 'ENTER';

  @override
  String get home => 'HOME';

  @override
  String get end => 'END';

  @override
  String get cancel => 'Cancel';

  @override
  String uninstallConfirmTitle(String package) {
    return 'Uninstall $package?';
  }

  @override
  String uninstallConfirmDesc(String package) {
    return 'This will remove $package from the environment.';
  }

  @override
  String get openLink => 'Open Link';

  @override
  String get open => 'Open';

  @override
  String get copy => 'Copy';

  @override
  String get paste => 'Paste';

  @override
  String get openUrl => 'Open URL';

  @override
  String get linkCopied => 'Link copied';

  @override
  String get noUrlFound => 'No URL found in selection';

  @override
  String get goToDashboard => 'Go to Dashboard';

  @override
  String get apiKeyCannotBeEmpty => 'API key cannot be empty';

  @override
  String get modelNameCannotBeEmpty => 'Model name cannot be empty';

  @override
  String providerConfiguredAndActivated(String provider) {
    return '$provider configured and activated';
  }

  @override
  String failedToSave(String error) {
    return 'Failed to save: $error';
  }

  @override
  String removeProviderTitle(String provider) {
    return 'Remove $provider?';
  }

  @override
  String get removeProviderDesc =>
      'This will delete the API key and deactivate the model.';

  @override
  String get remove => 'Remove';

  @override
  String providerRemoved(String provider) {
    return '$provider removed';
  }

  @override
  String failedToRemove(String error) {
    return 'Failed to remove: $error';
  }

  @override
  String get customModel => 'Custom...';

  @override
  String get customModelHint => 'e.g. meta/llama-3.3-70b-instruct';

  @override
  String get customModelName => 'Custom model name';

  @override
  String get checkingStatus => 'Checking status...';

  @override
  String get settingUpDirectories => 'Setting up directories...';

  @override
  String get downloadingUbuntuRootfs => 'Downloading Ubuntu rootfs...';

  @override
  String downloadingRootfs(String current, String total) {
    return 'Downloading rootfs: $current / $total MB';
  }

  @override
  String downloadingProgress(String current, String total) {
    return 'Downloading: $current MB / $total MB';
  }

  @override
  String get extractingRootfsWait =>
      'Extracting rootfs (this takes a while)...';

  @override
  String get rootfsExtracted => 'Rootfs extracted';

  @override
  String get fixingRootfsPermissions => 'Fixing rootfs permissions...';

  @override
  String get updatingPackageLists => 'Updating package lists...';

  @override
  String get installingBasePackages => 'Installing base packages...';

  @override
  String get downloadingNodejs => 'Downloading Node.js...';

  @override
  String downloadingNodejsProgress(String current, String total) {
    return 'Downloading Node.js: $current / $total MB';
  }

  @override
  String get extractingNodejs => 'Extracting Node.js...';

  @override
  String get verifyingNodejs => 'Verifying Node.js...';

  @override
  String get nodejsInstalled => 'Node.js installed';

  @override
  String get installingOpenClawWait =>
      'Installing OpenClaw (this may take a few minutes)...';

  @override
  String get creatingBinWrappers => 'Creating bin wrappers...';

  @override
  String get verifyingOpenClaw => 'Verifying OpenClaw...';

  @override
  String get openClawInstalled => 'OpenClaw installed';

  @override
  String get bionicBypassConfigured => 'Bionic Bypass configured';

  @override
  String get setupCompleteReady =>
      'Setup complete! Ready to start the gateway.';

  @override
  String get setupRequired => 'Setup required';

  @override
  String downloadFailed(String error) {
    return 'Download failed: $error. Check your internet connection.';
  }

  @override
  String setupFailed(String error) {
    return 'Setup failed: $error';
  }

  @override
  String failedToCheckStatus(String error) {
    return 'Failed to check status: $error';
  }
}
