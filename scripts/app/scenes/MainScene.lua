
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
   --local scene = require(app.scenes.startScene).new()
    size = CCDirector:sharedDirector():getWinSize()
  	local sprite = CCSprite:create("MainMenu.png")
  	sprite:setPosition(ccp(size.width / 2, size.height / 2))
  	self:addChild(sprite)

local function onButtonClicked(tag)
    	local scene = require("app.scenes.GameScene"):new()
	    CCDirector:sharedDirector():replaceScene(scene)
end

  	local item = ui.newImageMenuItem({
  		image = "button/PlayMenu.png",
  		listener = onButtonClicked
  		})
  	item:setPosition(ccp(130, 225))
  	local menu = ui.newMenu({item})
  	self:addChild(menu)

  	
 --[[audio.preloadMusic("backMusic.mp3")
  audio.playMusic("backMusic.mp3")
  local isOn = ui.newImageMenuItem({image = "button/soundController.png"})
  local isOff = ui.newImageMenuItem({image = "button/soundController2.png"})
    
    toggle = CCMenuItemToggle:create(isOn)
    toggle:addSubItem(isOff)


    toggle:setTarget(self, MENU_ITEM_CLICKED_EVENT(envet))
    local menuToggle = ui.newMenu({toggle})
    menuToggle:setPosition(ccp(50, 50))
    self:addChild(menuToggle)

local function envet()
  		local backMusic = true;
  		if backMusic then
  			backMusic = false
  			toggle.setSelectedIndex(1)
  			audio.stopBackgroundMusic()

  	    else 
  		backMusic = true
  		toggle.setSelectedIndex(0)
  		audio.playBackgroundMusic()
  	    end 


end]]

--音乐
    local musicButton = cc.ui.UICheckBoxButton.new({on = "button/soundController.png", off = "button/soundController2.png"})
    musicButton:setPosition(ccp(50, 50))
    musicButton:onButtonStateChanged(function(event)
    	if event.state == "on" then
    		audio.playMusic("backMusic.mp3")
    	elseif event.state == "off" then
    		audio.stopMusic()
    	end
    end)

    musicButton:setButtonSelected(true)
    self:addChild(musicButton)

end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene