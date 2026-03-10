# OpenClaw

<p align="center">
  <img src="assets/ic_launcher.png" alt="OpenClaw 应用展示" width="700"/>
</p>

> 在 Android 上运行 **OpenClaw AI 网关** — 独立的 Flutter 应用，内置终端、Web 控制面板、可选开发工具，一键安装。也提供 Termux CLI 包。

---

## 🇨🇳 中国大陆优化

> **项目来源**：本项目 Fork 自 [mithun50/openclaw-termux](https://github.com/mithun50/openclaw-termux)，基于 `v1.8.4` 版本进行中国大陆网络优化。

本版本针对中国大陆网络环境进行了深度优化，所有下载源均已替换为国内镜像，大幅提升安装速度和成功率。

### 优化内容

| 组件 | 原始源 | 优化后源 | 效果 |
|------|--------|----------|------|
| **Ubuntu rootfs** | `cdimage.ubuntu.com` | 清华源 `mirrors.tuna.tsinghua.edu.cn` | 下载速度提升 5-10 倍 |
| **apt 软件包** | `archive.ubuntu.com` / `ports.ubuntu.com` | Ubuntu 中国镜像 `cn.archive.ubuntu.com` / `cn.ports.ubuntu.com` | 软件包更新/安装速度大幅提升 |
| **Node.js** | `nodejs.org` | 清华源 `mirrors.tuna.tsinghua.edu.cn/nodejs-release` | Node.js 下载速度提升 5-10 倍 |
| **npm 包** | `registry.npmjs.org` | 淘宝源 `registry.npmmirror.com` | npm 包下载速度大幅提升 |
| **DNS** | Google DNS (`8.8.8.8`) | 阿里 DNS (`223.5.5.5`) + 114 DNS (`114.114.114.114`) | 域名解析更快更稳定 |

### 技术细节

**1. Ubuntu rootfs 下载**
- 使用清华大学开源软件镜像站
- 支持 arm64、armhf、x86_64 三种架构
- 约 100MB 的 rootfs 压缩包下载时间从 10+ 分钟缩短至 1-2 分钟

**2. apt 软件源配置**
- 自动识别系统架构（x86 使用 `cn.archive.ubuntu.com`，ARM 使用 `cn.ports.ubuntu.com`）
- 使用 HTTP 协议避免潜在的 HTTPS 连接问题
- 通过 sed 自动修改 `/etc/apt/sources.list.d/ubuntu.sources`

**3. Node.js 安装**
- 从清华源下载预编译的 Node.js 二进制包
- 避免了官方源在国内的连接超时问题
- 约 30MB 的 Node.js 包下载时间大幅缩短

**4. npm 配置**
- 安装 OpenClaw 时自动配置淘宝 npm 镜像
- 解决 npm 官方源在国内访问慢的问题

**5. DNS 优化**
- 阿里 DNS (223.5.5.5)：国内解析速度快，覆盖广
- 114 DNS (114.114.114.114)：老牌公共 DNS，稳定性好
- 双 DNS 配置提高解析可靠性

### 中文本地化

本版本进行了完整的中文本地化工作，包括：

**1. 应用名称本地化**
- Android 应用名称：在中文系统下显示为「安卓龙虾」
- 文件：`flutter_app/android/app/src/main/res/values-zh/strings.xml`

**2. Flutter 应用界面翻译**
- 翻译条目数：**200+ 条**
- 覆盖范围：
  - 控制面板（快捷操作、网关状态、节点状态）
  - 安装向导（下载、解压、安装各阶段提示）
  - 设置页面（系统信息、维护操作、关于信息）
  - AI 提供商配置（7 个提供商名称和描述）
  - SSH 访问（服务器控制、连接信息）
  - 日志查看器（过滤、截图、自动滚动）
  - 软件包管理（Go、Homebrew、OpenSSH）
  - 节点配置（设备能力、配对状态）
  - 终端（扩展键盘、链接处理）
  - 错误提示和状态消息
- 文件：`flutter_app/lib/l10n/app_zh.arb`

**3. 翻译示例**

| 原文 | 中文翻译 |
|------|----------|
| Dashboard | 控制面板 |
| Setup Wizard | 安装向导 |
| Gateway | 网关 |
| Onboarding | 新手引导 |
| Quick Actions | 快捷操作 |
| Terminal | 终端 |
| Logs | 日志 |
| Settings | 设置 |
| Start Gateway | 启动网关 |
| Downloading Ubuntu rootfs... | 下载 Ubuntu 根文件系统... |
| Setup complete! | 设置完成！ |

**4. 文档本地化**
- 中文 README 文档（`README_CN.md`）

### 预期效果

| 场景 | 原版 | 优化版 |
|------|------|--------|
| 首次安装总耗时 | 20-40 分钟（甚至超时失败） | 5-10 分钟 |
| Ubuntu rootfs 下载 | 经常超时失败 | 稳定快速 |
| apt 软件包安装 | 可能因网络问题失败 | 稳定可靠 |
| Node.js 下载 | 连接缓慢或失败 | 秒级完成 |
| OpenClaw npm 安装 | 可能卡住 | 快速完成 |

---

## 截图

<table align="center">
  <tr>
    <td align="center"><img src="assets/dashboard.png" alt="控制面板" width="220"/><br/><b>控制面板</b></td>
    <td align="center"><img src="assets/setupscreen.png" alt="安装向导" width="220"/><br/><b>安装向导</b></td>
    <td align="center"><img src="assets/onboardingscreen.png" alt="引导配置" width="220"/><br/><b>引导配置</b></td>
  </tr>
  <tr>
    <td align="center"><img src="assets/websscreen.png" alt="Web 控制面板" width="220"/><br/><b>Web 控制面板</b></td>
    <td align="center"><img src="assets/logscreen.png" alt="日志" width="220"/><br/><b>日志</b></td>
    <td align="center"><img src="assets/settingsscreen.png" alt="设置" width="220"/><br/><b>设置</b></td>
  </tr>
</table>

---

## 什么是 OpenClaw？

OpenClaw 将 [OpenClaw](https://github.com/anthropics/openclaw) AI 网关带到 Android 平台。它通过 proot 搭建完整的 Ubuntu 环境，安装 Node.js 和 OpenClaw，并提供原生 Flutter UI 管理一切 — 无需 root 权限。

### 两种使用方式

| | **Flutter 应用**（独立） | **Termux CLI** |
|---|---|---|
| 安装 | 构建 APK 或下载发布版 | `npm install -g openclaw-termux` |
| 设置 | 点击"开始安装" | `openclawx setup` |
| 网关 | 点击"启动网关" | `openclawx start` |
| 终端 | 内置终端模拟器 | Termux shell |
| 控制面板 | 内置 WebView | 浏览器访问 `localhost:18789` |

---

## 功能特性

### Flutter 应用
- **一键安装** — 自动下载 Ubuntu rootfs、Node.js 22 和 OpenClaw
- **内置终端** — 完整终端模拟器，支持扩展键盘、复制粘贴、可点击链接
- **网关控制** — 启动/停止网关，状态指示和健康检查
- **AI 提供商** — 配置 7 个提供商的 API 密钥和模型选择（Anthropic、OpenAI、Google Gemini、OpenRouter、NVIDIA NIM、DeepSeek、xAI）
- **SSH 远程访问** — 启动/停止 SSH 服务器，设置 root 密码，查看连接信息，支持一键复制命令
- **配置菜单** — 在内置终端运行 `openclaw configure` 管理网关设置
- **节点设备功能** — 通过 WebSocket 节点协议向 AI 暴露 7 项能力（15 个命令）
- **Token URL 显示** — 从引导配置捕获认证 token，显示并支持复制
- **Web 控制面板** — 内嵌 WebView 加载控制面板，自动带入认证 token
- **查看日志** — 实时网关日志查看器，支持搜索/过滤
- **引导配置** — 直接在应用内配置 API 密钥和绑定地址
- **可选软件包** — 安装 Go (Golang)、Homebrew 和 OpenSSH 作为可选开发工具
- **设置** — 自动启动、电池优化、系统信息、软件包状态、重新运行安装
- **前台服务** — 保持网关在后台运行，记录运行时间
- **安装通知** — 环境安装期间显示进度条通知

### 可选软件包

初始安装完成后，可直接从应用安装开发工具：

| 软件包 | 安装方式 | 大小 |
|---------|---------------|------|
| **Go (Golang)** | `apt install golang` | ~150 MB |
| **Homebrew** | 官方安装脚本（带 root 变通方案） | ~500 MB |
| **OpenSSH** | `apt install openssh-server` | ~10 MB |

可从以下位置访问：
- **安装向导** — 安装完成后显示软件包卡片
- **控制面板** — 快捷操作中的"软件包"卡片
- **设置** — 系统信息下显示安装状态

### 节点设备功能

Flutter 应用作为**节点**连接到网关，向 AI 暴露 Android 硬件能力。启用节点时会主动请求权限。

| 功能 | 命令 | 权限 |
|------------|----------|------------|
| **相机** | `camera.snap`, `camera.clip`, `camera.list` | 相机 |
| **画布** | `canvas.navigate`, `canvas.eval`, `canvas.snapshot` | 无（未实现） |
| **闪光灯** | `flash.on`, `flash.off`, `flash.toggle`, `flash.status` | 相机（闪光灯） |
| **位置** | `location.get` | 位置 |
| **屏幕** | `screen.record` | MediaProjection 授权 |
| **传感器** | `sensor.read`, `sensor.list` | 身体传感器 |
| **振动** | `haptic.vibrate` | 无 |

网关的 `openclaw.json` 会在启动前自动修改，清空 `denyCommands` 并设置 `allowCommands` 包含全部 15 个命令。

### Termux CLI
- **单命令安装** — 安装 proot-distro、Ubuntu、Node.js 22 和 OpenClaw
- **Bionic 绕过** — 修复 Android Bionic libc 上 `os.networkInterfaces()` 崩溃问题
- **智能加载** — 显示加载动画直到网关就绪
- **命令透传** — 通过 `openclawx` 运行任何 OpenClaw 命令

---

## 重要警告

> **存储权限** — 此应用**不需要**完整存储权限即可正常运行。如果被提示，请**拒绝**存储权限，除非你确实需要 proot 访问 `/sdcard`。授予 `MANAGE_EXTERNAL_STORAGE` 权限允许 proot 环境读取和修改设备上的**所有文件**，包括照片、下载内容和文档。早期版本会在启动时自动请求此权限，可能导致意外数据丢失（见 [#67](https://github.com/mithun50/openclaw-termux/issues/67)、[#63](https://github.com/mithun50/openclaw-termux/issues/63)）。此问题已修复 — 存储访问现在只能在设置中手动开启。

> **电池优化** — 在 Android 设置中为应用禁用电池优化，防止 Android 在后台杀死网关进程。否则网关可能在几分钟后静默崩溃。

> **首次启动** — 初始安装需下载约 500MB（Ubuntu rootfs + Node.js）。开始前请确保网络稳定且有足够存储空间。

---

## 快速开始

### Flutter 应用（推荐）

1. 从 [Releases](https://github.com/mithun50/openclaw-termux/releases) 下载最新 APK
2. 在 Android 设备上安装 APK
3. 打开应用，点击**开始安装**
4. 安装完成后，可选择从软件包卡片安装 **Go** 或 **Homebrew**
5. 在**引导配置**中配置 API 密钥
6. 在控制面板点击**启动网关**

或从源码构建：

```bash
git clone https://github.com/mithun50/openclaw-termux.git
cd openclaw-termux/flutter_app
flutter build apk --release
```

### Termux CLI

#### 一行命令（推荐）

```bash
curl -fsSL https://raw.githubusercontent.com/mithun50/openclaw-termux/main/install.sh | bash
```

#### 或通过 npm

```bash
npm install -g openclaw-termux
openclawx setup
```

---

## 系统要求

| 要求 | 详情 |
|-------------|---------|
| **Android** | 10 或更高版本（API 29） |
| **存储空间** | 约 500MB 用于 Ubuntu + Node.js + OpenClaw |
| **架构** | arm64-v8a, armeabi-v7a, x86_64 |
| **Termux**（仅 CLI） | 从 [F-Droid](https://f-droid.org/packages/com.termux/) 安装（非 Play Store 版本） |

---

## CLI 使用

```bash
# 首次安装（安装 proot + Ubuntu + Node.js + OpenClaw）
openclawx setup

# 检查安装状态
openclawx status

# 启动 OpenClaw 网关
openclawx start

# 运行引导配置，设置 API 密钥
openclawx onboarding

# 进入 Ubuntu shell
openclawx shell

# 直接运行任何 OpenClaw 命令
openclawx doctor
openclawx gateway --verbose
```

---

## 架构

```
┌───────────────────────────────────────────────────┐
│                Flutter 应用 (Dart)                │
│  ┌──────────┐ ┌──────────┐ ┌──────────────┐       │
│  │ 终端模拟器│ │ 网关控制 │ │ Web 控制面板 │       │
│  │          │ │          │ │   (WebView)  │       │
│  └─────┬────┘ └─────┬────┘ └──────┬───────┘       │
│        │            │             │               │
│  ┌─────┴────────────┴─────────────┴─────────────┐ │
│  │           Native Bridge (Kotlin)             │ │
│  └─────────────────┬────────────────────────────┘ │
│                    │                              │
│  ┌─────────────────┴────────────────────────────┐ │
│  │         Node Provider (WebSocket)            │ │
│  │  相机 · 闪光灯 · 位置 · 屏幕                  │ │
│  │  传感器 · 振动 · 画布                         │ │
│  └─────────────────┬────────────────────────────┘ │
└────────────────────┼──────────────────────────────┘
                     │
┌────────────────────┼──────────────────────────────┐
│  proot-distro      │              Ubuntu          │
│  ┌─────────────────┴──────────────────────────┐   │
│  │   Node.js 22 + Bionic 绕过                 │   │
│  │   ┌─────────────────────────────────────┐  │   │
│  │   │  OpenClaw AI 网关                   │  │   │
│  │   │  http://localhost:18789             │  │   │
│  │   │  ← 节点 WS: 15 个设备命令           │  │   │
│  │   └─────────────────────────────────────┘  │   │
│  │   可选: Go, Homebrew                       │   │
│  └────────────────────────────────────────────┘   │
└───────────────────────────────────────────────────┘
```

### Flutter 应用结构

```
flutter_app/lib/
├── main.dart                  # 应用入口
├── constants.dart             # 应用常量、URL、作者信息
├── models/
│   ├── gateway_state.dart     # 网关状态、日志、token URL
│   ├── node_state.dart        # 节点连接状态
│   ├── node_frame.dart        # WebSocket 帧模型 (请求/响应/事件)
│   ├── setup_state.dart       # 安装向导进度
│   ├── optional_package.dart  # 可选软件包元数据 (Go, Homebrew)
│   └── ai_provider.dart       # AI 提供商数据模型 (7 个提供商)
├── providers/
│   ├── gateway_provider.dart  # 网关状态管理
│   ├── node_provider.dart     # 节点能力 + 权限管理
│   └── setup_provider.dart    # 安装状态管理
├── screens/
│   ├── splash_screen.dart     # 启动屏幕与路由
│   ├── setup_wizard_screen.dart    # 首次安装 + 可选软件包
│   ├── onboarding_screen.dart      # API 密钥配置终端
│   ├── dashboard_screen.dart       # 主控制面板与快捷操作
│   ├── terminal_screen.dart        # 完整终端模拟器
│   ├── configure_screen.dart       # openclaw configure 终端
│   ├── web_dashboard_screen.dart   # OpenClaw 控制面板 WebView
│   ├── providers_screen.dart       # AI 提供商列表
│   ├── provider_detail_screen.dart # API 密钥 + 模型配置
│   ├── ssh_screen.dart             # SSH 服务器管理
│   ├── packages_screen.dart        # 可选软件包管理器
│   ├── package_install_screen.dart # 基于终端的软件包安装器
│   ├── logs_screen.dart            # 网关日志查看器
│   └── settings_screen.dart        # 应用设置与关于
├── services/
│   ├── native_bridge.dart     # Kotlin 平台通道桥接
│   ├── gateway_service.dart   # 网关生命周期、健康检查、配置修改
│   ├── node_service.dart      # 节点 WebSocket 连接 + 调用处理
│   ├── node_ws_service.dart   # 原始 WebSocket 传输
│   ├── node_identity_service.dart # 设备身份 + 加密签名
│   ├── terminal_service.dart  # proot shell 配置
│   ├── bootstrap_service.dart # 环境安装编排
│   ├── package_service.dart   # 可选软件包状态检查
│   ├── preferences_service.dart # 持久化设置 (token URL 等)
│   ├── provider_config_service.dart # AI 提供商配置读写
│   ├── ssh_service.dart       # 通过原生桥接管理 SSH 服务器
│   └── capabilities/
│       ├── capability_handler.dart   # 带权限处理的基类
│       ├── camera_capability.dart    # 照片/视频捕获
│       ├── canvas_capability.dart    # WebView 存根（未实现）
│       ├── flash_capability.dart     # 闪光灯 开/关/切换
│       ├── location_capability.dart  # GPS 带超时 + 回退
│       ├── screen_capability.dart    # 通过 MediaProjection 录屏
│       ├── sensor_capability.dart    # 加速度计、陀螺仪等
│       └── vibration_capability.dart # 触觉反馈
└── widgets/
    ├── gateway_controls.dart  # 启动/停止、URL 显示、复制按钮
    ├── node_controls.dart     # 节点 启用/禁用、状态徽章
    ├── terminal_toolbar.dart  # 扩展键盘 (Tab, Ctrl, Esc, 方向键)
    ├── status_card.dart       # 可复用状态卡片
    └── progress_step.dart     # 安装向导步骤指示器
```

---

## 配置

### 引导配置

运行引导配置（应用内或通过 `openclawx onboarding`）时：

- **绑定地址**：非 root 设备选择 `Loopback (127.0.0.1)`
- **API 密钥**：添加你的 Gemini/OpenAI/Claude 密钥
- **Token URL**：应用自动捕获并存储认证 token URL（如 `http://localhost:18789/#token=...`）

### 电池优化

> **重要：** 为应用禁用电池优化以保持网关在后台运行。

**Flutter 应用：** 设置 > 电池优化 > 点击禁用

**Termux：** Android 设置 > 应用 > Termux > 电池 > **无限制**

---

## 控制面板

在应用显示的 token URL 访问 Web 控制面板（如 `http://localhost:18789/#token=...`）。

Flutter 应用通过内置 WebView 自动加载控制面板并带入认证 token。

| 命令 | 描述 |
|---------|-------------|
| `/status` | 检查网关状态 |
| `/think high` | 启用高质量思考模式 |
| `/reset` | 重置会话 |

---

## 故障排除

### 使用应用后文件被删除或丢失

v1.8.4 之前的版本会在启动时自动请求完整存储权限（`MANAGE_EXTERNAL_STORAGE`）。结合 proot rootfs 中指向 `/sdcard` 的符号链接，清理操作可能跟随这些链接删除真实用户文件。**此问题已修复** — 存储权限不再自动请求，删除时不跟随符号链接，并添加了路径边界检查防止删除应用私有目录之外的任何内容。如受影响，请参阅 [#67](https://github.com/mithun50/openclaw-termux/issues/67)。

撤销存储权限：Android 设置 > 应用 > OpenClaw > 权限 > 文件和媒体 > 不允许。

### 网关无法启动

```bash
# 检查状态
openclawx status

# 如需要，重新运行安装
openclawx setup

# 确保引导配置已完成
openclawx onboarding
```

### "os.networkInterfaces" 错误

Bionic 绕过未配置。重新运行安装：

```bash
openclawx setup
```

### 进程在后台被杀死

在 Android 设置中为应用禁用电池优化。

### 权限被拒绝

```bash
termux-setup-storage
```

---

## 手动安装

<details>
<summary>点击展开手动安装步骤</summary>

### 1. 安装 proot-distro 和 Ubuntu

```bash
pkg update && pkg install -y proot-distro
proot-distro install ubuntu
```

### 2. 在 Ubuntu 中设置 Node.js

```bash
proot-distro login ubuntu
apt update && apt install -y curl
curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
apt install -y nodejs
npm install -g openclaw
```

### 3. 创建 Bionic 绕过

```bash
mkdir -p ~/.openclaw
cat > ~/.openclaw/bionic-bypass.js << 'EOF'
const os = require('os');
const originalNetworkInterfaces = os.networkInterfaces;
os.networkInterfaces = function() {
  try {
    const interfaces = originalNetworkInterfaces.call(os);
    if (interfaces && Object.keys(interfaces).length > 0) {
      return interfaces;
    }
  } catch (e) {}
  return {
    lo: [{
      address: '127.0.0.1',
      netmask: '255.0.0.0',
      family: 'IPv4',
      mac: '00:00:00:00:00:00',
      internal: true,
      cidr: '127.0.0.1/8'
    }]
  };
};
EOF
```

### 4. 添加到 bashrc

```bash
echo 'export NODE_OPTIONS="--require ~/.openclaw/bionic-bypass.js"' >> ~/.bashrc
source ~/.bashrc
```

### 5. 运行 OpenClaw

```bash
openclaw onboarding  # 选择 "Loopback (127.0.0.1)"
openclaw gateway --verbose
```

</details>

---

## 贡献

欢迎贡献！请随时提交 Pull Request。

1. Fork 本仓库
2. 创建功能分支 (`git checkout -b feature/amazing-feature`)
3. 提交更改 (`git commit -m 'Add amazing feature'`)
4. 推送到分支 (`git push origin feature/amazing-feature`)
5. 打开 Pull Request

---

## 作者

**Mithun Gowda B** | [NextGenX](https://play.google.com/store/apps/dev?id=8262374975871504599)

- GitHub: [@mithun50](https://github.com/mithun50)
- Email: [mithungowda.b7411@gmail.com](mailto:mithungowda.b7411@gmail.com)
- Instagram: [@nexgenxplorer_nxg](https://www.instagram.com/nexgenxplorer_nxg)
- YouTube: [@nexgenxplorer](https://youtube.com/@nexgenxplorer?si=UG-wBC8UIyeT4bbw)
- Play Store: [NextGenX Apps](https://play.google.com/store/apps/dev?id=8262374975871504599)
- 联系方式: [nxgextra@gmail.com](mailto:nxgextra@gmail.com)

---

## 许可证

MIT License - 详见 [LICENSE](LICENSE) 文件。

---

<p align="center">
  由 <a href="https://github.com/mithun50">Mithun Gowda B</a> 为 Android 社区用 &#10084;&#65039; 制作 | <b>NextGenX</b>
</p>
