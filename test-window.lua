-- 测试窗口管理功能
print("Testing window management...")

-- 测试左半屏
local function testLeftHalf()
    local win = hs.window.focusedWindow()
    if win then
        print("Current window: " .. win:title())
        local screen = win:screen()
        local frame = screen:frame()
        print("Screen frame: x=" .. frame.x .. " y=" .. frame.y .. " w=" .. frame.w .. " h=" .. frame.h)
        
        win:setFrame({
            x = frame.x,
            y = frame.y,
            w = frame.w / 2,
            h = frame.h
        })
        print("Window moved to left half")
    else
        print("No focused window!")
    end
end

-- 绑定测试快捷键
hs.hotkey.bind({"cmd", "alt"}, "left", testLeftHalf)
print("Test hotkey bound: Cmd+Alt+Left")
print("Press Cmd+Alt+Left to test window management")
