cenario = {}
local composer = require ("composer")


local banco = require "bd.bancoDeDados"
function cenario:getBanco()
	return banco
end

local mapa = require "view.mapaView"
function cenario:getMapa()
	return mapa
end

local estadoJogo = require "Objects.estadoJogo"
function cenario:getEstadoJogo()
	return estadoJogo
end

local inimigoView = require "view.inimigoView"
function cenario:getInimigoView()
	return inimigoView
end

local personagemView = require "view.personagemView"
function cenario:getPersonagem()
	return personagemView
end

aEstrela = require "Objects.aEstrela"
function getAEstrela()
	return aEstrela
end 

caminhoDoInimigo = {}

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

local bombaModel = require "Objects.bomba"
function cenario:getBombaModel()
	return bombaModel
end

local explosao = require "view.explosaoBomba"
function cenario:getExplosao()
	return explosao
end

-- estadoJogo:estadoPadrao(cenario:getInimigoView():getId())

local direcional = require "view.botaoOrientacaoView"
local botaoBomba = require "view.botaoBombaView"
cenario.tempo = nil

function cenario:enterFrame()
	-- print(personagemView:getSprite().x ~= nil)
	if cenario:getPersonagem():getSprite().x ~= nil then
		cenario:getPersonagem():enterFrame()
	else 
		cenario:removerEventos(personagemView:getId())
		print("sprite vencedor")
		cenario:getInimigoView():spriteVencedor(cenario:getInimigoView():getSprite()):play()
	end 

	if cenario:getInimigoView():getSprite().x ~= nil then
		cenario:getInimigoView():enterFrame()
	else
		cenario:removerEventos(personagemView:getId())
		cenario:getPersonagem():spriteVencedor(cenario:getPersonagem():getSprite()):play()
	end
end

function cenario:limparCenario() 
	if cenario:getInimigoView():getSprite() ~= nil then
		display.remove(cenario:getInimigoView():getSprite())
	end

	if cenario:getPersonagem():getSprite() ~= nil then
		display.remove(cenario:getInimigoView():getSprite())
	end

	if cenario:getPersonagem():getSpriteVencedor() ~= nil then
		display.remove(cenario:getPersonagem():getSpriteVencedor())
	end

	if cenario:getInimigoView():getSpriteVencedor() ~= nil then
		display.remove(cenario:getInimigoView():getSpriteVencedor())
	end
	cenario:getMapa().isVisible = false
	composer.gotoScene("Sources.restart")
	-- cenario:restart()
end

function cenario:isRestart()
	return true
end

function cenario:restart()
	botaoBomba:create()
	direcional:create()
	cenario:getMapa().isVisible = true
end

function cenario:timer(event)
	cenario:limparCenario()
end

function cenario:removerEvento()
	Runtime:removeEventListener("enterFrame", cenario)
end

function cenario:removerEventos(id)
	if(id == 2) then
		-- print ("chamei remover evento")
		direcional:removerEvento()
		botaoBomba:removerEvento()
		cenario:removerEvento()
		
	elseif (id == 4) then
		cenario:removerEvento()
	end
end

-- executa em vários ciclos, ou seja, fica atualizando direto a posição do personagem
Runtime:addEventListener("enterFrame", cenario)