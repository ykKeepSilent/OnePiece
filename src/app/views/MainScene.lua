require("app.Golbal.GolbalRec")

local MainScene = class("MainScene", cc.load("mvc").ViewBase)

function MainScene:onCreate()
    local spriteFrameCache=cc.SpriteFrameCache:getInstance()
    spriteFrameCache:addSpriteFrames("nvdi.plist")

    for i=1,#nvdi_animations do
        self:loadAnimation(nvdi_animations[i])
    end
    
    local role=require("app.Player.Role").new(false)
    role:setPosition(display.cx,display.cy)
    self:addChild(role)
    role:action("nvdi_idle",-1)

    local buttonLayer=require("app.Button.ButtonLayer").new(role)
    self:addChild(buttonLayer)
end

function MainScene:loadAnimation(a)
    a.isReverse = a.isReverse or false
    a.loop=a.loop or 1

    local total
    if a.isReverse then
        total=a.number*2-2
    else 
        total=a.number
    end

    local frames={}
    local n
    for i=1,total do
        if i>a.number then
            n=i-i%a.number*2
        else 
            n=i
        end
        frames[i]=cc.SpriteFrameCache:getInstance():getSpriteFrame(string.format("%s%02d.png",a.str,n))
    end
    local animation=cc.Animation:createWithSpriteFrames(frames,a.time,a.loop)
    cc.AnimationCache:getInstance():addAnimation(animation,a.name)
end

return MainScene
