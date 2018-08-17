-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local cenario = require ("cenarioBomberman")
local personagem = require ("personagemBomberman")
local botaoBomba = require("botaoDeBomba")
local botao = require ("botoesDeMovimento")

function getCharacterInMotion()
	return personagem.onOrientationChange();
end


