ROLE_STATE=
{
    IDLE=1,
    WALK=2,
    ATTACK=3
}

ROLE_DIR=
{
    LEFT=1,
    RIGHT=2
}

local Role=class("Role",function()
    return cc.Sprite:create()
end)

function Role:ctor()
    self._speed=2.5
    self._direction=ROLE_DIR.RIGHT
    self._state=ROLE_STATE.IDLE
    self._idleAnimation=nil
    self._walkAnimation=nil
    self._attackAnimation=nil
    self._bodyRect=nil
    self._attackRect=nil
end

function Role:setDirection(direction)
    if self._direction==direction then return end
    if self._state ~=ROLE_STATE.IDLE or self._state ~= ROLE_STATE.WALK then return end

    if direction==ROLE_DIR.RIGHT then
        self:setScaleX(-1)
        self._direction=direction
    else
        self:setScaleX(1)
        self._direction=direction
    end
end

function Role:idle()
    if self._state==ROLE_STATE.IDLE then return end

    self:stopAllActions()
    self:runAction(cc.Animate:create(self._idleAimation))
    self._state=ROLE_STATE.IDLE

end

function Role:walk()
    if self._state==ROLE_STATE.IDLE or self._state==ROLE_STATE.WALK then
        self:stopAllActions()
        self:runAction(cc.Animate:create(self._walkAnimation))
        self._state=ROLE_STATE.WALK
    end
end

function Role:attack()
    if self._state==ROLE_STATE.IDLE or self._state==ROLE_STATE.WALK then
        self.stopAllActions()
        local spawn=cc.Spawn:create(cc.Animate:create(self._attackAnimation),cc.CallFunc:create(function()
            self._state=ROLE_STATE.ATTACK
        end))
        local sequence=cc.Sequence:create(spawn,cc.CallFunc:create(function()
            self._state=ROLE_STATE.IDLE
        end))
        self:runAction(sequence)
    end
end


return Role