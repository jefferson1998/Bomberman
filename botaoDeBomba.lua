-- faz referência a uma biblioteca do Corona	
local widget = require "widget"

local w = display.contentWidth
local h = display.contentHeight


local buttonUp = widget.newButton {
	--retangulo = display.newRect( 0, 0, w, h - 250)
	defaultFile = "botaoBomba.png",
}

buttonUp.x = w - 30
buttonUp.y = h - 150