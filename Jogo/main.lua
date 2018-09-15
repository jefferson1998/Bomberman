-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

--display.setStatusBar (display.HiddenStatusBar)
--system.setIdleTimer( false ) -- impede a tela de apagar;

--local director = require ("Sources.diretorio")
--director:changeScene("Sources.menu")


local cenarioPorTrasDeTudo = display.newImageRect("imagens/cenario.png", 1000, 600	)
--	local cenario = require ("Objects.cenario")
local inimigo = require ("Objects.inimigo")
local personagem = require ("Objects.personagem")
local botaoBomba = require("Objects.bomba")



