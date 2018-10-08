local ButtonLayer=class("ButtonLayer",function()
    return cc.Layer:create()
end)

function ButtonLayer:ctor(role)
    self.role=role
    self:addMoveButton()
end


function ButtonLayer:addMoveButton()
    self.leftButton=ccui.Button:create("button_walk.png")
    self.leftButton:setFlippedX(true)
    self.leftButton:setPosition(100,100)
    self:addChild(self.leftButton)
    

    self.rightButton=ccui.Button:create("button_walk.png")
    self.rightButton:setPosition(self.leftButton:getPositionX()+110,100)
    self:addChild(self.rightButton)

    local function leftCallback(ref,type)
        if ccui.TouchEventType.began == type then
            self.role:setDirector("left")
            self.role:action("nvdi_walk")
            return true
        elseif ccui.TouchEventType.moved == type then
            return 
        else
            self.role:action("nvdi_idle")
        end
    end
    self.leftButton:addTouchEventListener(leftCallback)

    local function rightCallback(ref,type)
        if ccui.TouchEventType.began == type then
            self.role:setDirector("right")
            self.role:action("nvdi_walk")
            return true
        elseif ccui.TouchEventType.moved == type then
            return 
        else
            self.role:action("nvdi_idle")
        end
    end
    self.rightButton:addTouchEventListener(rightCallback)
end

return ButtonLayer