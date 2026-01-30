-- ============================================
-- 标签页切换测试脚本
-- 用于测试不同的标签页切换快捷键
-- ============================================

print("========================================")
print("标签页切换测试")
print("========================================")
print("")
print("请在浏览器或 VS Code 中测试以下快捷键：")
print("")
print("方案 1: Cmd+Shift+[ 和 Cmd+Shift+]")
print("执行中...")

-- 等待 2 秒
hs.timer.doAfter(2, function()
    print("尝试切换到下一个标签页 (Cmd+Shift+])")
    hs.eventtap.event.newKeyEvent({"cmd", "shift"}, "]", true):post()
    hs.timer.usleep(10000)
    hs.eventtap.event.newKeyEvent({"cmd", "shift"}, "]", false):post()
    hs.alert.show("Cmd+Shift+]", 1)
end)

hs.timer.doAfter(4, function()
    print("尝试切换到上一个标签页 (Cmd+Shift+[)")
    hs.eventtap.event.newKeyEvent({"cmd", "shift"}, "[", true):post()
    hs.timer.usleep(10000)
    hs.eventtap.event.newKeyEvent({"cmd", "shift"}, "[", false):post()
    hs.alert.show("Cmd+Shift+[", 1)
end)

print("")
print("方案 2: Cmd+Alt+Left/Right 方向键")

hs.timer.doAfter(6, function()
    print("尝试切换到下一个标签页 (Cmd+Alt+Right)")
    hs.eventtap.event.newKeyEvent({"cmd", "alt"}, "right", true):post()
    hs.timer.usleep(10000)
    hs.eventtap.event.newKeyEvent({"cmd", "alt"}, "right", false):post()
    hs.alert.show("Cmd+Alt+Right", 1)
end)

hs.timer.doAfter(8, function()
    print("尝试切换到上一个标签页 (Cmd+Alt+Left)")
    hs.eventtap.event.newKeyEvent({"cmd", "alt"}, "left", true):post()
    hs.timer.usleep(10000)
    hs.eventtap.event.newKeyEvent({"cmd", "alt"}, "left", false):post()
    hs.alert.show("Cmd+Alt+Left", 1)
end)

print("")
print("方案 3: Ctrl+Tab 和 Ctrl+Shift+Tab")

hs.timer.doAfter(10, function()
    print("尝试切换到下一个标签页 (Ctrl+Tab)")
    hs.eventtap.event.newKeyEvent({"ctrl"}, "tab", true):post()
    hs.timer.usleep(10000)
    hs.eventtap.event.newKeyEvent({"ctrl"}, "tab", false):post()
    hs.alert.show("Ctrl+Tab", 1)
end)

hs.timer.doAfter(12, function()
    print("尝试切换到上一个标签页 (Ctrl+Shift+Tab)")
    hs.eventtap.event.newKeyEvent({"ctrl", "shift"}, "tab", true):post()
    hs.timer.usleep(10000)
    hs.eventtap.event.newKeyEvent({"ctrl", "shift"}, "tab", false):post()
    hs.alert.show("Ctrl+Shift+Tab", 1)
    
    hs.timer.doAfter(2, function()
        print("")
        print("========================================")
        print("测试完成！请观察哪个快捷键有效")
        print("========================================")
    end)
end)

print("")
print("✅ 测试已开始，每 2 秒自动测试一个快捷键")
print("📝 请保持当前应用获得焦点，观察标签页是否切换")
print("")
