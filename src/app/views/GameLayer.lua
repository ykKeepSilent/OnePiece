local GameLayer=class("GameLayer",function()
    return cc.Layer:create()
end)

function GameLayer:ctor()
    local nvdi=require("app.Player.Nvdi").new()
    nvdi:setPosition(100,display.cy)
    self:addChild(nvdi)
    print(type(nvdi))


end

return GameLayer
