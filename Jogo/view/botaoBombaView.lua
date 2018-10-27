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

botaoView.x = w - 35
botaoView.y = h - 150

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