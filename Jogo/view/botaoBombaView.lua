local buttonExplosion = widget.newButton {
	defaultFile = "imagens/botaoBomba.png"
}


local w = display.contentWidth
local h = display.contentHeight

buttonExplosion.x = w - 35
buttonExplosion.y = h - 150

return buttonExplosion