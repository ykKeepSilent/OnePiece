local animationCache=cc.AnimationCache:getInstance()
local role=require("app.Player.Role")


local Nvdi=class("Nvdi",role)

function Nvdi:ctor()

    self.super:ctor()
    self:loadBasicAnimation()
    self:idle()
end

function Nvdi:loadBasicAnimation()
    self._idleAnimation=animationCache:getAnimation("nvdi_idle")
    self._walkAnimation=animationCache:getAnimation("nvdi_walk")
    self._attackAnimation=animationCache:getAnimation("nvdi_attack")
end

function Nvdi:idle()
    local animate=cc.Animate:create(self._idleAnimation)
    self:runAction(animate)
    self._state=ROLE_STATE.IDEL
end

function addCollisionRect()
    self._bodyRect=require()
end


return Nvdi