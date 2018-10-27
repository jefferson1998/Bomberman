local widget = require "widget"
local bombaView = require "view.bombaView"
local personagemView = require "view.personagemView"
local inimigoView = require "view.inimigoView"
local bombaModel = bombaView:getBombaModel()
local botaoView = widget.newButton {
	defaultFile = "imagens/botaoBomba.png"
}

local w = display.contentWidth
local h = display.contentHeight
local eixoX, eixoY

botaoView.x = w - 35
botaoView.y = h - 150

function botaoView:percorrerAreaDaBomba(inimigo)
	inimigo.x, inimigo.y = inimigo:posicaoInimigo()
	for i=1,7  do
		if math.floor(bombaView.sprite.x) == inimigo.x or math.floor(bombaView.sprite.y) == inimigo.y then
			return true
		end
		bombaView.sprite.y = bombaView.sprite.y + 1
	end

	for i=1,7 do
		if bombaView.sprite.x == inimigo.x or bombaView.sprite.y == inimigo.y then
			return true
		end
		bombaView.sprite.y = bombaView.sprite.y - 1
	end

	for i=1,7 do
		if bombaView.sprite.x == inimigo.x or bombaView.sprite.y == inimigo.y then
			return true
		end
		bombaView.sprite.x = bombaView.sprite.x + 1
	end

	for i=1,7 do
		if bombaView.sprite.x == inimigo.x or bombaView.sprite.y == inimigo.y then
			return true
		end
		bombaView.sprite.x = bombaView.sprite.x - 1
	end

end

function botaoView:touch(evento)
	if evento.phase == "began" then
		if bombaModel.tempo == 0 then
			bombaModel.tempo = 4
			bombaView.bombaSprite = bombaView:newBomba(personagemView:getPersonagemGrafico().x, personagemView:getPersonagemGrafico().y)
			bombaView.bombaSprite:play()
		end
	end
end

botaoView:addEventListener("touch", botaoView)

return botaoView