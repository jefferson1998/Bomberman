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

estadoJogo:estadoPadrao(cenario:getInimigoView():getId())

local direcional = require "view.botaoOrientacaoView"
local botaoBomba = require "view.botaoBombaView"

function cenario:enterFrame()
	personagemView:enterFrame()
	inimigoView:enterFrame()
end

function cenario:removerEvento()
	Runtime:removeEventListener( "enterFrame", cenario)
end

function cenario:removerEventos(id)
	if(id == 2) then
		cenario:removerEvento()
		direcional:removerEvento()
		botaoBomba:removerEvento()
	elseif (id == 4) then
		cenario:removerEvento()
	end
end



-- executa em vários ciclos, ou seja, fica atualizando direto a posição do personagem
Runtime:addEventListener("enterFrame", cenario)