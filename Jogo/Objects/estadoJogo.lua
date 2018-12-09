local estadoDoJogo = cenario:getMapa():getEstado()
local map = cenario:getMapa()
local posPersonagemX, posPersonagemY, posInimigoX, posInimigoY, posBombaX, posBombaY = nil, nil, nil, nil, nil, nil
local aux = 1
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
			self[posPersonagemX][posPersonagemY] = aux	
		end
		posPersonagemX, posPersonagemY = map:pixelToBoard(cenario:getMapa():localizarNoMapa(obj:getSprite()))
		
		-- print (posPersonagemX, posPersonagemY)

		aux = self[posPersonagemX][posPersonagemY]

		-- print(aux)

		self[posPersonagemX][posPersonagemY] = obj:getId()

	end

	if (obj:getId() == 5) then

		if obj.id == 2 then
			posBombaX, posBombaY = map:pixelToBoard(cenario:getMapa():localizarNoMapa(obj:getSprite()))
			self[posBombaX][posBombaY] = obj:getId()
			aux = self[posBombaX][posBombaY]
		end

		-- if bombaInimigo ~= 0 then
		-- 	posBombaX, posBombaY = map:pixelToBoard(cenario:getMapa():localizarNoMapa(bombaInimigo))
		-- 	self[posBombaX][posBombaY] = obj:getId()
		-- 	aux = self[posBombaX][posBombaY]
		-- end
		
	end

	if(obj:getId() == 4) then
		if(posInimigoX ~= nil and posInimigoY ~= nil) then
			self[posInimigoX][posInimigoY] = aux	
		end
		posInimigoX, posInimigoY = map:pixelToBoard(cenario:getMapa():localizarNoMapa(obj:getSprite()))
		
		-- print (posInimigoX, posInimigoY)

		aux = self[posInimigoX][posInimigoY]

		-- print(aux)

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