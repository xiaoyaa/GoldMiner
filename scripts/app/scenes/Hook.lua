local Hook = class("Hook", function()
	return display.newNode()
end)

function Hook:ctor(params)
	self.funcL = params.funcL
	self.funcBB = params.funcBB
	self.funcBE = params.funcBE
	self:init()
end

function Hook:init()
	self._hook = display.newSprite("hook.png")
	self._hook:setAnchorPoint(ccp(0.5,1))
	self:setRotation(-90)
	self:addChild(self._hook, 0)

end

function Hook:startRotion()
	self:setRotation(-90)
	self._launchFlag = false
	local seq = getSequence({CCRotateBy:create(2, 180), CCRotateBy:create(2, -180)})
	local rep = CCRepeatForever:create(seq)
	self:runAction(rep)
end

function Hook:hookLaunch()
	self:stopAllActions()
	self._launchFlag = true
	local angle = self:getRotation()
	local move = CCMoveBy:create(1, ccp(200 * math.sin(math.rad(-angle)), -200 * math.cos(math.rad(-angle))))
	self:runAction(move)
	ac_dly_func(self, 1, function ()
		self:hookBack()
	end)
	if self.funcL then
		(self.funcL)()
	end
	self._hook:setAnchorPoint(0.5, 0)
end


function Hook:hookBack()
	self:stopAllActions()

	local time = 1
	if self._item then
		time = self._item._weight / 10
	end

	local move = CCMoveTo:create(time, ccp(size.width / 2 - 2, size.height / 2 - 20))
	local seq = getSequence({move, CCCallFunc:create(function ()
	self._hook:setAnchorPoint(0.5, 1)
	self:startRotion()
	if self.funcBE then
		(self.funcBE)(self._item)
	end
	self._item = nil
	end)})

	self:runAction(seq)
	if self.funcBB then
		(self.funcBB)(self._item)
	end
end

function Hook:setItem(items)
	self._item = items
end

function getSequence(tb)
	local array = CCArray:create()
	for k,v in pairs(tb) do
		array:addObject(v)
	end
	local ac_seq = CCSequence:create(array)
	return ac_seq
end

function ac_dly_func(ob, tk, fuc)
	if not ob then
	end

	local ac_dly = CCDelayTime:create(tk)
	local ac_fuc = CCCallFuncN:create(fuc)
	local ac_seq = CCSequence:createWithTwoActions(ac_dly, ac_fuc)
    ob:runAction(ac_seq)
end

return Hook
