local estadoDoJogo = cenario:getMapa():getEstado()
local map = cenario:getMapa()
local posicaoAnteriorX = 0
local posicaoAnteriorY = 0
local posicaoIntermediariaX = 3
local posicaoIntermediariaY = 3
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

function estadoDoJogo:atualizarEstado()

	local posEmPixelPersonagemX, posEmPixelPersonagemY = map:localizacaoNoMapa(cenario:getPersonagem():getPersonagemGrafico())
	local posBombaX, posBombaY = map:localizacaoNoMapa(cenario:getBotaoBomba())
	-- invertir a ordem porque quando o personagem estava na linha (posicao X) estava atualizando a matriz
	-- na linha, onde na verdade deveria atualizar a coluna.
	local posNoTabuleiroAtualPersonagemX = (math.ceil(math.fmod(posEmPixelPersonagemY, cenario:getMapa().designedHeight) / 32))
	local posicaoAtualPersonagemY = (math.ceil(math.fmod(posEmPixelPersonagemX, cenario:getMapa().designedWidth) / 32))

	estadoDoJogo[posNoTabuleiroAtualPersonagemX][posicaoAtualPersonagemY] = cenario:getPersonagem().id
		
	--print(estadoDoJogo:mostrarTabuleiroDoJogo(estadoDoJogo))

end

function estadoDoJogo:resetEstado()
	
end

return estadoDoJogo