local GameScene  = class("GameScene", function ()
	return display.newScene("GameScene")
end)

require("app.scenes.Level")
require("app.MyData")

size = CCDirector:sharedDirector():getWinSize()

function GameScene:ctor()
	
	local levelData = Level:getItemData(MyData.getLevel())

--背景
	local bg = display.newSprite(Level:getBG_ITEM(MyData.getLevel()))
	bg:setPosition(ccp(size.width / 2, size.height / 2))
	self:addChild(bg)

	a = CCTextureCache:sharedTextureCache():addImage("line.png")

--矿石
	self.items = {}
	for k,v in pairs(levelData) do
		local goods = Item.new({path = v.pic, weight = v.weight, price = v.price})
	    goods:setPosition(v.pos)
	    self:addChild(goods, 0)
	    table.insert(self.items, goods)
	end

--矿工
	local miner = Miner:new()
	miner:setPosition(ccp(size.width / 2, size.height / 2))
	self:addChild(miner)
--时间
    self.times = 60
    self._label = ui.newTTFLabel({
    	text = "" .. self.times,
    	size = 30
    	})
	self._label:setPosition(ccp(size.width - 30, size.height - 20))
	self:addChild(self._label)
--得分
    self.goldLabel = ui.newTTFLabel({
	    text = "" .. MyData.getGolden(),
	    size = 30
	})
	--print("11111111111")
	self.goldLabel:setPosition(ccp(size.width - 30, size.height - 60))
	self:addChild(self.goldLabel)
--钩子
	self.hook = Hook.new({
		--发射钩子
		funcL = function ()
		self:startTimerTask()
		miner:startAction()
		end,
		--钩子回收
		funcBE = function (goods)
		self:stopTimerTask()
			miner:endAction()
			if goods then
				MyData.setGolden(MyData.getGolden() + goods.price)
				self.goldLabel:setString(MyData.getGolden())
				print("gold = " .. MyData.getGolden())
			end
		end,
		funcBB = function (goods)
			--self:stopTimerTask()
			local index = 0
			for k,v in pairs(self.items) do
				if v == goods then
					index = k
					break
				end
			end
			if index ~= 0 then
				local time = 1
				if goods then
					time = goods._weight / 10
				end
				goods:runAction(getSequence({CCMoveTo:create(time, ccp(size.width / 2 - 2, size.height / 2 - 20)), CCCallFunc:create(function ()
				goods:removeFromParentAndCleanup(true)	
				end)}))
				table.remove(self.items, index)
			end
		end,
		})
	self.hook:setPosition(ccp(size.width / 2 - 2, size.height / 2 - 20))
	self:addChild(self.hook)

	self.hook:startRotion()

--触摸
	local touchLayer = TouchLayer.new({func = function ( ... )
		if not self.hook._launchFlag then
			self.hook:hookLaunch()
		end
		
	end})
	self:addChild(touchLayer,0)


--倒计时
	local sharedScheduler = CCDirector:sharedDirector():getScheduler()
	self._schedule1 = sharedScheduler:scheduleScriptFunc(function ()
		self:timeDeal1()
	end, 1, false)
end

--开始检测碰撞
function GameScene:startTimerTask()
	local sharedScheduler = CCDirector:sharedDirector():getScheduler()
	self._schedule = sharedScheduler:scheduleScriptFunc(function ()
		self:timeDeal()
	end, 0.01, false)
end

function GameScene:stopTimerTask()
	local sharedScheduler = CCDirector:sharedDirector():getScheduler()
	if self._schedule then
		sharedScheduler:unscheduleScriptEntry(self._schedule)
		self._schedule = nil
	end
end


function GameScene:timeDeal()

	local hPosX = self.hook:getPositionX()
	local hPosY = self.hook:getPositionY()
	self:removeChild(sp, true)
	sp = nil
	   distance = math.sqrt((size.width / 2 - 2 - hPosX)* (size.width / 2 - 2 - hPosX)+(size.height / 2 - 20-hPosY)*(size.height / 2 - 20-hPosY))
	   print(distance)
       sp = CCSprite:createWithTexture(a, CCRectMake(0, 0, 2, distance))
       sp:setAnchorPoint(ccp(0.5, 1))
       sp:setPosition(ccp(size.width / 2 - 2, size.height / 2 - 20))
       sp:setRotation(self.hook:getRotation())
       self:addChild(sp)
	for k,v in pairs(self.items) do
		local posX = v:getPositionX()
		local posY = v:getPositionY()
        print(v:getPositionX())
		if math.abs(hPosX - posX) < v:getContentSize().width * 0.3 and math.abs(hPosY - posY) < v:getContentSize().height * 0.3 then
			--self:stopTimerTask()
			self.hook:setItem(v)
			self.hook:hookBack()
		end
	end
end
--倒计时
function GameScene:timeDeal1()
	self.times = self.times - 1
	self._label:setString(self.times .. "")
	if self.times <= 0 then
		self.times = 0
		local sharedScheduler = CCDirector:sharedDirector():getScheduler()
		if self._schedule1 then
			sharedScheduler:unscheduleScriptEntry(self._schedule1)
			self._schedule1 = nil
		end
		self:stopTimerTask()
		local scene = nil

		if Level:getLIMIT_ITEM(MyData:getLevel()) < MyData:getGolden() then
			scene = ShopScene.new()
		else
			MyData:setGolden(0)
			scene = require("app.scenes.MainScene").new()
		end
		CCDirector:sharedDirector():replaceScene(scene)
	end
end


function GameScene:onEnter()
	
end

function GameScene:onExit()

end


return GameScene