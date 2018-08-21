-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local cenarioPorTrasDeTudo = display.newImageRect("imagens/cenario.png", 1000, 600	)
local cenario = require ("cenarioBomberman")
local personagem = require ("personagemBomberman")
local botaoBomba = require("botaoDeBomba")
local botoes = require ("botoesDeMovimento")
local physics = require "physics"


function getCharacterInMotion()
	return personagem.onOrientationChange();
end

function getMoverBombermanDown()
	return personagem.touch();
	-- body
end

