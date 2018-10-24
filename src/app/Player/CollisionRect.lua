local CollisionRect=class("CollisionRect",function()
	return cc.Node:create()
end)

function CollisionRect:ctor(width,height)
	self._rect=cc.rect(0,0,width,height)
	self._isDebug=false
end

function CollisionRect:debug(isopen)
	if isopen then
		if self._drawNode ~= nil then self._drawNode:removeFromParent()
		self._drawNode=cc.DrawNode:create()
		self._drawNode:drawRect(cc.p(0,0),cc.p(self._rect.width,self._rect.height),cc.c4f(math.random(0,1),math.random(0,1),math.random(0,1),1))
		self:addChild(self._drawNode)
		self._isDebug=true
		end
	else
		if self._drawNode ~= nil then
			self._drawNode:removeFromParent()
			self._isDebug=false
		end
	end
end

function CollisionRect:setRectSize(width,height)
	self._rect.width=width
	self._rect.height=height
	self:debug(self._isDebug)
end

return CollisionRect