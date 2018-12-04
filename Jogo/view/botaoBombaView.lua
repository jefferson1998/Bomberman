local widget = require "widget"
local bombaView = cenario:getBombaView()
local bombaModel = bombaView:getBombaPersonagem()
local botaoView = display.newImage("imagens/botaoBomba.png")
local bombaAtiva = false

local w = display.contentWidth
local h = display.contentHeight
local eixoX, eixoY

botaoView.x = w - 35
botaoView.y = h - 150

function botaoView:touch(evento)
	if evento.phase == "began" then
		if bombaAtiva == false then
			bomba = bombaView:newBombaPersonagem(cenario:getMapa():localizarNoMapa(cenario:getPersonagem():getSprite()))
			bombaAtiva = true
			cenario:getPersonagem():getSprite():toFront()
			bomba.bombaSprite:play() 
		end
	end
end
botaoView:addEventListener("touch", botaoView)

function botaoView:removerEvento()
	botaoView:removeSelf()
end

function botaoView:setBombaAtiva(condicao)
	bombaAtiva = condicao
end

return botaoView