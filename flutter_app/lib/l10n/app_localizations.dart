import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh')
  ];

  /// App name
  ///
  /// In en, this message translates to:
  /// **'OpenClaw'**
  String get appName;

  /// Quick actions section header
  ///
  /// In en, this message translates to:
  /// **'QUICK ACTIONS'**
  String get quickActions;

  /// Terminal menu item
  ///
  /// In en, this message translates to:
  /// **'Terminal'**
  String get terminal;

  /// Terminal subtitle
  ///
  /// In en, this message translates to:
  /// **'Open Ubuntu shell with OpenClaw'**
  String get terminalSubtitle;

  /// Web dashboard menu item
  ///
  /// In en, this message translates to:
  /// **'Web Dashboard'**
  String get webDashboard;

  /// Web dashboard subtitle
  ///
  /// In en, this message translates to:
  /// **'Open OpenClaw dashboard in browser'**
  String get webDashboardSubtitle;

  /// Hint to start gateway
  ///
  /// In en, this message translates to:
  /// **'Start gateway first'**
  String get startGatewayFirst;

  /// Token label
  ///
  /// In en, this message translates to:
  /// **'Token'**
  String get token;

  /// Tooltip for copy URL button
  ///
  /// In en, this message translates to:
  /// **'Copy dashboard URL'**
  String get copyDashboardUrl;

  /// Snackbar message
  ///
  /// In en, this message translates to:
  /// **'Dashboard URL copied'**
  String get dashboardUrlCopied;

  /// Onboarding menu item
  ///
  /// In en, this message translates to:
  /// **'Onboarding'**
  String get onboarding;

  /// Onboarding subtitle
  ///
  /// In en, this message translates to:
  /// **'Configure API keys and binding'**
  String get onboardingSubtitle;

  /// Configure menu item
  ///
  /// In en, this message translates to:
  /// **'Configure'**
  String get configure;

  /// Configure subtitle
  ///
  /// In en, this message translates to:
  /// **'Manage gateway settings'**
  String get configureSubtitle;

  /// AI providers menu item
  ///
  /// In en, this message translates to:
  /// **'AI Providers'**
  String get aiProviders;

  /// AI providers subtitle
  ///
  /// In en, this message translates to:
  /// **'Configure models and API keys'**
  String get aiProvidersSubtitle;

  /// Packages menu item
  ///
  /// In en, this message translates to:
  /// **'Packages'**
  String get packages;

  /// Packages subtitle
  ///
  /// In en, this message translates to:
  /// **'Install optional tools (Go, Homebrew, SSH)'**
  String get packagesSubtitle;

  /// SSH access menu item
  ///
  /// In en, this message translates to:
  /// **'SSH Access'**
  String get sshAccess;

  /// SSH access subtitle
  ///
  /// In en, this message translates to:
  /// **'Remote terminal access via SSH'**
  String get sshAccessSubtitle;

  /// Logs menu item
  ///
  /// In en, this message translates to:
  /// **'Logs'**
  String get logs;

  /// Logs subtitle
  ///
  /// In en, this message translates to:
  /// **'View gateway output and errors'**
  String get logsSubtitle;

  /// Snapshot menu item
  ///
  /// In en, this message translates to:
  /// **'Snapshot'**
  String get snapshot;

  /// Snapshot subtitle
  ///
  /// In en, this message translates to:
  /// **'Backup or restore your config'**
  String get snapshotSubtitle;

  /// Node menu item
  ///
  /// In en, this message translates to:
  /// **'Node'**
  String get node;

  /// Node status when connected
  ///
  /// In en, this message translates to:
  /// **'Connected to gateway'**
  String get nodeConnectedToGateway;

  /// Node subtitle when disabled
  ///
  /// In en, this message translates to:
  /// **'Device capabilities for AI'**
  String get nodeDeviceCapabilities;

  /// Version info
  ///
  /// In en, this message translates to:
  /// **'by {author} | {org}'**
  String versionBy(String author, String org);

  /// Settings screen title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// General settings section
  ///
  /// In en, this message translates to:
  /// **'GENERAL'**
  String get general;

  /// Auto-start setting
  ///
  /// In en, this message translates to:
  /// **'Auto-start gateway'**
  String get autoStartGateway;

  /// Auto-start setting description
  ///
  /// In en, this message translates to:
  /// **'Start the gateway when the app opens'**
  String get autoStartGatewayDesc;

  /// Battery optimization setting
  ///
  /// In en, this message translates to:
  /// **'Battery Optimization'**
  String get batteryOptimization;

  /// Battery optimized status
  ///
  /// In en, this message translates to:
  /// **'Optimized (may kill background sessions)'**
  String get batteryOptimized;

  /// Battery unrestricted status
  ///
  /// In en, this message translates to:
  /// **'Unrestricted (recommended)'**
  String get batteryUnrestricted;

  /// Storage setup setting
  ///
  /// In en, this message translates to:
  /// **'Setup Storage'**
  String get setupStorage;

  /// Storage granted status
  ///
  /// In en, this message translates to:
  /// **'Granted — proot can access /sdcard. Revoke if not needed.'**
  String get storageGranted;

  /// Storage not granted status
  ///
  /// In en, this message translates to:
  /// **'Allow access to shared storage'**
  String get storageNotGranted;

  /// Node settings section
  ///
  /// In en, this message translates to:
  /// **'NODE'**
  String get nodeSection;

  /// Enable node setting
  ///
  /// In en, this message translates to:
  /// **'Enable Node'**
  String get enableNode;

  /// Enable node description
  ///
  /// In en, this message translates to:
  /// **'Provide device capabilities to the gateway'**
  String get enableNodeDesc;

  /// Node configuration menu
  ///
  /// In en, this message translates to:
  /// **'Node Configuration'**
  String get nodeConfiguration;

  /// Node configuration description
  ///
  /// In en, this message translates to:
  /// **'Connection, pairing, and capabilities'**
  String get nodeConfigurationDesc;

  /// System info section
  ///
  /// In en, this message translates to:
  /// **'SYSTEM INFO'**
  String get systemInfo;

  /// Architecture label
  ///
  /// In en, this message translates to:
  /// **'Architecture'**
  String get architecture;

  /// PRoot path label
  ///
  /// In en, this message translates to:
  /// **'PRoot path'**
  String get prootPath;

  /// Rootfs label
  ///
  /// In en, this message translates to:
  /// **'Rootfs'**
  String get rootfs;

  /// Installed status
  ///
  /// In en, this message translates to:
  /// **'Installed'**
  String get installed;

  /// Not installed status
  ///
  /// In en, this message translates to:
  /// **'Not installed'**
  String get notInstalled;

  /// Node.js label
  ///
  /// In en, this message translates to:
  /// **'Node.js'**
  String get nodejs;

  /// OpenClaw label
  ///
  /// In en, this message translates to:
  /// **'OpenClaw'**
  String get openclaw;

  /// Go label
  ///
  /// In en, this message translates to:
  /// **'Go (Golang)'**
  String get goGolang;

  /// Homebrew label
  ///
  /// In en, this message translates to:
  /// **'Homebrew'**
  String get homebrew;

  /// OpenSSH label
  ///
  /// In en, this message translates to:
  /// **'OpenSSH'**
  String get openSSH;

  /// Maintenance section
  ///
  /// In en, this message translates to:
  /// **'MAINTENANCE'**
  String get maintenance;

  /// Export snapshot menu
  ///
  /// In en, this message translates to:
  /// **'Export Snapshot'**
  String get exportSnapshot;

  /// Export snapshot description
  ///
  /// In en, this message translates to:
  /// **'Backup config to Downloads'**
  String get exportSnapshotDesc;

  /// Import snapshot menu
  ///
  /// In en, this message translates to:
  /// **'Import Snapshot'**
  String get importSnapshot;

  /// Import snapshot description
  ///
  /// In en, this message translates to:
  /// **'Restore config from backup'**
  String get importSnapshotDesc;

  /// Re-run setup menu
  ///
  /// In en, this message translates to:
  /// **'Re-run setup'**
  String get rerunSetup;

  /// Re-run setup description
  ///
  /// In en, this message translates to:
  /// **'Reinstall or repair the environment'**
  String get rerunSetupDesc;

  /// About section
  ///
  /// In en, this message translates to:
  /// **'ABOUT'**
  String get about;

  /// App subtitle
  ///
  /// In en, this message translates to:
  /// **'AI Gateway for Android'**
  String get aiGatewayForAndroid;

  /// Check updates menu
  ///
  /// In en, this message translates to:
  /// **'Check for Updates'**
  String get checkForUpdates;

  /// Check updates description
  ///
  /// In en, this message translates to:
  /// **'Check GitHub for a newer release'**
  String get checkForUpdatesDesc;

  /// Developer label
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get developer;

  /// GitHub menu
  ///
  /// In en, this message translates to:
  /// **'GitHub'**
  String get gitHub;

  /// Contact menu
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// License label
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get license;

  /// Instagram menu
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get instagram;

  /// YouTube menu
  ///
  /// In en, this message translates to:
  /// **'YouTube'**
  String get youTube;

  /// Play Store menu
  ///
  /// In en, this message translates to:
  /// **'Play Store'**
  String get playStore;

  /// Email label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Snapshot saved message
  ///
  /// In en, this message translates to:
  /// **'Snapshot saved to {path}'**
  String snapshotSaved(String path);

  /// Export failed message
  ///
  /// In en, this message translates to:
  /// **'Export failed: {error}'**
  String exportFailed(String error);

  /// No snapshot message
  ///
  /// In en, this message translates to:
  /// **'No snapshot found at {path}'**
  String noSnapshotFound(String path);

  /// Snapshot restored message
  ///
  /// In en, this message translates to:
  /// **'Snapshot restored successfully. Restart the gateway to apply.'**
  String get snapshotRestored;

  /// Import failed message
  ///
  /// In en, this message translates to:
  /// **'Import failed: {error}'**
  String importFailed(String error);

  /// Update dialog title
  ///
  /// In en, this message translates to:
  /// **'Update Available'**
  String get updateAvailable;

  /// Update available message
  ///
  /// In en, this message translates to:
  /// **'A new version is available.\n\nCurrent: {current}\nLatest: {latest}'**
  String updateAvailableDesc(String current, String latest);

  /// Later button
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get later;

  /// Download button
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// Already on latest version message
  ///
  /// In en, this message translates to:
  /// **'You\'re on the latest version'**
  String get onLatestVersion;

  /// Check updates failed message
  ///
  /// In en, this message translates to:
  /// **'Could not check for updates'**
  String get couldNotCheckUpdates;

  /// Gateway label
  ///
  /// In en, this message translates to:
  /// **'Gateway'**
  String get gateway;

  /// Running status
  ///
  /// In en, this message translates to:
  /// **'Running'**
  String get running;

  /// Starting status
  ///
  /// In en, this message translates to:
  /// **'Starting'**
  String get starting;

  /// Error status
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// Stopped status
  ///
  /// In en, this message translates to:
  /// **'Stopped'**
  String get stopped;

  /// Copy URL tooltip
  ///
  /// In en, this message translates to:
  /// **'Copy URL'**
  String get copyUrl;

  /// URL copied message
  ///
  /// In en, this message translates to:
  /// **'URL copied to clipboard'**
  String get urlCopiedToClipboard;

  /// Open dashboard tooltip
  ///
  /// In en, this message translates to:
  /// **'Open dashboard'**
  String get openDashboard;

  /// Start gateway button
  ///
  /// In en, this message translates to:
  /// **'Start Gateway'**
  String get startGateway;

  /// Stop gateway button
  ///
  /// In en, this message translates to:
  /// **'Stop Gateway'**
  String get stopGateway;

  /// View logs button
  ///
  /// In en, this message translates to:
  /// **'View Logs'**
  String get viewLogs;

  /// Setup screen title
  ///
  /// In en, this message translates to:
  /// **'Setup OpenClaw'**
  String get setupOpenClaw;

  /// Setup description when not started
  ///
  /// In en, this message translates to:
  /// **'This will download Ubuntu, Node.js, and OpenClaw into a self-contained environment.'**
  String get setupDescNotStarted;

  /// Setup description when started
  ///
  /// In en, this message translates to:
  /// **'Setting up the environment. This may take several minutes.'**
  String get setupDescStarted;

  /// Setup step
  ///
  /// In en, this message translates to:
  /// **'Download Ubuntu rootfs'**
  String get downloadUbuntuRootfs;

  /// Setup step
  ///
  /// In en, this message translates to:
  /// **'Extract rootfs'**
  String get extractRootfs;

  /// Setup step
  ///
  /// In en, this message translates to:
  /// **'Install Node.js'**
  String get installNodejs;

  /// Setup step
  ///
  /// In en, this message translates to:
  /// **'Install OpenClaw'**
  String get installOpenClaw;

  /// Setup step
  ///
  /// In en, this message translates to:
  /// **'Configure Bionic Bypass'**
  String get configureBionicBypass;

  /// Setup complete message
  ///
  /// In en, this message translates to:
  /// **'Setup complete!'**
  String get setupComplete;

  /// Optional packages section
  ///
  /// In en, this message translates to:
  /// **'OPTIONAL PACKAGES'**
  String get optionalPackages;

  /// Begin setup button
  ///
  /// In en, this message translates to:
  /// **'Begin Setup'**
  String get beginSetup;

  /// Retry setup button
  ///
  /// In en, this message translates to:
  /// **'Retry Setup'**
  String get retrySetup;

  /// Configure API keys button
  ///
  /// In en, this message translates to:
  /// **'Configure API Keys'**
  String get configureApiKeys;

  /// Storage requirement hint
  ///
  /// In en, this message translates to:
  /// **'Requires ~500MB of storage and an internet connection'**
  String get requiresStorage;

  /// Install button
  ///
  /// In en, this message translates to:
  /// **'Install'**
  String get install;

  /// Uninstall button
  ///
  /// In en, this message translates to:
  /// **'Uninstall'**
  String get uninstall;

  /// Node screen title
  ///
  /// In en, this message translates to:
  /// **'Node Configuration'**
  String get nodeConfigurationTitle;

  /// Gateway connection section
  ///
  /// In en, this message translates to:
  /// **'GATEWAY CONNECTION'**
  String get gatewayConnection;

  /// Local gateway option
  ///
  /// In en, this message translates to:
  /// **'Local Gateway'**
  String get localGateway;

  /// Local gateway description
  ///
  /// In en, this message translates to:
  /// **'Auto-pair with gateway on this device'**
  String get localGatewayDesc;

  /// Remote gateway option
  ///
  /// In en, this message translates to:
  /// **'Remote Gateway'**
  String get remoteGateway;

  /// Remote gateway description
  ///
  /// In en, this message translates to:
  /// **'Connect to a gateway on another device'**
  String get remoteGatewayDesc;

  /// Gateway host input label
  ///
  /// In en, this message translates to:
  /// **'Gateway Host'**
  String get gatewayHost;

  /// Gateway port input label
  ///
  /// In en, this message translates to:
  /// **'Gateway Port'**
  String get gatewayPort;

  /// Gateway token input label
  ///
  /// In en, this message translates to:
  /// **'Gateway Token'**
  String get gatewayToken;

  /// Gateway token hint
  ///
  /// In en, this message translates to:
  /// **'Paste token from gateway dashboard URL'**
  String get gatewayTokenHint;

  /// Gateway token helper text
  ///
  /// In en, this message translates to:
  /// **'Found in dashboard URL after #token='**
  String get gatewayTokenHelper;

  /// Connect button
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect;

  /// Pairing section
  ///
  /// In en, this message translates to:
  /// **'PAIRING'**
  String get pairing;

  /// Pairing instruction
  ///
  /// In en, this message translates to:
  /// **'Approve this code on the gateway:'**
  String get approveCodeOnGateway;

  /// Capabilities section
  ///
  /// In en, this message translates to:
  /// **'CAPABILITIES'**
  String get capabilities;

  /// Camera capability
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// Camera capability description
  ///
  /// In en, this message translates to:
  /// **'Capture photos and video clips'**
  String get cameraDesc;

  /// Canvas capability
  ///
  /// In en, this message translates to:
  /// **'Canvas'**
  String get canvas;

  /// Canvas capability description
  ///
  /// In en, this message translates to:
  /// **'Not available on mobile'**
  String get canvasDesc;

  /// Location capability
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// Location capability description
  ///
  /// In en, this message translates to:
  /// **'Get device GPS coordinates'**
  String get locationDesc;

  /// Screen recording capability
  ///
  /// In en, this message translates to:
  /// **'Screen Recording'**
  String get screenRecording;

  /// Screen recording description
  ///
  /// In en, this message translates to:
  /// **'Record device screen (requires consent each time)'**
  String get screenRecordingDesc;

  /// Flashlight capability
  ///
  /// In en, this message translates to:
  /// **'Flashlight'**
  String get flashlight;

  /// Flashlight description
  ///
  /// In en, this message translates to:
  /// **'Toggle device torch on/off'**
  String get flashlightDesc;

  /// Vibration capability
  ///
  /// In en, this message translates to:
  /// **'Vibration'**
  String get vibration;

  /// Vibration description
  ///
  /// In en, this message translates to:
  /// **'Trigger haptic feedback and vibration patterns'**
  String get vibrationDesc;

  /// Sensors capability
  ///
  /// In en, this message translates to:
  /// **'Sensors'**
  String get sensors;

  /// Sensors description
  ///
  /// In en, this message translates to:
  /// **'Read accelerometer, gyroscope, magnetometer, barometer'**
  String get sensorsDesc;

  /// Serial capability
  ///
  /// In en, this message translates to:
  /// **'Serial'**
  String get serial;

  /// Serial description
  ///
  /// In en, this message translates to:
  /// **'Bluetooth and USB serial communication'**
  String get serialDesc;

  /// Device info section
  ///
  /// In en, this message translates to:
  /// **'DEVICE INFO'**
  String get deviceInfo;

  /// Device ID label
  ///
  /// In en, this message translates to:
  /// **'Device ID'**
  String get deviceId;

  /// Node logs section
  ///
  /// In en, this message translates to:
  /// **'NODE LOGS'**
  String get nodeLogs;

  /// No logs message
  ///
  /// In en, this message translates to:
  /// **'No logs yet'**
  String get noLogsYet;

  /// Paired status
  ///
  /// In en, this message translates to:
  /// **'Paired'**
  String get paired;

  /// Connecting status
  ///
  /// In en, this message translates to:
  /// **'Connecting'**
  String get connecting;

  /// Enable node button
  ///
  /// In en, this message translates to:
  /// **'Enable Node'**
  String get enableNodeButton;

  /// Disable node button
  ///
  /// In en, this message translates to:
  /// **'Disable Node'**
  String get disableNodeButton;

  /// Active model label
  ///
  /// In en, this message translates to:
  /// **'Active Model'**
  String get activeModel;

  /// Provider selection hint
  ///
  /// In en, this message translates to:
  /// **'Select a provider to configure its API key and model.'**
  String get selectProviderToConfigure;

  /// Active status
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// Configured status
  ///
  /// In en, this message translates to:
  /// **'Configured'**
  String get configured;

  /// API key label
  ///
  /// In en, this message translates to:
  /// **'API Key'**
  String get apiKey;

  /// Model label
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get model;

  /// Save and activate button
  ///
  /// In en, this message translates to:
  /// **'Save & Activate'**
  String get saveAndActivate;

  /// Remove configuration button
  ///
  /// In en, this message translates to:
  /// **'Remove Configuration'**
  String get removeConfiguration;

  /// SSH screen title
  ///
  /// In en, this message translates to:
  /// **'SSH Access'**
  String get sshAccessTitle;

  /// Service control section
  ///
  /// In en, this message translates to:
  /// **'SERVICE CONTROL'**
  String get serviceControl;

  /// SSH server running status
  ///
  /// In en, this message translates to:
  /// **'SSH server running'**
  String get sshServerRunning;

  /// SSH server stopped status
  ///
  /// In en, this message translates to:
  /// **'SSH server stopped'**
  String get sshServerStopped;

  /// Port label
  ///
  /// In en, this message translates to:
  /// **'Port'**
  String get port;

  /// Start server button
  ///
  /// In en, this message translates to:
  /// **'Start Server'**
  String get startServer;

  /// Stop server button
  ///
  /// In en, this message translates to:
  /// **'Stop Server'**
  String get stopServer;

  /// Root password section
  ///
  /// In en, this message translates to:
  /// **'ROOT PASSWORD'**
  String get rootPassword;

  /// Root password description
  ///
  /// In en, this message translates to:
  /// **'Set the root password for SSH login.'**
  String get setRootPasswordDesc;

  /// New password label
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// Enter password hint
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get enterPassword;

  /// Set password button
  ///
  /// In en, this message translates to:
  /// **'Set Password'**
  String get setPassword;

  /// Password empty error
  ///
  /// In en, this message translates to:
  /// **'Password cannot be empty'**
  String get passwordCannotBeEmpty;

  /// Password updated message
  ///
  /// In en, this message translates to:
  /// **'Root password updated'**
  String get rootPasswordUpdated;

  /// Set password failed message
  ///
  /// In en, this message translates to:
  /// **'Failed to set password: {error}'**
  String failedToSetPassword(String error);

  /// Connection info section
  ///
  /// In en, this message translates to:
  /// **'CONNECTION INFO'**
  String get connectionInfo;

  /// User label
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// IP addresses label
  ///
  /// In en, this message translates to:
  /// **'IP Addresses'**
  String get ipAddresses;

  /// Connect instruction
  ///
  /// In en, this message translates to:
  /// **'Connect from another device:'**
  String get connectFromAnotherDevice;

  /// Copied message
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get copiedToClipboard;

  /// OpenSSH not installed title
  ///
  /// In en, this message translates to:
  /// **'OpenSSH not installed'**
  String get openSshNotInstalled;

  /// OpenSSH not installed description
  ///
  /// In en, this message translates to:
  /// **'Install the OpenSSH package first from the Packages screen.'**
  String get openSshNotInstalledDesc;

  /// Open packages button
  ///
  /// In en, this message translates to:
  /// **'Open Packages'**
  String get openPackages;

  /// Logs screen title
  ///
  /// In en, this message translates to:
  /// **'Gateway Logs'**
  String get gatewayLogs;

  /// Filter logs hint
  ///
  /// In en, this message translates to:
  /// **'Filter logs...'**
  String get filterLogs;

  /// No logs with hint
  ///
  /// In en, this message translates to:
  /// **'No logs yet. Start the gateway.'**
  String get noLogsYetStartGateway;

  /// No matching logs message
  ///
  /// In en, this message translates to:
  /// **'No matching logs.'**
  String get noMatchingLogs;

  /// Logs copied message
  ///
  /// In en, this message translates to:
  /// **'Logs copied to clipboard'**
  String get logsCopiedToClipboard;

  /// Screenshot tooltip
  ///
  /// In en, this message translates to:
  /// **'Screenshot'**
  String get screenshot;

  /// Auto scroll on tooltip
  ///
  /// In en, this message translates to:
  /// **'Auto-scroll on'**
  String get autoScrollOn;

  /// Auto scroll off tooltip
  ///
  /// In en, this message translates to:
  /// **'Auto-scroll off'**
  String get autoScrollOff;

  /// Copy all logs tooltip
  ///
  /// In en, this message translates to:
  /// **'Copy all logs'**
  String get copyAllLogs;

  /// Screenshot saved message
  ///
  /// In en, this message translates to:
  /// **'Screenshot saved: {filename}'**
  String screenshotSaved(String filename);

  /// Screenshot failed message
  ///
  /// In en, this message translates to:
  /// **'Failed to capture screenshot'**
  String get failedToCaptureScreenshot;

  /// Packages screen title
  ///
  /// In en, this message translates to:
  /// **'Optional Packages'**
  String get optionalPackagesTitle;

  /// Go package description
  ///
  /// In en, this message translates to:
  /// **'Go programming language compiler and tools'**
  String get goDesc;

  /// Homebrew package description
  ///
  /// In en, this message translates to:
  /// **'The missing package manager for Linux'**
  String get homebrewDesc;

  /// OpenSSH package description
  ///
  /// In en, this message translates to:
  /// **'Secure shell client and server'**
  String get openSshDesc;

  /// Loading text
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// Retry button
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Done button
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// Starting text
  ///
  /// In en, this message translates to:
  /// **'Starting...'**
  String get startingDotdotdot;

  /// Loading text
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loadingDotdotdot;

  /// Splash screen loading
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get splashLoading;

  /// Splash screen checking
  ///
  /// In en, this message translates to:
  /// **'Checking setup status...'**
  String get checkingSetupStatus;

  /// Terminal screen title
  ///
  /// In en, this message translates to:
  /// **'Terminal'**
  String get terminalTitle;

  /// Starting terminal message
  ///
  /// In en, this message translates to:
  /// **'Starting terminal...'**
  String get startingTerminal;

  /// Web dashboard screen title
  ///
  /// In en, this message translates to:
  /// **'Web Dashboard'**
  String get webDashboardTitle;

  /// Dashboard load error
  ///
  /// In en, this message translates to:
  /// **'Failed to load dashboard'**
  String get failedToLoadDashboard;

  /// Configure screen title
  ///
  /// In en, this message translates to:
  /// **'OpenClaw Configure'**
  String get openclawConfigure;

  /// Starting configure message
  ///
  /// In en, this message translates to:
  /// **'Starting configure...'**
  String get startingConfigure;

  /// Onboarding screen title
  ///
  /// In en, this message translates to:
  /// **'OpenClaw Onboarding'**
  String get openclawOnboarding;

  /// Starting onboarding message
  ///
  /// In en, this message translates to:
  /// **'Starting onboarding...'**
  String get startingOnboarding;

  /// Copied message
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get copiedToClipboardMsg;

  /// Anthropic provider name
  ///
  /// In en, this message translates to:
  /// **'Anthropic'**
  String get providerAnthropic;

  /// Anthropic provider description
  ///
  /// In en, this message translates to:
  /// **'Claude models — advanced reasoning and coding'**
  String get providerAnthropicDesc;

  /// OpenAI provider name
  ///
  /// In en, this message translates to:
  /// **'OpenAI'**
  String get providerOpenai;

  /// OpenAI provider description
  ///
  /// In en, this message translates to:
  /// **'GPT and o-series models'**
  String get providerOpenaiDesc;

  /// Google provider name
  ///
  /// In en, this message translates to:
  /// **'Google Gemini'**
  String get providerGoogle;

  /// Google provider description
  ///
  /// In en, this message translates to:
  /// **'Gemini family of multimodal models'**
  String get providerGoogleDesc;

  /// OpenRouter provider name
  ///
  /// In en, this message translates to:
  /// **'OpenRouter'**
  String get providerOpenrouter;

  /// OpenRouter provider description
  ///
  /// In en, this message translates to:
  /// **'Unified API for hundreds of models'**
  String get providerOpenrouterDesc;

  /// NVIDIA provider name
  ///
  /// In en, this message translates to:
  /// **'NVIDIA NIM'**
  String get providerNvidia;

  /// NVIDIA provider description
  ///
  /// In en, this message translates to:
  /// **'GPU-optimized inference endpoints'**
  String get providerNvidiaDesc;

  /// DeepSeek provider name
  ///
  /// In en, this message translates to:
  /// **'DeepSeek'**
  String get providerDeepseek;

  /// DeepSeek provider description
  ///
  /// In en, this message translates to:
  /// **'High-performance open models'**
  String get providerDeepseekDesc;

  /// xAI provider name
  ///
  /// In en, this message translates to:
  /// **'xAI'**
  String get providerXai;

  /// xAI provider description
  ///
  /// In en, this message translates to:
  /// **'Grok models from xAI'**
  String get providerXaiDesc;

  /// ESC key
  ///
  /// In en, this message translates to:
  /// **'ESC'**
  String get esc;

  /// CTRL key
  ///
  /// In en, this message translates to:
  /// **'CTRL'**
  String get ctrl;

  /// ALT key
  ///
  /// In en, this message translates to:
  /// **'ALT'**
  String get alt;

  /// TAB key
  ///
  /// In en, this message translates to:
  /// **'TAB'**
  String get tab;

  /// ENTER key
  ///
  /// In en, this message translates to:
  /// **'ENTER'**
  String get enter;

  /// HOME key
  ///
  /// In en, this message translates to:
  /// **'HOME'**
  String get home;

  /// END key
  ///
  /// In en, this message translates to:
  /// **'END'**
  String get end;

  /// Cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Uninstall confirmation dialog title
  ///
  /// In en, this message translates to:
  /// **'Uninstall {package}?'**
  String uninstallConfirmTitle(String package);

  /// Uninstall confirmation dialog description
  ///
  /// In en, this message translates to:
  /// **'This will remove {package} from the environment.'**
  String uninstallConfirmDesc(String package);

  /// Open link dialog title
  ///
  /// In en, this message translates to:
  /// **'Open Link'**
  String get openLink;

  /// Open button
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// Copy button
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// Paste tooltip
  ///
  /// In en, this message translates to:
  /// **'Paste'**
  String get paste;

  /// Open URL tooltip
  ///
  /// In en, this message translates to:
  /// **'Open URL'**
  String get openUrl;

  /// Link copied message
  ///
  /// In en, this message translates to:
  /// **'Link copied'**
  String get linkCopied;

  /// No URL found message
  ///
  /// In en, this message translates to:
  /// **'No URL found in selection'**
  String get noUrlFound;

  /// Go to dashboard button
  ///
  /// In en, this message translates to:
  /// **'Go to Dashboard'**
  String get goToDashboard;

  /// API key empty error
  ///
  /// In en, this message translates to:
  /// **'API key cannot be empty'**
  String get apiKeyCannotBeEmpty;

  /// Model name empty error
  ///
  /// In en, this message translates to:
  /// **'Model name cannot be empty'**
  String get modelNameCannotBeEmpty;

  /// Provider configured message
  ///
  /// In en, this message translates to:
  /// **'{provider} configured and activated'**
  String providerConfiguredAndActivated(String provider);

  /// Save failed message
  ///
  /// In en, this message translates to:
  /// **'Failed to save: {error}'**
  String failedToSave(String error);

  /// Remove provider dialog title
  ///
  /// In en, this message translates to:
  /// **'Remove {provider}?'**
  String removeProviderTitle(String provider);

  /// Remove provider dialog description
  ///
  /// In en, this message translates to:
  /// **'This will delete the API key and deactivate the model.'**
  String get removeProviderDesc;

  /// Remove button
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// Provider removed message
  ///
  /// In en, this message translates to:
  /// **'{provider} removed'**
  String providerRemoved(String provider);

  /// Remove failed message
  ///
  /// In en, this message translates to:
  /// **'Failed to remove: {error}'**
  String failedToRemove(String error);

  /// Custom model dropdown option
  ///
  /// In en, this message translates to:
  /// **'Custom...'**
  String get customModel;

  /// Custom model input hint
  ///
  /// In en, this message translates to:
  /// **'e.g. meta/llama-3.3-70b-instruct'**
  String get customModelHint;

  /// Custom model input label
  ///
  /// In en, this message translates to:
  /// **'Custom model name'**
  String get customModelName;

  /// Checking status step
  ///
  /// In en, this message translates to:
  /// **'Checking status...'**
  String get checkingStatus;

  /// Setting up directories message
  ///
  /// In en, this message translates to:
  /// **'Setting up directories...'**
  String get settingUpDirectories;

  /// Downloading Ubuntu rootfs message
  ///
  /// In en, this message translates to:
  /// **'Downloading Ubuntu rootfs...'**
  String get downloadingUbuntuRootfs;

  /// Downloading rootfs progress
  ///
  /// In en, this message translates to:
  /// **'Downloading rootfs: {current} / {total} MB'**
  String downloadingRootfs(String current, String total);

  /// Downloading progress message
  ///
  /// In en, this message translates to:
  /// **'Downloading: {current} MB / {total} MB'**
  String downloadingProgress(String current, String total);

  /// Extracting rootfs message
  ///
  /// In en, this message translates to:
  /// **'Extracting rootfs (this takes a while)...'**
  String get extractingRootfsWait;

  /// Rootfs extracted message
  ///
  /// In en, this message translates to:
  /// **'Rootfs extracted'**
  String get rootfsExtracted;

  /// Fixing permissions message
  ///
  /// In en, this message translates to:
  /// **'Fixing rootfs permissions...'**
  String get fixingRootfsPermissions;

  /// Updating package lists message
  ///
  /// In en, this message translates to:
  /// **'Updating package lists...'**
  String get updatingPackageLists;

  /// Installing base packages message
  ///
  /// In en, this message translates to:
  /// **'Installing base packages...'**
  String get installingBasePackages;

  /// Downloading Node.js message
  ///
  /// In en, this message translates to:
  /// **'Downloading Node.js...'**
  String get downloadingNodejs;

  /// Downloading Node.js progress
  ///
  /// In en, this message translates to:
  /// **'Downloading Node.js: {current} / {total} MB'**
  String downloadingNodejsProgress(String current, String total);

  /// Extracting Node.js message
  ///
  /// In en, this message translates to:
  /// **'Extracting Node.js...'**
  String get extractingNodejs;

  /// Verifying Node.js message
  ///
  /// In en, this message translates to:
  /// **'Verifying Node.js...'**
  String get verifyingNodejs;

  /// Node.js installed message
  ///
  /// In en, this message translates to:
  /// **'Node.js installed'**
  String get nodejsInstalled;

  /// Installing OpenClaw message
  ///
  /// In en, this message translates to:
  /// **'Installing OpenClaw (this may take a few minutes)...'**
  String get installingOpenClawWait;

  /// Creating bin wrappers message
  ///
  /// In en, this message translates to:
  /// **'Creating bin wrappers...'**
  String get creatingBinWrappers;

  /// Verifying OpenClaw message
  ///
  /// In en, this message translates to:
  /// **'Verifying OpenClaw...'**
  String get verifyingOpenClaw;

  /// OpenClaw installed message
  ///
  /// In en, this message translates to:
  /// **'OpenClaw installed'**
  String get openClawInstalled;

  /// Bionic bypass configured message
  ///
  /// In en, this message translates to:
  /// **'Bionic Bypass configured'**
  String get bionicBypassConfigured;

  /// Setup complete ready message
  ///
  /// In en, this message translates to:
  /// **'Setup complete! Ready to start the gateway.'**
  String get setupCompleteReady;

  /// Setup required message
  ///
  /// In en, this message translates to:
  /// **'Setup required'**
  String get setupRequired;

  /// Download failed message
  ///
  /// In en, this message translates to:
  /// **'Download failed: {error}. Check your internet connection.'**
  String downloadFailed(String error);

  /// Setup failed message
  ///
  /// In en, this message translates to:
  /// **'Setup failed: {error}'**
  String setupFailed(String error);

  /// Failed to check status message
  ///
  /// In en, this message translates to:
  /// **'Failed to check status: {error}'**
  String failedToCheckStatus(String error);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
