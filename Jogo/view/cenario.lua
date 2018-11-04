cenario = {}

local mapa = require "view.mapaView"
function cenario:getMapa()
	return mapa
end
local estadoJogo = require "Objects.estadoJogo"

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

local inimigoView = require "view.inimigoView"
function cenario:getInimigoView()
	return inimigoView
end
local buscaEmLargura = require "Objects.buscaEmLargura"
function cenario:buscaEmLargura()
	return buscaEmLargura
end

estadoJogo:estadoPadrao(cenario:getInimigoView():getId())

local direcional = require "view.botaoOrientacaoView"
local botaoBomba = require "view.botaoBombaView"

function cenario:enterFrame()
	personagemView:enterFrame()
	buscaEmLargura:enterFrame()
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