local tiled = require "com.ponywolf.ponytiled"
local json = require "json"
local physics = require "physics"
physics.start()

local mapData = json.decodeFile(system.pathForFile("Objects/mapa/cenario1/testeTamanho.json", system.ResourceDirectory))  -- load from json export

local map = tiled.new(mapData, "Objects/mapa/cenario1")

function map:getEstado()
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
	local str = ""
	for k,v in pairs(mapData.layers[1].data) do
		matrizEstado[i][j] = v
		str = str .. matrizEstado[i][j]
		j = j + 1
		if(tonumber(k) % 15 == 0) then 
			i = i + 1
			j = 1
			str = str .. "\n"
		 end
	end
	-- print("MATRIZ____" .. "\n" .. str)
	return matrizEstado
end

function map:configurandoMapa()
  	map.x = display.contentCenterX - map.designedWidth / 2
  	map.y = display.contentCenterY - map.designedHeight / 2
end

function map:matrizEstado()
	return matrizEstado
end

--isso não está servindo
local labirinto = map:listTypes("bounds")

for i=1,#labirinto do
  physics.addBody(labirinto[i], "static" )
end

function map:localizacaoNoMapa(object)
	return object.x, object.y
end

return map