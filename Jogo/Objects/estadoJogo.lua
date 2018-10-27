local personagemView = require "view.personagemView"
local estadoDoJogo = map:getEstado()


--------------------------------------------------------------------------------------------
-- Regras do Estado
-- 0 = PAREDE
-- 1 = Area Caminhável
-- 2 = Protagonista
-- 3 = Bomba e Explosão
-- 4 = Inimigo
-- 5 = Destrutíveis
------------------------------------------------------------------------------------------

function estadoDoJogo:enterFrame()
	local posX, posY = localizacaoNoMapa(personagemView:getPersonagemGrafico())
	local posicaoAtualX = (math.ceil(math.fmod(posX, map.designedWidth) / 32) - 1)
	local posicaoAtualY = (math.ceil(math.fmod(posY, map.designedHeight) / 32) - 1)
	
	estadoDoJogo[posicaoAtualX][posicaoAtualY] = 3

	for i=1,10 do
		for j=1,10 do
			print(estadoDoJogo[i][j])
		end
		print("\n")
	end
end

estadoDoJogo:enterFrame()

return estadoDoJogo