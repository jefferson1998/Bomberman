local buscaEmLargura = {}
local pilha  = {}
local cont = 1
local map = cenario:getMapa()
local estadoDoJogo = cenario:getEstadoJogo()
local inimigo = cenario:getInimigoView()

local posAnteriorX, posAnteriorY

function buscaEmLargura:buscar()
local posPersonagemX, posPersonagemY = map:pixelToBoard(cenario:getMapa():localizarNoMapa(cenario:getPersonagem():getSprite()))
local posInimigoX, posInimigoY =  map:pixelToBoard(cenario:getMapa():localizarNoMapa(cenario:getInimigoView():getSprite()))


return posPersonagemX, posPersonagemY

	-- -- direita
	-- if estadoDoJogo[posInimigoX][posInimigoY + 1] ~= nil then

	-- 	if posInimigoX == posPersonagemX and posInimigoY + 1 == posPersonagemY then
	-- 		-- Para o jogo
	-- 		print("ACHEI O PERSONAGEM")
	-- 	end 
	-- -- esquerda
	-- elseif estadoDoJogo[posInimigoX][posInimigoY - 1] ~= nil then
		 
	-- 	if posInimigoX == posPersonagemX and posInimigoY  - 1 == posPersonagemY then
	-- 	-- Para o jogo
	-- 	print("ACHEI O PERSONAGEM")
	-- 	end
	-- -- cima 
	-- elseif estadoDoJogo[posInimigoX - 1][posInimigoY]  ~= nil then
		
	-- 	if posInimigoX - 1 == posPersonagemX and posInimigoY == posPersonagemY then
	-- 		-- Para o jogo
	-- 		print("ACHEI O PERSONAGEM")
	-- 	end 
	-- -- baixo
	-- elseif estadoDoJogo[posInimigoX + 1][posInimigoY]  ~= nil then
		 
	-- 	if posInimigoX +1 == posPersonagemX and posInimigoY == posPersonagemY then
	-- 		-- Para o jogo
	-- 		print("ACHEI O PERSONAGEM")
	-- 	end 

	-- end
	-- print("P. ANT X___ " .. posAnteriorX)
	-- print("P. ANT Y___ " .. posAnteriorY)
	-- print("POS ATUAL __ X" .. posInimigoX)
	-- print("POS ATUAL __ Y" .. posInimigoY)
end

function buscaEmLargura:atualizarInimigo()
	local posInimigoX, posInimigoY =  map:pixelToBoard(cenario:getMapa():localizarNoMapa(cenario:getInimigoView():getSprite()))
			
	-- DIREITA		
	if estadoDoJogo[posInimigoX][posInimigoY + 1] ~= nil and estadoDoJogo[posInimigoX][posInimigoY + 1] ~= 0 then
		if posInimigoX ~= posAnteriorX and posInimigoY + 1 ~= posAnteriorY then
			inimigo:mover("right")
			-- table.insert( pilha, cont , {posInimigoX, posInimigoY + 1} )
			cont = cont + 1
			-- print("INI> DIREITA")
		end
	end
	-- ESQUERDA
	if estadoDoJogo[posInimigoX][posInimigoY - 1] ~= nil and estadoDoJogo[posInimigoX][posInimigoY - 1] ~= 0 then	
		if posInimigoX ~= posAnteriorX and posInimigoY - 1 ~= posAnteriorY then
			-- print("INIESQUERDA")
			inimigo:mover("left")	
			-- table.insert( pilha, cont , {posInimigoX, posInimigoY + 1} )
			cont = cont + 1

		end	
	end
	-- BAIXO
	if estadoDoJogo[posInimigoX + 1][posInimigoY] ~= nil and estadoDoJogo[posInimigoX + 1][posInimigoY] ~= 0 then
		if posInimigoX ~= posAnteriorX + 1 and posInimigoY ~= posAnteriorY then
			inimigo:mover("down")		
			-- print("INI> BAIXO")
		end
	end
	-- CIMA
	if estadoDoJogo[posInimigoX -1][posInimigoY] ~= nil and estadoDoJogo[posInimigoX- 1][posInimigoY] ~= 0 then
		if posInimigoX - 1 ~= posAnteriorX and posInimigoY ~= posAnteriorY then
			inimigo:mover("up")
			-- print("INI> CIMA")
		end
	end

	if posAnteriorX ~= posInimigoY  and posAnteriorY ~= posInimigoY then
		print("entrei")
		posAnteriorX, posAnteriorY = posInimigoX, posInimigoY
	end 
	-- print("POS ANT __ X" .. posAnteriorX)
	-- print("POS ANT __ Y" .. posAnteriorY)
end

function buscaEmLargura:enterFrame()
	buscaEmLargura:atualizarInimigo()
	buscaEmLargura:buscar()
	inimigo:enterFrame()

end

return buscaEmLargura