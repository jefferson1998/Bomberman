local tiled = require "com.ponywolf.ponytiled"
local json = require "json"
local physics = require "physics"
physics.start()

local mapData = json.decodeFile(system.pathForFile("Objects/mapa/cenario1/testeTamanho.json", system.ResourceDirectory))  -- load from json export
local map = tiled.new(mapData, "Objects/mapa/cenario1")

local matrizEstado = {
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{}
}

local i, j = 1, 1
for k,v in pairs(mapData.layers[1].data) do
	matrizEstado[i][j] = v
	j = j + 1
	if(tonumber(k) % 15 == 0) then 
		i = i + 1
		j = 1
	 end
end

local str = ""
for i = 1, #matrizEstado do
	for j = 1, #matrizEstado[i] do
		str = str .. tostring( matrizEstado[i][j] )
	end
	str = str .. "\n"
end

print(str)

function map:configurandoMapa()
  	map.x = display.contentCenterX - map.designedWidth / 2
  	map.y = display.contentCenterY - map.designedHeight / 2
end

function map:matrizEstado()
	return matrizEstado
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

function map:enterFrame( event )
	
end

return map