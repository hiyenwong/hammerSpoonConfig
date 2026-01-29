-- ============================================
-- Hammerspoon 主配置文件
-- 模块化配置,支持日语键盘特殊键重映射
-- ============================================

-- 加载全局配置
local config = require("config")
local helpers = require("utils.helpers")

-- ============================================
-- 加载核心功能模块
-- ============================================

-- 1. 自动重载配置
local autoReload = require("modules.auto-reload")
autoReload.init()

-- 2. 应用快速启动
local appLauncher = require("modules.app-launcher")
appLauncher.init()

-- 3. 窗口管理
local windowMgmt = require("modules.window-management")
windowMgmt.init()

-- 4. 日语键盘特殊键重映射 (核心功能)
local japaneseKeyboard = require("modules.japanese-keyboard")
japaneseKeyboard.init()

-- 5. 输入法自动切换
local inputSource = require("modules.input-source")
inputSource.init()

-- ============================================
-- 加载应用特定配置
-- ============================================
local apps = {
    require("apps.vscode"),
    require("apps.chrome"),
    require("apps.wechat"),
    require("apps.wecom"),
    require("apps.firefox"),
    require("apps.intellij"),
    require("apps.iterm"),
    require("apps.ghostty")
}

for _, app in ipairs(apps) do
    if app.init then
        app.init()
    end
end

-- ============================================
-- 初始化完成
-- ============================================
helpers.log("========================================")
helpers.log("Hammerspoon configuration loaded successfully!")
helpers.log("Japanese keyboard remapping: ENABLED")
helpers.log("  Eisu key -> " .. config.japaneseKeyboard.eisuMapping.action)
helpers.log("  Kana key -> " .. config.japaneseKeyboard.kanaMapping.action)
helpers.log("Window management: ENABLED")
helpers.log("  Cmd+Ctrl+H/L/F/C/J/K")
helpers.log("App launcher: ENABLED")
helpers.log("  Cmd+Ctrl+1-8")
helpers.log("========================================")