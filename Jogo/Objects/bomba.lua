-- faz referência a uma biblioteca do Corona	
local widget = require "widget"
local personagem = require "Objects.personagem"

local bomba = {
	tamanho = 0,
	tempo = 0,
}

local w = display.contentWidth
local h = display.contentHeight


local buttonExplosion = widget.newButton {
	--retangulo = display.newRect( 0, 0, w, h - 250)
	defaultFile = "imagens/botaoBomba.png"
}

buttonExplosion.x = w - 35
buttonExplosion.y = h - 150


function mover()
	buttonExplosion.x = buttonExplosion - 10
end

local eixoX, eixoY

local update = function ()
	
	eixoX, eixoY = personagem:localizacaoNoMapa()

end

local touchFunction = function (evento)
	-- quando há clique  
	if evento.phase == "began" then
		--print(personagem.x .. personagem.y)
		bomba = display.newCircle(eixoX, eixoY, 7)	
	end
end

Runtime:addEventListener("enterFrame", update)
buttonExplosion:addEventListener("touch", touchFunction)



