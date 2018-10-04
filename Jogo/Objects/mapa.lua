local tiled = require "com.ponywolf.ponytiled"
local json = require "json"
local physics = require "physics"
physics.start()

local mapData = json.decodeFile(system.pathForFile("Objects/mapa/cenario1/testeVai.json", system.ResourceDirectory))  -- load from json export
local map = tiled.new(mapData, "Objects/mapa/cenario1")

function map:configurandoMapa()
  	map.x = display.contentCenterX - map.designedWidth / 2
  	map.y = display.contentCenterY - map.designedHeight / 2
  	map.width = 400
  	map.height = 270
end

-- local parede = map:findLayer("parede")
-- parede.anchorX = 0.5
-- parede.anchorY = 0.5

--physics.addBody(parede, "static")
--map:configurandoMapa()

--isso não está servindo
local labirinto = map:listTypes("bounds")

for i=1,#labirinto do
  physics.addBody(labirinto[i], "static" )
end



return map