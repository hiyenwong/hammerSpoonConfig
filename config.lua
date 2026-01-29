-- ============================================
-- Hammerspoon 全局配置文件
-- ============================================

local config = {}

-- ============================================
-- 应用路径配置
-- ============================================
config.apps = {
    vscode = "Visual Studio Code",
    chrome = "Google Chrome",
    wechat = "WeChat",
    wecom = "企业微信",
    firefox = "Firefox",
    intellij = "IntelliJ IDEA",
    iterm = "iTerm",
    ghostty = "Ghostty"
    -- 如果应用名无效,可以尝试使用 Bundle ID,例如:
    -- wecom = "com.tencent.WWKApi"
}

-- ============================================
-- 输入法配置
-- ============================================
config.inputSources = {
    english = "com.apple.keylayout.ABC",
    chinese = "com.apple.inputmethod.SCIM.ITABC",  -- 简体拼音
    japanese = "com.apple.inputmethod.Kotoeri.Japanese"
}

-- ============================================
-- 应用启动快捷键配置
-- ============================================
config.appHotkeys = {
    {key = "1", app = "vscode"},
    {key = "2", app = "chrome"},
    {key = "3", app = "wechat"},
    {key = "4", app = "wecom"},
    {key = "5", app = "firefox"},
    {key = "6", app = "intellij"},
    {key = "7", app = "iterm"},
    {key = "8", app = "ghostty"}
}

-- ============================================
-- 窗口管理快捷键配置
-- ============================================
config.windowHotkeys = {
    leftHalf = {mods = {"cmd", "ctrl"}, key = "h"},
    rightHalf = {mods = {"cmd", "ctrl"}, key = "l"},
    fullScreen = {mods = {"cmd", "ctrl"}, key = "f"},
    center = {mods = {"cmd", "ctrl"}, key = "c"},
    center80 = {mods = {"cmd", "ctrl"}, key = "m"},
    topHalf = {mods = {"cmd", "ctrl"}, key = "j"},
    bottomHalf = {mods = {"cmd", "ctrl"}, key = "k"}
}

-- ============================================
-- 日语键盘特殊键配置
-- ============================================
config.japaneseKeyboard = {
    eisuKey = 102,  -- 英数键 keycode
    kanaKey = 104,  -- かな键 keycode
    
    -- 英数键映射配置(在英文/中文输入法下)
    eisuMapping = {
        enabled = true,
        -- 可选映射类型: "hyper", "window", "app", "custom"
        type = "window",  -- 默认映射为窗口管理
        action = "leftHalf"  -- 左半屏
    },
    
    -- かな键映射配置(在英文/中文输入法下)
    kanaMapping = {
        enabled = true,
        type = "window",  -- 默认映射为窗口管理
        action = "rightHalf"  -- 右半屏
    }
}

-- ============================================
-- 应用输入法偏好设置 (默认自动切换为英文)
-- ============================================
config.appInputPreferences = {
    -- 中文应用清单
    ["微信"] = "chinese",
    ["WeChat"] = "chinese",
    ["企业微信"] = "chinese",
    ["WeCom"] = "chinese",
    ["iTerm"] = "english",
    ["Ghostty"] = "english",
    ["Visual Studio Code"] = "english",
    ["IntelliJ IDEA"] = "english",
    
    -- 保持原样(不自动切换)的应用
    ["Google Chrome"] = "keep",
    ["Firefox"] = "keep",
    ["Safari"] = "keep"
    
    -- 其他所有应用 (Code, iTerm, Finder 等) 默认切换到 "english"
}

return config
