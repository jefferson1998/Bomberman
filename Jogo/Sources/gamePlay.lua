local _M = {} 

--Variables--------------->

local director = require("Sources.diretorio")

local w = display.contentWidth -- representa a largura da tela
local h = display.contentHeight -- altura da tela

local j = 1

--Images------------------>

local background

--Functions--------------->

local touchEvent
local freeMemory

--Principal Function--------------------------------------------------------------------------->
----------------------------------------------------------------------------------------------->
function _M.new()
	local localGroup = display.newGroup()
	
	local cenarioPorTrasDeTudo = display.newImageRect("imagens/cenario.png", 1000, 600	)

	local cenario = require ("Objects.cenarioBomberman")
	local personagem = require ("Objects.personagemBomberman")
	local botaoBomba = require("Objects.botaoDeBomba")
	local botoes = require ("Objects.botoesDeMovimento")
	local physics = require "physics"


	function getCharacterInMotion()
		return personagem.onOrientationChange();
	end

	function getMoverBombermanDown()
		return personagem.touch();
		-- body
	end

	return localGroup
end

return _M