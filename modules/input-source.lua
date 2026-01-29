-- ============================================
-- 输入法自动切换模块
-- ============================================

local module = {}
local config = require("config")
local helpers = require("utils.helpers")

local appWatcher = nil

-- ============================================
-- 应用切换时的回调函数
-- ============================================
local function applicationWatcher(appName, eventType, appObject)
    -- 只处理应用激活事件
    if eventType ~= hs.application.watcher.activated then
        return
    end
    
    -- 检查该应用是否有输入法偏好设置
    local preference = config.appInputPreferences[appName]
    
    if preference then
        helpers.log("App activated: " .. appName .. ", switching to: " .. preference)
        
        -- 延迟切换,确保应用完全激活
        hs.timer.doAfter(0.1, function()
            helpers.switchToInputSource(preference)
        end)
    end
end

-- ============================================
-- 初始化模块
-- ============================================
function module.init()
    helpers.log("Initializing input source auto-switching...")
    
    -- 创建应用监听器
    appWatcher = hs.application.watcher.new(applicationWatcher)
    appWatcher:start()
    
    local count = 0
    for _ in pairs(config.appInputPreferences) do
        count = count + 1
    end
    
    helpers.log("Input source auto-switching enabled for " .. count .. " apps")
end

-- ============================================
-- 停止模块
-- ============================================
function module.stop()
    if appWatcher then
        appWatcher:stop()
        helpers.log("Input source auto-switching disabled")
    end
end

return module
