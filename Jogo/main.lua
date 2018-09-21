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

local tiled = require "com.ponywolf.ponytiled"
local json = require "json"
local physics = require "physics"

physics.start()
local cenarioPorTrasDeTudo = display.newImageRect("imagens/cenario.png", 1000, 600	)

local mapData = json.decodeFile(system.pathForFile("Objects/mapa/cenario1/cenarioJson.json", system.ResourceDirectory))  -- load from json export
local map = tiled.new(mapData, "Objects/mapa/cenario1")


-- center the map on screen
map.x,map.y = display.contentCenterX - map.designedWidth/2, display.contentCenterY - map.designedHeight/2


--local cenario = require ("Objects.cenario")
local inimigo = require ("Objects.inimigo")
local personagem = require ("Objects.personagem")
local botaoBomba = require("Objects.bomba")




