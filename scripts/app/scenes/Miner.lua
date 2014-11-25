
local Miner = class("Miner", function()
	return display.newNode()

end)

function Miner:ctor()
	self:init()
end

function Miner:init() 
	local png = "hero/minerAction.png"
	local plist = "hero/minerAction.plist"
	
	display.addSpriteFramesWithFile(plist, png)
	self._sp = display.newSprite("#miner_0701.png")
	self:addChild(self._sp)
	self:setContentSize(self._sp:getContentSize())
end

function Miner:startAction()
	local frames = display.newFrames("miner_0%d.png", 701, 10)
	local animate = display.newAnimation(frames, 0.08)
	self._sp:playAnimationForever(animate, 0.1)
end

function Miner:endAction()
	self._sp:stopAllActions()
end

return Miner