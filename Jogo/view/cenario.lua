local mapa = require "view.mapaView"
local personagemView = require "view.personagemView"
local bomba = require "Objects.bomba"


local cenario = {}


function cenario:touch(e)
	if e.phase == "began" or e.phase == "moved" then
		personagemView:mover(e.target.myName)
	elseif (e.phase == "ended" or e.phase == "canceled") then
		personagemView:mover()
	end
end

-- executa em vários circulos, ou seja, fica atualizando direto a posição do personagem
Runtime:addEventListener("enterFrame", personagemView)

function cenario:getEstado()
	return mapa:getEstado()
end

function cenario:getPersonagem(  )
	return personagemView
end

function cenario:getMapa()
	return mapa
end

function localizacaoNoMapa(object)
	return object.x, object.y
end

return cenario