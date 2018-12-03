local widget = require "widget"
local bombaView = cenario:getBombaView()
local bombaModel = bombaView:getBombaPersonagem()
local botaoView = display.newImage("imagens/botaoBomba.png")

local w = display.contentWidth
local h = display.contentHeight
local eixoX, eixoY

botaoView.x = w - 35
botaoView.y = h - 150

function botaoView:touch(evento)
	if evento.phase == "began" then
		if bombaModel.tempo == 0 then
			bombaModel.tempo = 4
			bombaView.bombaSprite = bombaView:newBombaPersonagem(cenario:getMapa():localizarNoMapa(cenario:getPersonagem():getSprite()))
			cenario:getPersonagem():getSprite():toFront()
			bombaView.bombaSprite:play()
		end
	end
end

botaoView:addEventListener("touch", botaoView)

function botaoView:removerEvento()
	botaoView:removeSelf()
end

return botaoView