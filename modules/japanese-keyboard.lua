-- ============================================
-- 日语键盘特殊键重映射模块
-- ============================================

local module = {}
local config = require("config")
local helpers = require("utils.helpers")
local windowMgmt = require("modules.window-management")

local eventtap = nil

-- ============================================
-- 处理英数键(Eisu Key)
-- ============================================
local function handleEisuKey()
    local mapping = config.japaneseKeyboard.eisuMapping
    
    if not mapping.enabled then
        return false
    end
    
    -- 只在英文或中文输入法下拦截
    if not helpers.isEnglishOrChinese() then
        return false
    end
    
    helpers.log("Eisu key pressed in EN/CN mode, executing: " .. mapping.action)
    
    -- 根据映射类型执行相应操作
    if mapping.type == "window" then
        windowMgmt.executeAction(mapping.action)
        return true
    elseif mapping.type == "tab" then
        -- 标签页切换 - 使用更可靠的按键模拟方式
        if mapping.action == "previous" then
            -- 切换到上一个标签页 (Cmd+Shift+[)
            hs.eventtap.event.newKeyEvent({"cmd", "shift"}, "[", true):post()
            hs.timer.usleep(10000) -- 10ms 延迟
            hs.eventtap.event.newKeyEvent({"cmd", "shift"}, "[", false):post()
        elseif mapping.action == "next" then
            -- 切换到下一个标签页 (Cmd+Shift+])
            hs.eventtap.event.newKeyEvent({"cmd", "shift"}, "]", true):post()
            hs.timer.usleep(10000) -- 10ms 延迟
            hs.eventtap.event.newKeyEvent({"cmd", "shift"}, "]", false):post()
        end
        return true
    elseif mapping.type == "hyper" then
        -- Hyper 键实现(Cmd+Ctrl+Alt+Shift)
        -- 这里可以触发其他自定义操作
        helpers.showAlert("Hyper Key")
        return true
    elseif mapping.type == "app" then
        -- 应用启动
        if mapping.appName then
            helpers.launchOrFocusApp(mapping.appName)
        end
        return true
    elseif mapping.type == "custom" and mapping.callback then
        -- 自定义回调
        mapping.callback()
        return true
    end
    
    return false
end

-- ============================================
-- 处理かな键(Kana Key)
-- ============================================
local function handleKanaKey()
    local mapping = config.japaneseKeyboard.kanaMapping
    
    if not mapping.enabled then
        return false
    end
    
    -- 只在英文或中文输入法下拦截
    if not helpers.isEnglishOrChinese() then
        return false
    end
    
    helpers.log("Kana key pressed in EN/CN mode, executing: " .. mapping.action)
    
    -- 根据映射类型执行相应操作
    if mapping.type == "window" then
        windowMgmt.executeAction(mapping.action)
        return true
    elseif mapping.type == "tab" then
        -- 标签页切换 - 使用更可靠的按键模拟方式
        if mapping.action == "previous" then
            -- 切换到上一个标签页 (Cmd+Shift+[)
            hs.eventtap.event.newKeyEvent({"cmd", "shift"}, "[", true):post()
            hs.timer.usleep(10000) -- 10ms 延迟
            hs.eventtap.event.newKeyEvent({"cmd", "shift"}, "[", false):post()
        elseif mapping.action == "next" then
            -- 切换到下一个标签页 (Cmd+Shift+])
            hs.eventtap.event.newKeyEvent({"cmd", "shift"}, "]", true):post()
            hs.timer.usleep(10000) -- 10ms 延迟
            hs.eventtap.event.newKeyEvent({"cmd", "shift"}, "]", false):post()
        end
        return true
    elseif mapping.type == "hyper" then
        helpers.showAlert("Hyper Key (Kana)")
        return true
    elseif mapping.type == "app" then
        if mapping.appName then
            helpers.launchOrFocusApp(mapping.appName)
        end
        return true
    elseif mapping.type == "custom" and mapping.callback then
        mapping.callback()
        return true
    end
    
    return false
end

-- ============================================
-- 键盘事件处理
-- ============================================
local function keyEventHandler(event)
    local keyCode = event:getKeyCode()
    local flags = event:getFlags()
    
    -- 检测英数键(keycode 102)
    if keyCode == config.japaneseKeyboard.eisuKey then
        if event:getType() == hs.eventtap.event.types.keyDown then
            -- 如果成功处理,则拦截该事件
            if handleEisuKey() then
                return true  -- 拦截事件
            end
        end
    end
    
    -- 检测かな键(keycode 104)
    if keyCode == config.japaneseKeyboard.kanaKey then
        if event:getType() == hs.eventtap.event.types.keyDown then
            if handleKanaKey() then
                return true  -- 拦截事件
            end
        end
    end
    
    -- 不拦截其他事件
    return false
end

-- ============================================
-- 初始化模块
-- ============================================
function module.init()
    helpers.log("Initializing Japanese keyboard remapping...")
    
    -- 创建事件监听器
    eventtap = hs.eventtap.new(
        {hs.eventtap.event.types.keyDown},
        keyEventHandler
    )
    
    -- 启动监听
    eventtap:start()
    
    helpers.log("Japanese keyboard remapping enabled")
    helpers.log("  Eisu key (102) -> " .. config.japaneseKeyboard.eisuMapping.action)
    helpers.log("  Kana key (104) -> " .. config.japaneseKeyboard.kanaMapping.action)
end

-- ============================================
-- 停止模块
-- ============================================
function module.stop()
    if eventtap then
        eventtap:stop()
        helpers.log("Japanese keyboard remapping disabled")
    end
end

return module
