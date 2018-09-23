local tiled = require "com.ponywolf.ponytiled"
local json = require "json"
local physics = require "physics"
physics.start()


display.setDefault("magTextureFilter", "nearest")
display.setDefault("minTextureFilter", "nearest")

local mapData = json.decodeFile(system.pathForFile("Objects/mapa/cenario1/testeVai.json", system.ResourceDirectory))  -- load from json export
local map = tiled.new(mapData, "Objects/mapa/cenario1")

function map:configurandoMapa()
  map.x = 30
  map.y = 25
  map.width = 400
  map.height = 270
end

map:configurandoMapa()


local labirinto = map:listTypes( "bloco" )

for i=1,#labirinto do
  physics.addBody(labirinto[i], "static", { density=0.5} )
end

