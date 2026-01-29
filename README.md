# Hammerspoon Configuration

[简体中文](#简体中文) | [English](#english) | [日本語](#日本語)

---

## 简体中文

### 📁 项目结构
- `init.lua`: 主入口文件
- `config.lua`: 全局配置文件 (快捷键、应用路径、输入法偏好)
- `modules/`: 核心功能模块 (窗口管理、日语键盘映射、输入法切换)
- `apps/`: 应用特定配置
- `utils/`: 工具函数

### ⌨️ 日语键盘重映射
在 **英文或中文** 输入法下：
- **「英数」键** → 窗口移至左半屏
- **「かな」键** → 窗口移至右半屏
- 切换到 **日语输入法** 时，按键恢复原始功能。

### 🚀 应用快速启动
- `Cmd+Ctrl+1-8`: 快速启动或切换至 VSCode, Chrome, 微信, 企业微信等。

### 🌐 输入法自动切换 (工具化逻辑)
- **默认行为**: 所有未定义应用在激活时自动切换为 **英文 (ABC)**。
- **中文白名单**: 微信、企业微信等自动切换为中文。
- **保持原样**: 浏览器 (Chrome, Safari, Firefox) 保持上次状态。

### 🪟 窗口管理
- `Cmd+Ctrl + H/L/J/K`: 左/右/上/下半屏
- `Cmd+Ctrl + F/C/M`: 全屏/居中/居中(80%)

---

## English

### 📁 Project Structure
- `init.lua`: Main entry point
- `config.lua`: Global configuration (Hotkeys, App paths, Input preferences)
- `modules/`: Core modules (Window mgmt, Japanese keyboard, Input switching)
- `apps/`: App-specific settings
- `utils/`: Helper functions

### ⌨️ Japanese Keyboard Remapping
When using **English or Chinese** input sources:
- **"Eisu" (英数) Key** → Move window to Left Half
- **"Kana" (かな) Key** → Move window to Right Half
- Reverts to original functions when switched to **Japanese input source**.

### 🚀 App Launcher
- `Cmd+Ctrl+1-8`: Quick launch or focus on VSCode, Chrome, WeChat, WeCom, etc.

### 🌐 Input Source Auto-Switching (Utility Mode)
- **Default**: Automatically switches to **English (ABC)** for any undefined applications.
- **Chinese Whitelist**: Switches to Chinese for WeChat, WeCom, etc.
- **Keep State**: Browsers (Chrome, Safari, Firefox) will maintain their current input state.

### 🪟 Window Management
- `Cmd+Ctrl + H/L/J/K`: Left/Right/Top/Bottom Half
- `Cmd+Ctrl + F/C/M`: Fullscreen/Center/Center(80%)

---

## 日本語

### 📁 プロジェクト構成
- `init.lua`: メイン・エントリ・ファイル
- `config.lua`: グローバル設定 (ショートカット、アプリパス、入力ソース設定)
- `modules/`: コア機能モジュール (ウィンドウ管理、日本語キーボード、入力ソース切替)
- `apps/`: アプリ固有の設定
- `utils/`: ヘルパー関数

### ⌨️ 日本語キーボードの再配置
**英語または中国語** 入力ソースを使用している場合：
- **「英数」キー** → ウィンドウを左半分に移動
- **「かな」キー** → ウィンドウを右半分に移動
- **日本語入力** に切り替えると、キーは元の機能に戻ります。

### 🚀 アプリランチャー
- `Cmd+Ctrl+1-8`: VSCode, Chrome, WeChat, WeCom などのアプリを素早く起動またはフォーカスします。

### 🌐 入力ソース自動切り替え (ツール・ロジック)
- **デフォルト**: 定義されていないアプリがアクティブになると、自動的に **英語 (ABC)** に切り替わります。
- **中国語ホワイトリスト**: WeChat、WeCom などは自動的に中国語に切り替わります。
- **状態保持**: ブラウザ (Chrome, Safari, Firefox) は現在の入力状態を維持します。

### 🪟 ウィンドウ管理
- `Cmd+Ctrl + H/L/J/K`: 左/右/上/下半分
- `Cmd+Ctrl + F/C/M`: フルスクリーン/中央/中央(80%)
