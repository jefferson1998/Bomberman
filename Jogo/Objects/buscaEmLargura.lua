local buscaEmLargura = {}
local map = cenario:getMapa()
local estadoDoJogo = cenario:getEstadoJogo()


local posAnteriorX, posAnteriorY
local posInimigoX, posInimigoY =  map:pixelToBoard(cenario:getMapa():localizarNoMapa(cenario:getInimigoView():getSprite()))

function buscaEmLargura:isResultadoBusca()
	local posPersonagemX, posPersonagemY = map:pixelToBoard(cenario:getMapa():localizarNoMapa(cenario:getPersonagem():getSprite()))

	if posPersonagemX == posInimigoX and posPersonagemY == posInimigoY then
		print("ACHEI O PERSONAGEM")
		return true
	end
	return false
end

function buscaEmLargura:buscar()
	local posPersonagemX, posPersonagemY = map:pixelToBoard(cenario:getMapa():localizarNoMapa(cenario:getPersonagem():getSprite()))

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
		posAnteriorX, posAnteriorY = posInimigoX, posInimigoY
		-- print("P. ANT X___ " .. posAnteriorX)
		-- print("P. ANT Y___ " .. posAnteriorY)
	end
end
function buscaEmLargura:atualizarInimigo()
	if estadoDoJogo[posAnteriorX][posAnteriorY + 1] ~= nil and estadoDoJogo[posAnteriorX][posAnteriorY + 1] ~= 0 then
		-- print("INI> DIREITA")
		posInimigoY = posInimigoY + 1
	elseif estadoDoJogo[posAnteriorX][posAnteriorY - 1] ~= nil and estadoDoJogo[posAnteriorX][posAnteriorY - 1] ~= 0 then
		posInimigoY = posInimigoY - 1
		-- print("INI> ESQUERDA")
	elseif estadoDoJogo[posAnteriorX + 1][posAnteriorY] ~= nil and estadoDoJogo[posAnteriorX + 1][posAnteriorY] ~= 0 then
		posInimigoX = posInimigoX + 1
		-- print("INI> BAIXO")
	elseif estadoDoJogo[posAnteriorX -1][posAnteriorY] ~= nil and estadoDoJogo[posAnteriorX- 1][posAnteriorY] ~= 0 then
		posInimigoX = posInimigoX - 1
		print("INI> CIMA")
	end
		-- print("INIMIGO ANDEI")
	estadoDoJogo:setEstado(4,posInimigoX,posInimigoY)
end

function buscaEmLargura:enterFrame()
	buscaEmLargura:isResultadoBusca()
	buscaEmLargura:buscar()
	buscaEmLargura:atualizarInimigo()
end

return buscaEmLargura