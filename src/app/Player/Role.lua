local animationCache=cc.AnimationCache:getInstance()

local Role=class("role",function()
    return cc.Node:create()
end)

function Role:ctor(dir)
    self.direction=dir
    self.state="idle"
    self.role=cc.Sprite:createWithSpriteFrameName("nvdi_idle_01.png")
    self.role:setFlippedX(self.direction)
    self:addChild(self.role)

end

function Role:setDirector(dir)
    if dir=="left" then
        self.direction=true
    else
        self.direction=false
    end
    self.role:setFlippedX(self.direction)
end

function Role:action(str)
    self.role:stopAllActions()
    local animation=animationCache:getAnimation(str)
    local animate=cc.Animate:create(animation)
    self.role:runAction(animate)
end

return Role