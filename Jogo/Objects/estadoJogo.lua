local estadoDoJogo = cenario:getMapa():getEstado()
local map = cenario:getMapa()
local posX, posY = nil, nil
local aux = 1
--------------------------------------------------------------------------------------------
-- Regras do Estado
-- 0 = PAREDE
-- 1 = Area Caminhável
-- 2 = Protagonista
-- 3 = Bomba e Explosão
-- 4 = Inimigo
-- 5 = Destrutíveis
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
		if(posX ~= nil and posY ~= nil) then
			self[posX][posY] = aux	
		end
		posX, posY = map:pixelToBoard(cenario:getMapa():localizarNoMapa(obj:getSprite()))
		
		print (posX, posY)

		aux = self[posX][posY]

		print(aux)

		self[posX][posY] = obj:getId()
	end

	if (obj:getId() == 3) then
		posX, posY = map:pixelToBoard(cenario:getMapa():localizarNoMapa(obj:getSprite()))

		self[posX][posY] = obj:getId()
		aux = self[posX][posY]
	end

	if(obj:getId() == 4) then
		if(posX ~= nil and posY ~= nil) then
			self[posX][posY] = aux	
		end
		posX, posY = map:pixelToBoard(cenario:getMapa():localizarNoMapa(obj:getSprite()))
		
		print (posX, posY)

		aux = self[posX][posY]

		print(aux)

		self[posX][posY] = obj:getId()
	end

	print(estadoDoJogo:mostrarTabuleiroDoJogo())

end

function estadoDoJogo:estadoPadrao()
	--estadoDoJogo[3][3] = 2
	-- self[#self - 1][#self[1] - 2] = 4
	-- print(estadoDoJogo:mostrarTabuleiroDoJogo())
end

function estadoDoJogo:getEstado()
	return self
end

function estadoDoJogo:setEstado(value, posX, posY)
	self[posX][posY] = value
end

return estadoDoJogo