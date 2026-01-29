-- ============================================
-- 自动重载配置模块
-- ============================================

local module = {}
local helpers = require("utils.helpers")

function module.init()
    -- 监听配置文件变化
    local function reloadConfig(files)
        local doReload = false
        for _, file in pairs(files) do
            if file:sub(-4) == ".lua" then
                doReload = true
                break
            end
        end
        
        if doReload then
            helpers.log("Configuration files changed, reloading...")
            hs.reload()
        end
    end
    
    -- 创建文件监听器
    local configWatcher = hs.pathwatcher.new(
        os.getenv("HOME") .. "/.hammerspoon/",
        reloadConfig
    )
    
    configWatcher:start()
    
    helpers.log("Auto-reload enabled")
    helpers.showAlert("✓ Config loaded")
    
    return configWatcher
end

return module
