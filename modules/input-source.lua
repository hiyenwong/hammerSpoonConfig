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

    local currentSource = hs.keycodes.currentSourceID()
    
    -- 获取偏好设置,如果没有指定,则默认为 "english"
    local preference = config.appInputPreferences[appName] or "english"
    
    -- 如果设置为 "keep",则不执行任何操作
    if preference == "keep" then
        helpers.log("Activated: [" .. appName .. "] | Preference: keep | No switch")
        return
    end

    local targetSourceID = config.inputSources[preference]
    
    if targetSourceID and currentSource ~= targetSourceID then
        helpers.log("Activated: [" .. appName .. "] | Switch to " .. preference .. " (" .. targetSourceID .. ")")
        -- 延迟切换,确保应用完全激活
        hs.timer.doAfter(0.1, function()
            hs.keycodes.currentSourceID(targetSourceID)
        end)
    else
        helpers.log("Activated: [" .. appName .. "] | Already in " .. preference)
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
