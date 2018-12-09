local estadoDoJogo = cenario:getMapa():getEstado()
local map = cenario:getMapa()
local posPersonagemX, posPersonagemY, posInimigoX, posInimigoY, posBombaX, posBombaY = nil, nil, nil, nil, nil, nil
local auxPersonagem = 1
local auxInimigo = 1
local auxBombaPersonagem = 1
local auxBombaInimigo = 1
local pegarCaminho = false
--------------------------------------------------------------------------------------------
-- Regras do Estado
-- 0 = PAREDE
-- 1 = Area Caminhável
-- 2 = Protagonista
-- 3 = Explosão
-- 4 = Inimigo
-- 5 = Bomba
------------------------------------------------------------------------------------------

function estadoDoJogo:mostrarTabuleiroDoJogo()
	local str = ""

	for i = 1, #self do

		for j = 1, #self[i] do
			str = str .. self[i][j]
		end
		str = str .. "\n"
	end

	return str
end

function estadoDoJogo:atualizarEstado(obj)
	
	if(obj:getId() == 2) then
		if(posPersonagemX ~= nil and posPersonagemY ~= nil) then
			if(auxBombaPersonagem == 5) then
				self[posPersonagemX][posPersonagemY] = auxBombaPersonagem
				auxBombaPersonagem = 1
			else
				self[posPersonagemX][posPersonagemY] = auxPersonagem
			end
		end
		posPersonagemX, posPersonagemY = map:pixelToBoard(cenario:getMapa():localizarNoMapa(obj:getSprite()))
		
		-- print (posPersonagemX, posPersonagemY)
		if(self[posInimigoX][posInimigoY] ~= 4) then
			auxPersonagem = self[posPersonagemX][posPersonagemY]
		end
		-- print(aux)

		self[posPersonagemX][posPersonagemY] = obj:getId()
	end

	if (obj:getId() == 5) then

		if obj.idJogador == 2 then
			posBombaX, posBombaY = map:pixelToBoard(cenario:getMapa():localizarNoMapa(obj:getSprite()))
			self[posBombaX][posBombaY] = obj:getId()
			auxBombaPersonagem = self[posBombaX][posBombaY]
		end

		if obj.idJogador == 4 then
			posBombaX, posBombaY = map:pixelToBoard(cenario:getMapa():localizarNoMapa(obj:getSprite()))
			self[posBombaX][posBombaY] = obj:getId()
			auxBombaInimigo = self[posBombaX][posBombaY]
		end
		
	end

	if(obj:getId() == 4) then
		if(posInimigoX ~= nil and posInimigoY ~= nil) then
			if(auxBombaInimigo == 5) then
				self[posInimigoX][posInimigoY] = auxBombaInimigo
				auxBombaInimigo = 1
			else
				self[posInimigoX][posInimigoY] = auxInimigo
			end	
		end
		posInimigoX, posInimigoY = map:pixelToBoard(cenario:getMapa():localizarNoMapa(obj:getSprite()))
		
		-- print (posInimigoX, posInimigoY)
		if(self[posInimigoX][posInimigoY] ~= 2) then
			auxInimigo = self[posInimigoX][posInimigoY]
		end

		-- print(auxInimigo)

		self[posInimigoX][posInimigoY] = obj:getId()
	end

	print(self:mostrarTabuleiroDoJogo())
end

function estadoDoJogo:pegarCaminho(  )
	pegarCaminho = true
end

function estadoDoJogo:estadoPadrao()
	-- estadoDoJogo[3][3] = 2
	-- self[#self - 1][#self[1] - 2] = 4
	-- -- print(estadoDoJogo:mostrarTabuleiroDoJogo())
end
	
function estadoDoJogo:getEstado()
	return self
end

function estadoDoJogo:setEstado(value, posX, posY)
	self[posX][posY] = value
end

return estadoDoJogo