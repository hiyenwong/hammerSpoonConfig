-- ============================================
-- VSCode 应用配置
-- ============================================

local module = {}
local helpers = require("utils.helpers")

function module.init()
    -- VSCode 特定配置
    -- 可以在这里添加 VSCode 专属的快捷键或行为
    
    helpers.log("VSCode config loaded")
end

return module
