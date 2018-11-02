local buscaEmLargura = {}
local map = cenario:getMapa()
local estadoDoJogo = require "Objects.estadoJogo"
local inimigo = cenario:getInimigoView()
local posPersonagemX, posPersonagemY = map:pixelToBoard(cenario:getMapa():localizarNoMapa(cenario:getPersonagem():getSprite()))

local posAnteriorX, posAnteriorY
function buscaEmLargura:isResultadoBusca()
	local posPersonagemX, posPersonagemY = map:pixelToBoard(cenario:getMapa():localizarNoMapa(cenario:getPersonagem():getSprite()))

	if posPersonagemX == posInimigoX and posPersonagemY == posInimigoY then
		print("ACHEI O PERSONAGEM")
		return true
	end
	return false
end

function buscaEmLargura:buscar()
local posInimigoX, posInimigoY =  map:pixelToBoard(cenario:getMapa():localizarNoMapa(cenario:getInimigoView():getSprite()))

	if buscaEmLargura:isResultadoBusca() then
		-- Para o jogo
	else
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
		-- print("P. ANT X___ " .. posAnteriorX)
		-- print("P. ANT Y___ " .. posAnteriorY)
	end
end
function buscaEmLargura:atualizarInimigo()
	local posInimigoX, posInimigoY =  map:pixelToBoard(cenario:getMapa():localizarNoMapa(cenario:getInimigoView():getSprite()))
			
	if estadoDoJogo[posInimigoX][posInimigoY + 1] ~= nil and estadoDoJogo[posInimigoX][posInimigoY + 1] ~= 0 then
		if posInimigoX ~= posAnteriorX and posInimigoY + 1 ~= posAnteriorY then
			inimigo:mover("right")
			-- print("INI> DIREITA")
		end
	elseif estadoDoJogo[posInimigoX][posInimigoY - 1] ~= nil and estadoDoJogo[posInimigoX][posInimigoY - 1] ~= 0 then
		if posInimigoX ~= posAnteriorX and posInimigoY - 1 ~= posAnteriorY then
			inimigo:mover("left")
		-- print("INI> ESQUERDA")
		end	
	elseif estadoDoJogo[posInimigoX + 1][posInimigoY] ~= nil and estadoDoJogo[posInimigoX + 1][posInimigoY] ~= 0 then
		
		if posInimigoX ~= posAnteriorX and posInimigoY ~= posAnteriorY then
			inimigo:mover("down")		
			-- print("INI> BAIXO")
		end
	elseif estadoDoJogo[posInimigoX -1][posInimigoY] ~= nil and estadoDoJogo[posInimigoX- 1][posInimigoY] ~= 0 then
		if posInimigoX ~= posAnteriorX - 1 and posInimigoY ~= posAnteriorY then
			inimigo:mover("up")
			print("INI> CIMA")
		end
	end
	posAnteriorX, posAnteriorY = posInimigoX, posInimigoY
end

function buscaEmLargura:enterFrame()
	buscaEmLargura:isResultadoBusca()
	buscaEmLargura:buscar()
	buscaEmLargura:atualizarInimigo()
end

return buscaEmLargura