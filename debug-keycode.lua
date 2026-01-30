-- ============================================
-- 按键码调试工具
-- 用于检测按键的实际 keycode
-- ============================================

local module = {}

local debugTap = nil

function module.start()
    print("========================================")
    print("按键调试模式已启动")
    print("请按下英数键和かな键，观察输出的 keycode")
    print("按 Cmd+Ctrl+D 停止调试")
    print("========================================")
    
    -- 创建事件监听器，监听所有按键事件
    debugTap = hs.eventtap.new(
        {hs.eventtap.event.types.keyDown},
        function(event)
            local keyCode = event:getKeyCode()
            local flags = event:getFlags()
            local keyName = hs.keycodes.map[keyCode] or "unknown"
            
            -- 显示按键信息
            print(string.format("Key pressed - Code: %d, Name: %s, Flags: %s", 
                keyCode, 
                keyName,
                hs.inspect(flags)
            ))
            
            -- 特别标记可能是英数键或かな键的按键
            if keyCode >= 100 and keyCode <= 110 then
                hs.alert.show(string.format("KeyCode: %d", keyCode), 1)
            end
            
            return false  -- 不拦截事件
        end
    )
    
    debugTap:start()
    
    -- 添加停止调试的快捷键 Cmd+Ctrl+D
    hs.hotkey.bind({"cmd", "ctrl"}, "d", function()
        module.stop()
    end)
end

function module.stop()
    if debugTap then
        debugTap:stop()
        debugTap = nil
        print("========================================")
        print("按键调试模式已停止")
        print("========================================")
        hs.alert.show("调试模式已停止", 2)
    end
end

return module
