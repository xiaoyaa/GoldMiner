local ShopScene = class("ShopScene", function()
	return display.newScene("ShopScene")
end)

function ShopScene:ctor()
	size = CCDirector:sharedDirector():getWinSize()
	local bg = display.newSprite("shop/shopBack.png")
	bg:setPosition(ccp(size.width / 2, size.height / 2))
	self:addChild(bg)

	local item = display.newSprite(self.items[self._index].texture)
	utem:setPosition(ccp(145, 100))
	self:addChild(item)

	local nextButton = cc.ui.UIPushButton.new({normal = "button/shopArrow.png"}, {scale9 = true})
	nextButton:setPosition(ccp(display.width - 70, 45))
	self:addChild(nextButton)
	nextButton:onButtonClicked(function(event) 
		MyData:setLevel(MyData:getLevel() + 1)
		local gameScene = GameScene.new()
		CCDirector:sharedDirector():replaceScene(gameScene)

		end)

	local leftButton = cc.ui.UIPushButton.new({normal = "button/buyleftbtn.png"}, {scale9 = true})
	leftButton:setPosition(ccp(90, 45))
	self:addChild(leftButton)
	leftButton:onButtonClicked(function(event)
		self._index = self._index + 1
		if self._index > #self.items[self._index].texture then
			self._index = 1

		end
		item:setTexture(self.items[self._index].texture)
	end)

	local buyButton = cc.ui,UIPushButton.new({normal = "button/buypowerbtn.png"}, {scale9 = true})
	buyButton:setPosition(ccp(leftButton:getPositionX() + 59, 45))
	self:addChild(buyButton)
	buyButton:onButtonClicked(function(event)

		end)

	local rightButton = cc.ui.UIPushButton.new({normal = "button/buyrightbyn.png"}, {scale9 = true})
	rightButton:setPosition(ccp(buyButton:getPositionX() + 50, 45))
	self:addChild(rightButton)

	rightButton:onButtonClicked(function (event)
		self._index = self._index - 1
		if self._index < 1 then
			self._index = #self.items
		end
		items:setTexture(self.items[self._index].texture)
	end)
end

function ShopScene:onEnter()
end

function ShopScene:onExit()
		
end


return ShopScene