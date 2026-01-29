# Hammerspoon 配置说明

## 📁 项目结构

```
~/.hammerspoon/
├── init.lua                    # 主入口文件
├── config.lua                  # 全局配置
│
├── modules/                    # 功能模块
│   ├── app-launcher.lua       # 应用快速启动
│   ├── window-management.lua  # 窗口管理
│   ├── japanese-keyboard.lua  # 日语键盘重映射 ⭐
│   ├── input-source.lua       # 输入法自动切换
│   └── auto-reload.lua        # 自动重载
│
├── apps/                       # 应用特定配置
│   ├── vscode.lua
│   ├── chrome.lua
│   ├── wechat.lua
│   ├── wecom.lua
│   ├── firefox.lua
│   ├── intellij.lua
│   ├── iterm.lua
│   └── ghostty.lua
│
├── utils/                      # 工具函数
│   └── helpers.lua
│
└── Spoons/                     # Spoons 插件
```

## ⌨️ 日语键盘特殊键重映射

### 核心功能

在**英文或中文输入法模式**下,「英数」和「かな」键会被重新映射为窗口管理快捷键:

- **「英数」键** → 窗口移至左半屏
- **「かな」键** → 窗口移至右半屏

当切换到**日语输入法**时,这两个键恢复原始功能。

### 自定义映射

编辑 `config.lua` 中的 `japaneseKeyboard` 配置:

```lua
config.japaneseKeyboard = {
    eisuMapping = {
        enabled = true,
        type = "window",      -- 类型: "window", "hyper", "app", "custom"
        action = "leftHalf"   -- 窗口操作: "leftHalf", "rightHalf", "fullScreen", 等
    },
    kanaMapping = {
        enabled = true,
        type = "window",
        action = "rightHalf"
    }
}
```

**可用的窗口操作:**
- `leftHalf` - 左半屏
- `rightHalf` - 右半屏
- `topHalf` - 上半屏
- `bottomHalf` - 下半屏
- `fullScreen` - 全屏
- `center` - 居中

## 🚀 应用快速启动

| 快捷键 | 应用 |
|--------|------|
| `Cmd+Ctrl+1` | VSCode |
| `Cmd+Ctrl+2` | Chrome |
| `Cmd+Ctrl+3` | WeChat |
| `Cmd+Ctrl+4` | WeCom |
| `Cmd+Ctrl+5` | Firefox |
| `Cmd+Ctrl+6` | IntelliJ IDEA |
| `Cmd+Ctrl+7` | iTerm |
| `Cmd+Ctrl+8` | Ghostty |

## 🪟 窗口管理快捷键

| 快捷键 | 功能 |
|--------|------|
| `Cmd+Alt+←` | 左半屏 |
| `Cmd+Alt+→` | 右半屏 |
| `Cmd+Alt+↑` | 上半屏 |
| `Cmd+Alt+↓` | 下半屏 |
| `Cmd+Alt+F` | 全屏 |
| `Cmd+Alt+C` | 居中 |

> **💡 提示**: 请在普通应用窗口(如 VSCode、Chrome、Finder)上测试窗口管理功能。Hammerspoon Console 窗口可能有特殊限制,无法被调整大小。

## 🌐 输入法自动切换

应用切换时自动切换输入法:

- **代码编辑器** (VSCode, IntelliJ, iTerm, Ghostty) → 英文
- **聊天应用** (WeChat, WeCom) → 中文
- **浏览器** (Chrome, Firefox) → 保持上次状态

### 自定义输入法偏好

编辑 `config.lua` 中的 `appInputPreferences`:

```lua
config.appInputPreferences = {
    ["应用名称"] = "english",  -- 或 "chinese", "japanese"
}
```

## 🔧 配置修改

1. **修改应用路径**: 编辑 `config.lua` 中的 `config.apps`
2. **修改快捷键**: 编辑 `config.lua` 中的相应配置
3. **添加新功能**: 在 `modules/` 或 `apps/` 目录创建新模块

配置文件修改后会自动重载,无需手动重启 Hammerspoon。

## 📝 日志查看

打开 Hammerspoon Console 查看详细日志:
- 菜单栏点击 Hammerspoon 图标
- 选择 "Console"

## ⚙️ 输入法配置

如果输入法自动切换不工作,请检查 `config.lua` 中的输入法 ID:

```bash
# 在终端运行以下命令查看可用的输入法 ID
defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleEnabledInputSources
```

然后更新 `config.inputSources` 中的值。

## 🎯 使用建议

1. **日语键盘用户**: 充分利用「英数」和「かな」键的重映射功能
2. **多语言环境**: 配置好输入法自动切换,提高效率
3. **自定义扩展**: 在 `apps/` 目录为常用应用添加专属配置

---

**享受高效的 macOS 工作流!** 🚀
