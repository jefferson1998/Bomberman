local buscaEmLargura = {}
local map = cenario:getMapa()
local estadoDoJogo = require "Objects.estadoJogo"
local inimigo = cenario:getInimigoView()
local posPersonagemX, posPersonagemY = map:pixelToBoard(cenario:getMapa():localizarNoMapa(cenario:getPersonagem():getSprite()))

local posAnteriorX, posAnteriorY

function buscaEmLargura:buscar()
local posInimigoX, posInimigoY =  map:pixelToBoard(cenario:getMapa():localizarNoMapa(cenario:getInimigoView():getSprite()))

	-- direita
	if estadoDoJogo[posInimigoX][posInimigoY + 1] ~= nil and estadoDoJogo[posInimigoX][posInimigoY + 1] == 0 then

		if posInimigoX == posPersonagemX and posInimigoY + 1 == posPersonagemY then
			-- Para o jogo
			print("ACHEI O PERSONAGEM")
		end 
	-- esquerda
	elseif estadoDoJogo[posInimigoX][posInimigoY - 1] ~= nil and estadoDoJogo[posInimigoX][posInimigoY - 1] == 0 then
		 
		if posInimigoX == posPersonagemX and posInimigoY  - 1 == posPersonagemY then
		-- Para o jogo
		print("ACHEI O PERSONAGEM")
		end
	-- cima 
	elseif estadoDoJogo[posInimigoX - 1][posInimigoY]  ~= nil and  estadoDoJogo[posInimigoX - 1][posInimigoY] ~= 0 then
		
		if posInimigoX - 1 == posPersonagemX and posInimigoY == posPersonagemY then
			-- Para o jogo
			print("ACHEI O PERSONAGEM")
		end 
	-- baixo
	elseif estadoDoJogo[posInimigoX + 1][posInimigoY]  ~= nil and estadoDoJogo[posInimigoX + 1][posInimigoY] ~= 0 then
		 
		if posInimigoX +1 == posPersonagemX and posInimigoY == posPersonagemY then
			-- Para o jogo
			print("ACHEI O PERSONAGEM")
		end 

	end
end
function buscaEmLargura:atualizarInimigo()
	local posInimigoX, posInimigoY =  map:pixelToBoard(cenario:getMapa():localizarNoMapa(cenario:getInimigoView():getSprite()))
			
	-- DIREITA		
	if estadoDoJogo[posInimigoX][posInimigoY + 1] ~= nil and estadoDoJogo[posInimigoX][posInimigoY + 1] ~= 0 then
		if posInimigoX ~= posAnteriorX and posInimigoY + 1 ~= posAnteriorY then
			inimigo:mover("right")
			-- print("INI> DIREITA")
		end

	-- ESQUERDA
	elseif estadoDoJogo[posInimigoX][posInimigoY - 1] ~= nil and estadoDoJogo[posInimigoX][posInimigoY - 1] ~= 0 then
		if posInimigoX ~= posAnteriorX and posInimigoY - 1 ~= posAnteriorY then

			if(estadoDoJogo[posInimigoX - 1][posInimigoY] ~= nil and estadoDoJogo[posInimigoX - 1][posInimigoY] ~= 0) then
				inimigo:mover("up")
			elseif estadoDoJogo[posInimigoX][posInimigoY + 1] ~= nil and estadoDoJogo[posInimigoX][posInimigoY +1] ~= 0 then
				inimigo:mover("right")
			else
				inimigo:mover("left")	
			end	
		-- print("INI> ESQUERDA")
		end	

	-- BAIXO
	elseif estadoDoJogo[posInimigoX + 1][posInimigoY] ~= nil and estadoDoJogo[posInimigoX + 1][posInimigoY] ~= 0 then
		
		if posInimigoX ~= posAnteriorX and posInimigoY ~= posAnteriorY then
			inimigo:mover("down")		
			-- print("INI> BAIXO")
		end

	-- DIREITA
	elseif estadoDoJogo[posInimigoX -1][posInimigoY] ~= nil and estadoDoJogo[posInimigoX- 1][posInimigoY] ~= 0 then
		if posInimigoX ~= posAnteriorX - 1 and posInimigoY ~= posAnteriorY then

		if(estadoDoJogo[posInimigoX][posInimigoY + 1] ~= nil and estadoDoJogo[posInimigoX][posInimigoY +1] ~= 0) then
			inimigo:mover("right")
		elseif(estadoDoJogo[posInimigoX][posInimigoY - 1] ~= nil and estadoDoJogo[posInimigoX][posInimigoY - 1] ~= 0) then
			inimigo:mover("left")
		else
			inimigo:mover("up")
		end
		print("INI> CIMA")
		end
	end
	posAnteriorX, posAnteriorY = posInimigoX, posInimigoY
end

function buscaEmLargura:enterFrame()
	inimigo:enterFrame()
	buscaEmLargura:buscar()
	buscaEmLargura:atualizarInimigo()
end

return buscaEmLargura