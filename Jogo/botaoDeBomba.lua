-- faz referência a uma biblioteca do Corona	
local widget = require "widget"

local w = display.contentWidth
local h = display.contentHeight


local buttonExplosion = widget.newButton {
	--retangulo = display.newRect( 0, 0, w, h - 250)
	defaultFile = "imagens/botaoBomba.png",
}

buttonExplosion.x = w - 30
buttonExplosion.y = h - 150

function mover()
	buttonExplosion.x = buttonExplosion - 10
end