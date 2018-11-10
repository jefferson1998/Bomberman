local aEstrela = {distancia = {}, caminho = {}}

function aEstrela:enterFrame(argNo, argEstado)
	argNo:criaNo(argEstado)
end

return aEstrela



-- 1:	percorrer a lista de vizinhos 
-- 2:	ver qual vizinho tem menor distancia (heuristicia),	
-- 3:	Lembrar de atualizar a distancia somando o quanto foi andado + a heuristica
-- 3:	escolher o nó de menor heuristica para avançar
-- 4:	adicionar numa lista de estados (caminho)
-- 5:	repita os passos de 1 a 4 até encontrar o nó da borda
-- 6:	retornar o caminho para o personagem seguir	