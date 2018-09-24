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



-- center the map on screen
--map.x,map.y = display.contentCenterX - map.designedWidth/2, display.contentCenterY - map.designedHeight/2

--local cenarioPorTrasDeTudo = display.newImageRect("imagens/cenario.png", 1000, 600	)
--local cenario = require ("Objects.cenario")
local mapa = require("Objects.mapa")
local inimigo = require ("Objects.inimigo")
local personagem = require ("Objects.personagem")
--physics.addBody( personagem.personagemEmMovimento, "dynamic")


local botaoBomba = require("Objects.bomba")




