cenario = {}

local mapa = require "view.mapaView"
function cenario:getMapa()
	return mapa
end

local personagemView = require "view.personagemView"
function cenario:getPersonagem()
	return personagemView
end

local direcional = require "view.botaoOrientacaoView"
function cenario:getDirecional()
	return direcional
end

local botaoBomba = require "view.botaoBombaView"
function cenario:getBotaoBomba()
	return botaoBomba
end

local estadoJogo = require "Objects.estadoJogo"
function cenario:getEstadoJogo()
	return estadoJogo
end

function cenario:enterFrame()
	personagemView:enterFrame()
	estadoJogo:enterFrame()
end

function transformPixelToBoard(posPixelX, posPixelY)
	return (math.ceil(math.fmod(posEmPixelPersonagemY, cenario:getMapa().designedHeight) / 32)),
		(math.ceil(math.fmod(posEmPixelPersonagemX, cenario:getMapa().designedWidth) / 32))
end

-- executa em vários ciclos, ou seja, fica atualizando direto a posição do personagem
Runtime:addEventListener("enterFrame", cenario)