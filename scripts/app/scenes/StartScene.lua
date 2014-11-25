  local StartScene = class("StartScene", function()
  	return display.newScene("StartScene")

	end)

  function StartScene:ctor()
  	size = CCDirector:sharedDirector():getWinSize()
  	local sprite = CCSprite:create("MainMenu.png")
  	sprite:setPosition(ccp(size.width / 2, size.height / 2))
  	self.addChild(sprite)

  end