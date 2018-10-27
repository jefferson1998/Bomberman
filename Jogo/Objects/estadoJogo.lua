local cenario = require "view.cenario"

local estadoDoJogo = cenario:getEstado()


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
	local posX, posY = localizacaoNoMapa(cenario:getPersonagemView():getPersonagemGrafico())
	local posicaoAtualX = (math.ceil(math.fmod(posX, cenario:getMapa().designedWidth) / 32) - 1)
	local posicaoAtualY = (math.ceil(math.fmod(posY, cenario:getMapa().designedHeight) / 32) - 1)
	



	--estadoDoJogo[posicaoAtualX][posicaoAtualY] = 
end


return estadoDoJogo