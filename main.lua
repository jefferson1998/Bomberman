-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local cenarioPorTrasDeTudo = display.newImageRect("cenario.png", 1000, 600	)
local cenario = require ("cenarioBomberman")
local personagem = require ("personagemBomberman")
local botaoBomba = require("botaoDeBomba")
local botoes = require ("botoesDeMovimento")


function getCharacterInMotion()
	return personagem.onOrientationChange();
end

function getMoverBombermanDown()
	return botoes.moverBombermanDown();
	-- body
end
