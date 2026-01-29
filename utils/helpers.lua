-- ============================================
-- Hammerspoon 工具函数库
-- ============================================

local helpers = {}

-- ============================================
-- 获取当前输入法
-- ============================================
function helpers.getCurrentInputSource()
    return hs.keycodes.currentSourceID()
end

-- ============================================
-- 判断是否为英文或中文输入法
-- ============================================
function helpers.isEnglishOrChinese()
    local currentSource = helpers.getCurrentInputSource()
    local config = require("config")
    
    return currentSource == config.inputSources.english or
           currentSource:find("SCIM") or  -- 中文输入法通常包含 SCIM
           currentSource:find("Pinyin") or
           currentSource:find("ABC")
end

-- ============================================
-- 判断是否为日语输入法
-- ============================================
function helpers.isJapanese()
    local currentSource = helpers.getCurrentInputSource()
    return currentSource:find("Japanese") or currentSource:find("Kotoeri")
end

-- ============================================
-- 切换到指定输入法
-- ============================================
function helpers.switchToInputSource(sourceName)
    local config = require("config")
    local targetSource = config.inputSources[sourceName]
    
    if targetSource then
        hs.keycodes.currentSourceID(targetSource)
        return true
    end
    return false
end

-- ============================================
-- 显示通知
-- ============================================
function helpers.showNotification(message, title)
    title = title or "Hammerspoon"
    hs.notify.new({
        title = title,
        informativeText = message,
        withdrawAfter = 2
    }):send()
end

-- ============================================
-- 显示临时提示
-- ============================================
function helpers.showAlert(message, duration)
    duration = duration or 1
    hs.alert.show(message, duration)
end

-- ============================================
-- 日志输出
-- ============================================
function helpers.log(message, level)
    level = level or "info"
    local prefix = "[Hammerspoon] "
    
    if level == "error" then
        print(prefix .. "ERROR: " .. message)
    elseif level == "warn" then
        print(prefix .. "WARN: " .. message)
    else
        print(prefix .. message)
    end
end

-- ============================================
-- 获取当前活动应用
-- ============================================
function helpers.getCurrentApp()
    local app = hs.application.frontmostApplication()
    return app and app:name() or nil
end

-- ============================================
-- 检查应用是否在运行
-- ============================================
function helpers.isAppRunning(appName)
    local app = hs.application.get(appName)
    return app ~= nil and app:isRunning()
end

-- ============================================
-- 安全地启动或聚焦应用
-- ============================================
function helpers.launchOrFocusApp(appName)
    local success = hs.application.launchOrFocus(appName)
    if not success then
        helpers.log("Failed to launch or focus: " .. appName, "error")
        helpers.showAlert("无法启动 " .. appName)
    end
    return success
end

return helpers
