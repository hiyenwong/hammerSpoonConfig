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
- **「英数」键** → 切换到上一个标签页 (Cmd+Shift+[)
- **「かな」键** → 切换到下一个标签页 (Cmd+Shift+])
- 切换到 **日语输入法** 时，按键恢复原始功能。

### 🚀 应用快速启动
- `Cmd+Ctrl+1-8`: 快速启动或切换至 VSCode, Chrome, 微信, 企业微信等。

### 🌐 输入法自动切换 (工具化逻辑)
- **默认行为**: 所有未定义应用在激活时自动切换为 **英文 (ABC)**。
- **中文白名单**: 微信、企业微信等自动切换为中文。
- **保持原样**: 浏览器 (Chrome, Safari, Firefox) 保持上次状态。

### 🪟 窗口管理
#### 半屏布局
- `Cmd+Ctrl + H/L`: 左/右半屏
- `Cmd+Ctrl + J/K`: 上/下半屏

#### 四角布局 (四分之一屏幕)
- `Cmd+Ctrl + U`: 左上角
- `Cmd+Ctrl + I`: 右上角
- `Cmd+Ctrl + N`: 左下角
- `Cmd+Ctrl + M`: 右下角

#### 全屏和居中
- `Cmd+Ctrl + F`: 全屏
- `Cmd+Ctrl + C`: 居中 (保持窗口大小)
- `Cmd+Ctrl + B`: 居中 80% (缩小并居中)

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
- **"Eisu" (英数) Key** → Switch to Previous Tab (Cmd+Shift+[)
- **"Kana" (かな) Key** → Switch to Next Tab (Cmd+Shift+])
- Reverts to original functions when switched to **Japanese input source**.

### 🚀 App Launcher
- `Cmd+Ctrl+1-8`: Quick launch or focus on VSCode, Chrome, WeChat, WeCom, etc.

### 🌐 Input Source Auto-Switching (Utility Mode)
- **Default**: Automatically switches to **English (ABC)** for any undefined applications.
- **Chinese Whitelist**: Switches to Chinese for WeChat, WeCom, etc.
- **Keep State**: Browsers (Chrome, Safari, Firefox) will maintain their current input state.

### 🪟 Window Management
#### Half Screen Layouts
- `Cmd+Ctrl + H/L`: Left/Right Half
- `Cmd+Ctrl + J/K`: Top/Bottom Half

#### Quarter Screen Layouts (Four Corners)
- `Cmd+Ctrl + U`: Top-Left Corner
- `Cmd+Ctrl + I`: Top-Right Corner
- `Cmd+Ctrl + N`: Bottom-Left Corner
- `Cmd+Ctrl + M`: Bottom-Right Corner

#### Fullscreen and Centering
- `Cmd+Ctrl + F`: Fullscreen
- `Cmd+Ctrl + C`: Center (keep window size)
- `Cmd+Ctrl + B`: Center 80% (resize and center)

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
- **「英数」キー** → 前のタブに切り替え (Cmd+Shift+[)
- **「かな」キー** → 次のタブに切り替え (Cmd+Shift+])
- **日本語入力** に切り替えると、キーは元の機能に戻ります。

### 🚀 アプリランチャー
- `Cmd+Ctrl+1-8`: VSCode, Chrome, WeChat, WeCom などのアプリを素早く起動またはフォーカスします。

### 🌐 入力ソース自動切り替え (ツール・ロジック)
- **デフォルト**: 定義されていないアプリがアクティブになると、自動的に **英語 (ABC)** に切り替わります。
- **中国語ホワイトリスト**: WeChat、WeCom などは自動的に中国語に切り替わります。
- **状態保持**: ブラウザ (Chrome, Safari, Firefox) は現在の入力状態を維持します。

### 🪟 ウィンドウ管理
#### 半画面レイアウト
- `Cmd+Ctrl + H/L`: 左/右半分
- `Cmd+Ctrl + J/K`: 上/下半分

#### 四隅レイアウト (画面の4分の1)
- `Cmd+Ctrl + U`: 左上隅
- `Cmd+Ctrl + I`: 右上隅
- `Cmd+Ctrl + N`: 左下隅
- `Cmd+Ctrl + M`: 右下隅

#### フルスクリーンと中央配置
- `Cmd+Ctrl + F`: フルスクリーン
- `Cmd+Ctrl + C`: 中央 (ウィンドウサイズを維持)
- `Cmd+Ctrl + B`: 80%で中央配置 (リサイズして中央に)
