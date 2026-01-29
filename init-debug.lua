-- ============================================
-- Hammerspoon 主配置文件 (简化版用于调试)
-- ============================================

print("Loading Hammerspoon config...")

-- 测试基本窗口管理
local function moveToLeftHalf()
    print("moveToLeftHalf called!")
    local win = hs.window.focusedWindow()
    if win then
        print("Window found: " .. win:title())
        local screen = win:screen()
        local frame = screen:frame()
        win:setFrame({
            x = frame.x,
            y = frame.y,
            w = frame.w / 2,
            h = frame.h
        })
        print("Window moved!")
    else
        print("No focused window!")
    end
end

local function moveToRightHalf()
    print("moveToRightHalf called!")
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

-- 绑定快捷键
print("Binding hotkeys...")
hs.hotkey.bind({"cmd", "alt"}, "left", moveToLeftHalf)
hs.hotkey.bind({"cmd", "alt"}, "right", moveToRightHalf)
hs.hotkey.bind({"cmd", "alt"}, "up", function()
    local win = hs.window.focusedWindow()
    if win then
        local screen = win:screen()
        local frame = screen:frame()
        win:setFrame({x = frame.x, y = frame.y, w = frame.w, h = frame.h / 2})
    end
end)
hs.hotkey.bind({"cmd", "alt"}, "down", function()
    local win = hs.window.focusedWindow()
    if win then
        local screen = win:screen()
        local frame = screen:frame()
        win:setFrame({x = frame.x, y = frame.y + frame.h / 2, w = frame.w, h = frame.h / 2})
    end
end)
hs.hotkey.bind({"cmd", "alt"}, "f", function()
    local win = hs.window.focusedWindow()
    if win then win:maximize() end
end)
hs.hotkey.bind({"cmd", "alt"}, "c", function()
    local win = hs.window.focusedWindow()
    if win then win:centerOnScreen() end
end)

print("Hotkeys bound successfully!")
print("Try: Cmd+Alt+Left/Right/Up/Down/F/C")

-- 自动重载
local function reloadConfig(files)
    local doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

hs.alert.show("✓ Config loaded (Debug mode)")
