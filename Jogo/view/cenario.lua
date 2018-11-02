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
	if personagemView:getSprite().x ~= nil then
		personagemView:enterFrame()
	else 
		cenario:removerEventos(personagemView:getId())

	end

	if inimigoView:getSprite().x ~= nil then
		inimigoView:enterFrame()
	else
		cenario:removerEventos(personagemView:getId())
		cenario:getPersonagem():spriteVencedor(cenario:getPersonagem():getSprite()):play()
	end

end

function cenario:removerEvento()
	Runtime:removeEventListener("enterFrame", cenario)
end

function cenario:removerEventos(id)
	if(id == 2) then
		cenario:removerEvento()
		print ("chamei remover evento")
		direcional:removerEvento()
		botaoBomba:removerEvento()
	elseif (id == 4) then
		cenario:removerEvento()
	end
end



-- executa em vários ciclos, ou seja, fica atualizando direto a posição do personagem
Runtime:addEventListener("enterFrame", cenario)