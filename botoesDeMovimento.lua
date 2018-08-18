-- faz referência a uma biblioteca do Corona	
local widget = require "widget"
local personagem = require ("personagemBomberman")
local w = display.contentWidth
local h = display.contentHeight

local buttonUp = widget.newButton {
	defaultFile = "buttonUp.png"
}
buttonUp.x = w - 445
buttonUp.y = h - 150
buttonUp.width = 20
buttonUp.height = 25

local buttonDown = widget.newButton {
	defaultFile = "buttonDown.png",
	onPress = moverBombermanDown
}

buttonDown.x = w - 445
buttonDown.y = h - 200
buttonDown.width = 20
buttonDown.height = 25

function moverBombermanDown()
		personagem.animacaoDoBomber.y = animacaoDoBomber.y - 10
		--buttonDown:addEventListener("touch", moverBombermanDown)
	return true
end

local buttonRight = widget.newButton {
	defaultFile = "buttonRight.png"
}

buttonRight.x = w - 470
buttonRight.y = h - 175
buttonRight.width = 22	
buttonRight.height = 20.7

local buttonLeft = widget.newButton {
	defaultFile = "buttonLeft.png"
}

buttonLeft.x = w - 420
buttonLeft.y = h - 175
buttonLeft.width = 22
buttonLeft.height = 20.7

