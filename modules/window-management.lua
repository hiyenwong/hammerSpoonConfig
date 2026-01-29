-- ============================================
-- 窗口管理模块
-- ============================================

local module = {}
local config = require("config")
local helpers = require("utils.helpers")

-- ============================================
-- 窗口布局函数
-- ============================================

-- 左半屏
local function moveToLeftHalf()
    local win = hs.window.focusedWindow()
    if win then
        local screen = win:screen()
        local frame = screen:frame()
        win:setFrame({
            x = frame.x,
            y = frame.y,
            w = frame.w / 2,
            h = frame.h
        })
    end
end

-- 右半屏
local function moveToRightHalf()
    local win = hs.window.focusedWindow()
    if win then
        local screen = win:screen()
        local frame = screen:frame()
        win:setFrame({
            x = frame.x + frame.w / 2,
            y = frame.y,
            w = frame.w / 2,
            h = frame.h
        })
    end
end

-- 全屏
local function moveToFullScreen()
    local win = hs.window.focusedWindow()
    if win then
        win:maximize()
    end
end

-- 居中
local function moveToCenter()
    local win = hs.window.focusedWindow()
    if win then
        win:centerOnScreen()
    end
end

-- 剧中大小 (80%)
local function moveToCenter80()
    local win = hs.window.focusedWindow()
    if win then
        local screen = win:screen()
        local frame = screen:frame()
        win:setFrame({
            x = frame.x + frame.w * 0.1,
            y = frame.y + frame.h * 0.1,
            w = frame.w * 0.8,
            h = frame.h * 0.8
        })
    end
end

-- 上半屏
local function moveToTopHalf()
    local win = hs.window.focusedWindow()
    if win then
        local screen = win:screen()
        local frame = screen:frame()
        win:setFrame({
            x = frame.x,
            y = frame.y,
            w = frame.w,
            h = frame.h / 2
        })
    end
end

-- 下半屏
local function moveToBottomHalf()
    local win = hs.window.focusedWindow()
    if win then
        local screen = win:screen()
        local frame = screen:frame()
        win:setFrame({
            x = frame.x,
            y = frame.y + frame.h / 2,
            w = frame.w,
            h = frame.h / 2
        })
    end
end

-- ============================================
-- 窗口操作映射表
-- ============================================
local windowActions = {
    leftHalf = moveToLeftHalf,
    rightHalf = moveToRightHalf,
    fullScreen = moveToFullScreen,
    center = moveToCenter,
    center80 = moveToCenter80,
    topHalf = moveToTopHalf,
    bottomHalf = moveToBottomHalf
}

-- ============================================
-- 执行窗口操作
-- ============================================
function module.executeAction(actionName)
    local action = windowActions[actionName]
    if action then
        action()
        return true
    else
        helpers.log("Unknown window action: " .. actionName, "warn")
        return false
    end
end

-- ============================================
-- 初始化模块
-- ============================================
function module.init()
    helpers.log("Initializing window management...")
    
    -- 绑定窗口管理快捷键
    local hotkeys = config.windowHotkeys
    
    hs.hotkey.bind(hotkeys.leftHalf.mods, hotkeys.leftHalf.key, moveToLeftHalf)
    hs.hotkey.bind(hotkeys.rightHalf.mods, hotkeys.rightHalf.key, moveToRightHalf)
    hs.hotkey.bind(hotkeys.fullScreen.mods, hotkeys.fullScreen.key, moveToFullScreen)
    hs.hotkey.bind(hotkeys.center.mods, hotkeys.center.key, moveToCenter)
    hs.hotkey.bind(hotkeys.center80.mods, hotkeys.center80.key, moveToCenter80)
    hs.hotkey.bind(hotkeys.topHalf.mods, hotkeys.topHalf.key, moveToTopHalf)
    hs.hotkey.bind(hotkeys.bottomHalf.mods, hotkeys.bottomHalf.key, moveToBottomHalf)
    
    helpers.log("Window management initialized")
end

return module
