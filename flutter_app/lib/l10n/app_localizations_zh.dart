// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'OpenClaw';

  @override
  String get quickActions => '快捷操作';

  @override
  String get terminal => '终端';

  @override
  String get terminalSubtitle => '打开 Ubuntu Shell';

  @override
  String get webDashboard => '网页面板';

  @override
  String get webDashboardSubtitle => '在浏览器中打开 OpenClaw 面板';

  @override
  String get startGatewayFirst => '请先启动网关';

  @override
  String get token => '令牌';

  @override
  String get copyDashboardUrl => '复制面板链接';

  @override
  String get dashboardUrlCopied => '面板链接已复制';

  @override
  String get onboarding => '新手引导';

  @override
  String get onboardingSubtitle => '配置 API 密钥和绑定';

  @override
  String get configure => '配置';

  @override
  String get configureSubtitle => '管理网关设置';

  @override
  String get aiProviders => 'AI 提供商';

  @override
  String get aiProvidersSubtitle => '配置模型和 API 密钥';

  @override
  String get packages => '软件包';

  @override
  String get packagesSubtitle => '安装可选工具';

  @override
  String get sshAccess => 'SSH 访问';

  @override
  String get sshAccessSubtitle => '通过 SSH 远程访问终端';

  @override
  String get logs => '日志';

  @override
  String get logsSubtitle => '查看网关输出和错误';

  @override
  String get snapshot => '快照';

  @override
  String get snapshotSubtitle => '备份或恢复配置';

  @override
  String get node => '节点';

  @override
  String get nodeConnectedToGateway => '已连接到网关';

  @override
  String get nodeDeviceCapabilities => '为 AI 提供设备能力';

  @override
  String versionBy(String author, String org) {
    return '作者: $author | $org';
  }

  @override
  String get settings => '设置';

  @override
  String get general => '通用';

  @override
  String get autoStartGateway => '自动启动网关';

  @override
  String get autoStartGatewayDesc => '打开应用时自动启动网关';

  @override
  String get batteryOptimization => '电池优化';

  @override
  String get batteryOptimized => '已优化 (可能会终止后台进程)';

  @override
  String get batteryUnrestricted => '无限制 (推荐)';

  @override
  String get setupStorage => '存储设置';

  @override
  String get storageGranted => '已授权 — proot 可以访问 /sdcard。如不需要可撤销。';

  @override
  String get storageNotGranted => '允许访问共享存储';

  @override
  String get nodeSection => '节点';

  @override
  String get enableNode => '启用节点';

  @override
  String get enableNodeDesc => '向网关提供设备能力';

  @override
  String get nodeConfiguration => '节点配置';

  @override
  String get nodeConfigurationDesc => '连接、配对和能力设置';

  @override
  String get systemInfo => '系统信息';

  @override
  String get architecture => '架构';

  @override
  String get prootPath => 'PRoot 路径';

  @override
  String get rootfs => '根文件系统';

  @override
  String get installed => '已安装';

  @override
  String get notInstalled => '未安装';

  @override
  String get nodejs => 'Node.js';

  @override
  String get openclaw => 'OpenClaw';

  @override
  String get goGolang => 'Go 语言';

  @override
  String get homebrew => 'Homebrew';

  @override
  String get openSSH => 'OpenSSH';

  @override
  String get maintenance => '维护';

  @override
  String get exportSnapshot => '导出快照';

  @override
  String get exportSnapshotDesc => '备份配置到下载目录';

  @override
  String get importSnapshot => '导入快照';

  @override
  String get importSnapshotDesc => '从备份恢复配置';

  @override
  String get rerunSetup => '重新运行设置';

  @override
  String get rerunSetupDesc => '重新安装或修复环境';

  @override
  String get about => '关于';

  @override
  String get aiGatewayForAndroid => 'Android AI 网关';

  @override
  String get checkForUpdates => '检查更新';

  @override
  String get checkForUpdatesDesc => '检查 GitHub 上是否有新版本';

  @override
  String get developer => '开发者';

  @override
  String get gitHub => 'GitHub';

  @override
  String get contact => '联系方式';

  @override
  String get license => '许可证';

  @override
  String get instagram => 'Instagram';

  @override
  String get youTube => 'YouTube';

  @override
  String get playStore => 'Play 商店';

  @override
  String get email => '电子邮件';

  @override
  String snapshotSaved(String path) {
    return '快照已保存到 $path';
  }

  @override
  String exportFailed(String error) {
    return '导出失败: $error';
  }

  @override
  String noSnapshotFound(String path) {
    return '在 $path 未找到快照';
  }

  @override
  String get snapshotRestored => '快照已成功恢复。请重启网关以应用更改。';

  @override
  String importFailed(String error) {
    return '导入失败: $error';
  }

  @override
  String get updateAvailable => '有可用更新';

  @override
  String updateAvailableDesc(String current, String latest) {
    return '有新版本可用。\n\n当前版本: $current\n最新版本: $latest';
  }

  @override
  String get later => '稍后';

  @override
  String get download => '下载';

  @override
  String get onLatestVersion => '已是最新版本';

  @override
  String get couldNotCheckUpdates => '无法检查更新';

  @override
  String get gateway => '网关';

  @override
  String get running => '运行中';

  @override
  String get starting => '启动中';

  @override
  String get error => '错误';

  @override
  String get stopped => '已停止';

  @override
  String get copyUrl => '复制链接';

  @override
  String get urlCopiedToClipboard => '链接已复制到剪贴板';

  @override
  String get openDashboard => '打开面板';

  @override
  String get startGateway => '启动网关';

  @override
  String get stopGateway => '停止网关';

  @override
  String get viewLogs => '查看日志';

  @override
  String get setupOpenClaw => '设置 OpenClaw';

  @override
  String get setupDescNotStarted => '将下载 Ubuntu、Node.js 和 OpenClaw 到独立环境中。';

  @override
  String get setupDescStarted => '正在设置环境，可能需要几分钟。';

  @override
  String get downloadUbuntuRootfs => '下载 Ubuntu 根文件系统';

  @override
  String get extractRootfs => '解压根文件系统';

  @override
  String get installNodejs => '安装 Node.js';

  @override
  String get installOpenClaw => '安装 OpenClaw';

  @override
  String get configureBionicBypass => '配置 Bionic 绕过';

  @override
  String get setupComplete => '设置完成！';

  @override
  String get optionalPackages => '可选软件包';

  @override
  String get beginSetup => '开始设置';

  @override
  String get retrySetup => '重试设置';

  @override
  String get configureApiKeys => '配置 API 密钥';

  @override
  String get requiresStorage => '需要约 500MB 存储空间和网络连接';

  @override
  String get install => '安装';

  @override
  String get uninstall => '卸载';

  @override
  String get nodeConfigurationTitle => '节点配置';

  @override
  String get gatewayConnection => '网关连接';

  @override
  String get localGateway => '本地网关';

  @override
  String get localGatewayDesc => '自动与此设备上的网关配对';

  @override
  String get remoteGateway => '远程网关';

  @override
  String get remoteGatewayDesc => '连接到其他设备上的网关';

  @override
  String get gatewayHost => '网关主机';

  @override
  String get gatewayPort => '网关端口';

  @override
  String get gatewayToken => '网关令牌';

  @override
  String get gatewayTokenHint => '粘贴网关面板链接中的令牌';

  @override
  String get gatewayTokenHelper => '在面板链接 #token= 后查找';

  @override
  String get connect => '连接';

  @override
  String get pairing => '配对';

  @override
  String get approveCodeOnGateway => '在网关上批准此代码:';

  @override
  String get capabilities => '设备能力';

  @override
  String get camera => '相机';

  @override
  String get cameraDesc => '拍摄照片和视频片段';

  @override
  String get canvas => '画布';

  @override
  String get canvasDesc => '移动端暂不可用';

  @override
  String get location => '位置';

  @override
  String get locationDesc => '获取设备 GPS 坐标';

  @override
  String get screenRecording => '屏幕录制';

  @override
  String get screenRecordingDesc => '录制设备屏幕 (每次需授权)';

  @override
  String get flashlight => '闪光灯';

  @override
  String get flashlightDesc => '开关设备手电筒';

  @override
  String get vibration => '振动';

  @override
  String get vibrationDesc => '触发触觉反馈和振动模式';

  @override
  String get sensors => '传感器';

  @override
  String get sensorsDesc => '读取加速度计、陀螺仪、磁力计、气压计';

  @override
  String get serial => '串口';

  @override
  String get serialDesc => '蓝牙和 USB 串口通信';

  @override
  String get deviceInfo => '设备信息';

  @override
  String get deviceId => '设备 ID';

  @override
  String get nodeLogs => '节点日志';

  @override
  String get noLogsYet => '暂无日志';

  @override
  String get paired => '已配对';

  @override
  String get connecting => '连接中';

  @override
  String get enableNodeButton => '启用节点';

  @override
  String get disableNodeButton => '禁用节点';

  @override
  String get activeModel => '当前模型';

  @override
  String get selectProviderToConfigure => '选择提供商以配置其 API 密钥和模型。';

  @override
  String get active => '使用中';

  @override
  String get configured => '已配置';

  @override
  String get apiKey => 'API 密钥';

  @override
  String get model => '模型';

  @override
  String get saveAndActivate => '保存并激活';

  @override
  String get removeConfiguration => '移除配置';

  @override
  String get sshAccessTitle => 'SSH 访问';

  @override
  String get serviceControl => '服务控制';

  @override
  String get sshServerRunning => 'SSH 服务器运行中';

  @override
  String get sshServerStopped => 'SSH 服务器已停止';

  @override
  String get port => '端口';

  @override
  String get startServer => '启动服务器';

  @override
  String get stopServer => '停止服务器';

  @override
  String get rootPassword => 'Root 密码';

  @override
  String get setRootPasswordDesc => '设置 SSH 登录的 root 密码。';

  @override
  String get newPassword => '新密码';

  @override
  String get enterPassword => '输入密码';

  @override
  String get setPassword => '设置密码';

  @override
  String get passwordCannotBeEmpty => '密码不能为空';

  @override
  String get rootPasswordUpdated => 'Root 密码已更新';

  @override
  String failedToSetPassword(String error) {
    return '设置密码失败: $error';
  }

  @override
  String get connectionInfo => '连接信息';

  @override
  String get user => '用户';

  @override
  String get ipAddresses => 'IP 地址';

  @override
  String get connectFromAnotherDevice => '从其他设备连接:';

  @override
  String get copiedToClipboard => '已复制到剪贴板';

  @override
  String get openSshNotInstalled => 'OpenSSH 未安装';

  @override
  String get openSshNotInstalledDesc => '请先从软件包页面安装 OpenSSH。';

  @override
  String get openPackages => '打开软件包';

  @override
  String get gatewayLogs => '网关日志';

  @override
  String get filterLogs => '过滤日志...';

  @override
  String get noLogsYetStartGateway => '暂无日志。请启动网关。';

  @override
  String get noMatchingLogs => '没有匹配的日志。';

  @override
  String get logsCopiedToClipboard => '日志已复制到剪贴板';

  @override
  String get screenshot => '截图';

  @override
  String get autoScrollOn => '自动滚动 开';

  @override
  String get autoScrollOff => '自动滚动 关';

  @override
  String get copyAllLogs => '复制所有日志';

  @override
  String screenshotSaved(String filename) {
    return '截图已保存: $filename';
  }

  @override
  String get failedToCaptureScreenshot => '截图失败';

  @override
  String get optionalPackagesTitle => '可选软件包';

  @override
  String get goDesc => 'Go 编程语言编译器和工具';

  @override
  String get homebrewDesc => 'Linux 缺失的包管理器';

  @override
  String get openSshDesc => '安全 Shell 客户端和服务器';

  @override
  String get loading => '加载中...';

  @override
  String get retry => '重试';

  @override
  String get done => '完成';

  @override
  String get startingDotdotdot => '启动中...';

  @override
  String get loadingDotdotdot => '加载中...';

  @override
  String get splashLoading => '加载中...';

  @override
  String get checkingSetupStatus => '检查设置状态...';

  @override
  String get terminalTitle => '终端';

  @override
  String get startingTerminal => '启动终端...';

  @override
  String get webDashboardTitle => '网页面板';

  @override
  String get failedToLoadDashboard => '加载面板失败';

  @override
  String get openclawConfigure => 'OpenClaw 配置';

  @override
  String get startingConfigure => '启动配置...';

  @override
  String get openclawOnboarding => 'OpenClaw 新手引导';

  @override
  String get startingOnboarding => '启动新手引导...';

  @override
  String get copiedToClipboardMsg => '已复制到剪贴板';

  @override
  String get providerAnthropic => 'Anthropic';

  @override
  String get providerAnthropicDesc => 'Claude 模型 — 高级推理和编程';

  @override
  String get providerOpenai => 'OpenAI';

  @override
  String get providerOpenaiDesc => 'GPT 和 o 系列模型';

  @override
  String get providerGoogle => 'Google Gemini';

  @override
  String get providerGoogleDesc => 'Gemini 多模态模型系列';

  @override
  String get providerOpenrouter => 'OpenRouter';

  @override
  String get providerOpenrouterDesc => '数百种模型的统一 API';

  @override
  String get providerNvidia => 'NVIDIA NIM';

  @override
  String get providerNvidiaDesc => 'GPU 优化推理端点';

  @override
  String get providerDeepseek => 'DeepSeek';

  @override
  String get providerDeepseekDesc => '高性能开源模型';

  @override
  String get providerXai => 'xAI';

  @override
  String get providerXaiDesc => '来自 xAI 的 Grok 模型';

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
  String get cancel => '取消';

  @override
  String uninstallConfirmTitle(String package) {
    return '卸载 $package?';
  }

  @override
  String uninstallConfirmDesc(String package) {
    return '将从环境中移除 $package。';
  }

  @override
  String get openLink => '打开链接';

  @override
  String get open => '打开';

  @override
  String get copy => '复制';

  @override
  String get paste => '粘贴';

  @override
  String get openUrl => '打开链接';

  @override
  String get linkCopied => '链接已复制';

  @override
  String get noUrlFound => '选区中未找到链接';

  @override
  String get goToDashboard => '前往面板';

  @override
  String get apiKeyCannotBeEmpty => 'API 密钥不能为空';

  @override
  String get modelNameCannotBeEmpty => '模型名称不能为空';

  @override
  String providerConfiguredAndActivated(String provider) {
    return '$provider 已配置并激活';
  }

  @override
  String failedToSave(String error) {
    return '保存失败: $error';
  }

  @override
  String removeProviderTitle(String provider) {
    return '移除 $provider?';
  }

  @override
  String get removeProviderDesc => '这将删除 API 密钥并停用模型。';

  @override
  String get remove => '移除';

  @override
  String providerRemoved(String provider) {
    return '$provider 已移除';
  }

  @override
  String failedToRemove(String error) {
    return '移除失败: $error';
  }

  @override
  String get customModel => '自定义...';

  @override
  String get customModelHint => '例如 meta/llama-3.3-70b-instruct';

  @override
  String get customModelName => '自定义模型名称';

  @override
  String get checkingStatus => '检查状态中...';

  @override
  String get settingUpDirectories => '设置目录中...';

  @override
  String get downloadingUbuntuRootfs => '下载 Ubuntu 根文件系统...';

  @override
  String downloadingRootfs(String current, String total) {
    return '下载 rootfs: $current / $total MB';
  }

  @override
  String downloadingProgress(String current, String total) {
    return '下载中: $current MB / $total MB';
  }

  @override
  String get extractingRootfsWait => '解压根文件系统（需要一些时间）...';

  @override
  String get rootfsExtracted => '根文件系统已解压';

  @override
  String get fixingRootfsPermissions => '修复根文件系统权限...';

  @override
  String get updatingPackageLists => '更新软件包列表...';

  @override
  String get installingBasePackages => '安装基础软件包...';

  @override
  String get downloadingNodejs => '下载 Node.js...';

  @override
  String downloadingNodejsProgress(String current, String total) {
    return '下载 Node.js: $current / $total MB';
  }

  @override
  String get extractingNodejs => '解压 Node.js...';

  @override
  String get verifyingNodejs => '验证 Node.js...';

  @override
  String get nodejsInstalled => 'Node.js 已安装';

  @override
  String get installingOpenClawWait => '安装 OpenClaw（可能需要几分钟）...';

  @override
  String get creatingBinWrappers => '创建 bin 包装器...';

  @override
  String get verifyingOpenClaw => '验证 OpenClaw...';

  @override
  String get openClawInstalled => 'OpenClaw 已安装';

  @override
  String get bionicBypassConfigured => 'Bionic 绕过已配置';

  @override
  String get setupCompleteReady => '设置完成！可以启动网关。';

  @override
  String get setupRequired => '需要设置';

  @override
  String downloadFailed(String error) {
    return '下载失败: $error。请检查网络连接。';
  }

  @override
  String setupFailed(String error) {
    return '设置失败: $error';
  }

  @override
  String failedToCheckStatus(String error) {
    return '检查状态失败: $error';
  }
}
