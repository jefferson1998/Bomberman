local aEstrela = {listaAberta = {}, listaFechada = {}}
local node = require "Objects.node"
local contador = 1

function aEstrela:equals(no, outroNo)
	if(no.px == outroNo.px and no.py == outroNo.py) then
		return true
	end
end

function aEstrela:addListaAberta(no)
	if (listaAberta) then



		else table.insert( self.listaAberta, no)
	end
end

function aEstrela:run()
	local no = node:new(cenario:getMapa():pixelToBoard(cenario:getMapa():localizarNoMapa(cenario:getInimigoView():getSprite())), nil, 0)
	self:addListaAberta(no)
end

function aEstrela:addListaFechada(no)
	if (listaFechada) then 


	end
end

function aEstrela:pathFinding(listaAberta, listaFechada)
	local menorF = 1000
	local posMenor = 0

	if(listaAberta) then
		for i = 1, #listaAberta do
			if (listaAberta[i].F <= menorF) then
				menorF = listaAberta[i].F
				posMenor = i
			end
		end
	end

	self:addListaFechada(listaAberta[posMenor])
	self:continuarProcura(listaAberta[posMenor])

end

return aEstrela

-- 1:	percorrer a lista de vizinhos 
-- 2:	ver qual vizinho tem menor distancia (heuristicia),	
-- 3:	Lembrar de atualizar a distancia somando o quanto foi andado + a heuristica
-- 3:	escolher o nó de menor heuristica para avançar
-- 4:	adicionar numa lista de estados (caminho)
-- 5:	repita os passos de 1 a 4 até encontrar o nó da borda
-- 6:	retornar o caminho para o personagem seguir	