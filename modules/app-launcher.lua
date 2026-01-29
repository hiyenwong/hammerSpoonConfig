-- ============================================
-- 应用快速启动模块
-- ============================================

local module = {}
local config = require("config")
local helpers = require("utils.helpers")

function module.init()
    helpers.log("Initializing app launcher...")
    
    -- 为每个应用绑定快捷键
    for _, hotkey in ipairs(config.appHotkeys) do
        local appName = config.apps[hotkey.app]
        
        if appName then
            hs.hotkey.bind({"cmd", "ctrl"}, hotkey.key, function()
                helpers.log("Launching: " .. appName)
                helpers.launchOrFocusApp(appName)
            end)
        else
            helpers.log("App not found in config: " .. hotkey.app, "warn")
        end
    end
    
    helpers.log("App launcher initialized with " .. #config.appHotkeys .. " hotkeys")
end

return module
