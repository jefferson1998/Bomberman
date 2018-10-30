cenario = {}

local mapa = require "view.mapaView"
function cenario:getMapa()
	return mapa
end

local estadoJogo = require "Objects.estadoJogo"
estadoJogo:estadoPadrao()
function cenario:getEstadoJogo()
	return estadoJogo
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

function cenario:enterFrame()
	personagemView:enterFrame()
end

-- executa em vários ciclos, ou seja, fica atualizando direto a posição do personagem
Runtime:addEventListener("enterFrame", cenario)