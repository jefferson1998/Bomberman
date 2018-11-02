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
function cenario:getDirecional()
	return direcional
end
function cenario:getBotaoBomba()
	return botaoBomba
end
local bombaView = require "view.bombaView"
function cenario:getBombaView()
	return bombaView
end

local direcional = require "view.botaoOrientacaoView"
local botaoBomba = require "view.botaoBombaView"

function cenario:enterFrame()
	personagemView:enterFrame()
end

function cenario:removerEvento()
	Runtime:removeEventListener( "enterFrame", cenario)
end

function cenario:removerEventos()
	cenario:removerEvento()
	direcional:removerEvento()
	botaoBomba:removerEvento()
end



-- executa em vários ciclos, ou seja, fica atualizando direto a posição do personagem
Runtime:addEventListener("enterFrame", cenario)