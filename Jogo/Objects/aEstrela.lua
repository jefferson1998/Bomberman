local aEstrela = {distancia = {}, caminho = {}}
local no = require "Objects.no"
local contador = 1

function aEstrela:percorrerVizinhos(estado)
	no:criarNo(estado)
	repeat
		for i=1, #no.vizinhos do
			local menor = 100
			if (menor > contador + no.distancia) then
				table.insert( self.caminho, no.vizinho[i])
				menor = contador + no.distancia
			end
		end

		contador = contador + 1
		print(contador)
	until no.isBorda == true
		contador = 0
end

return aEstrela

-- 1:	percorrer a lista de vizinhos 
-- 2:	ver qual vizinho tem menor distancia (heuristicia),	
-- 3:	Lembrar de atualizar a distancia somando o quanto foi andado + a heuristica
-- 3:	escolher o nó de menor heuristica para avançar
-- 4:	adicionar numa lista de estados (caminho)
-- 5:	repita os passos de 1 a 4 até encontrar o nó da borda
-- 6:	retornar o caminho para o personagem seguir	