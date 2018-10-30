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

function estadoDoJogo:mostrarTabuleiroDoJogo(estadoDoJogo)
	local str = ""

	for i=1,#estadoDoJogo do

		for j=1,#estadoDoJogo[i] do
			str = str .. estadoDoJogo[i][j]
		end
		str = str .. "\n"
	end

	return str
end

function estadoDoJogo:atualizarEstado(obj)
	

	local posAnteriorX, posAnteriorY = posX, posY

	posX, posY = estadoDoJogo:pixelToBoard(cenario:getMapa():localizarNoMapa(obj:getSprite()))

	print (posAnteriorX,posAnteriorY, posX, posY)

	aux = estadoDoJogo[posX][posY]

	print(aux)

	estadoDoJogo[posX][posY] = obj:getId()
	
	if(posAnteriorX ~= nil and posAnteriorY ~= nil) then

		estadoDoJogo[posAnteriorX][posAnteriorY] = aux

	end
		
	print(estadoDoJogo:mostrarTabuleiroDoJogo(estadoDoJogo))

end

function estadoDoJogo:estadoPadrao()
	estadoDoJogo[3][3] = 2
	estadoDoJogo[#estadoDoJogo - 1][#estadoDoJogo[1] - 2] = 4
	print(estadoDoJogo:mostrarTabuleiroDoJogo(estadoDoJogo))
end

function estadoDoJogo:pixelToBoard(posPixelX, posPixelY)
	return (math.ceil(math.fmod(posPixelY, cenario:getMapa().designedHeight) / 32)),
		(math.ceil(math.fmod(posPixelX, cenario:getMapa().designedWidth) / 32))
end

function estadoDoJogo:getEstado()
	return estadoDoJogo
end

return estadoDoJogo