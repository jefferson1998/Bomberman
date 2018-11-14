local aEstrela = {listaAberta = {}, listaFechada = {}}
local node = require "Objects.node"
local contador = 1

function aEstrela:equals(no, outroNo)
	print ("Rodando o Equals")
	print (no, outroNo)
	if(no.px == outroNo.px and no.py == outroNo.py) then
		return true
	end
	return false
end

function aEstrela:addListaFechada(no)
	print ("Rodando o addListaFechada")
	local contains = false
	if (#self.listaFechada ~= 0) then 
		for i=1, #self.listaFechada do
			if(self.equals(self.listaFechada[i], no) == true) then
				contains = true
				break
			end
		end
		if(contains == false) then
			table.insert( self.listaFechada, no)
		end
	else
		table.insert(self.listaFechada, no)
	end
	self:removerDaListaAberta(no)
end

function aEstrela:addListaAberta(argNo)
	print ("Rodando o addListaAberta")
	local contains = false
	if (#self.listaAberta ~= 0) then
		for i = 1, #self.listaAberta do
			if(self:equals(self.listaAberta[i], argNo) == true) then
				contains = true
				break
			end
		end

		if(contains == false) then
			print ("quant elementos ListaFechada " ..tostring(#self.listaFechada))
			if (#self.listaFechada ~= 0) then 
				for i = 1, #self.listaFechada do
					print ("ListaFechada " ..tostring(self.listaFechada[i]))
					print ("NO " ..tostring(argNo))
					if(self.equals(self.listaFechada[i], argNo) == true) then
						contains = true
						break
					end
				end
			end
			if(contains == false) then
				table.insert( self.listaAberta, argNo)
			end
		end
	else 
		table.insert( self.listaAberta, argNo)
	end
end

function aEstrela:run()
	print ("Rodando o run")
	local px, py = cenario:getMapa():pixelToBoard(cenario:getMapa():localizarNoMapa(cenario:getInimigoView():getSprite()))
	local no = node:new(px, py , nil, 0)
	self:addListaAberta(no)
	self:pathFinding(self.listaAberta, self.listaFechada)
end

function aEstrela:continuarProcura(no)
	print ("Rodando o continuarProcura")
	local vizinhos = node:gerarVizinhos(no)

	for i = 1, #vizinhos do
		self:addListaAberta(vizinhos[i])		
	end
end

function aEstrela:removerDaListaAberta(no)
	print ("Rodando o removerDaListaAberta")
	if(#self.listaAberta ~= 0) then
		for i = 1, #self.listaAberta do
			if(self:equals(self.listaAberta[i], no) == true) then
				table.remove( self.listaAberta, i)
				break
			end
		end
	end
end

function aEstrela:pathFinding(listaAberta, listaFechada)
	print ("Rodando o PathFinding")
	local menorF = listaAberta[1].F
	local posMenor = 1

	if(listaAberta) then
		for i = 1, #listaAberta do
			if (listaAberta[i].F <= menorF) then
				menorF = listaAberta[i].F
				posMenor = i
			end
		end
	end

	self:continuarProcura(listaAberta[posMenor])
	self:addListaFechada(listaAberta[posMenor])
	self:pathFinding(self.listaAberta, self.listaFechada)

end

return aEstrela

-- 1:	percorrer a lista de vizinhos 
-- 2:	ver qual vizinho tem menor distancia (heuristicia),	
-- 3:	Lembrar de atualizar a distancia somando o quanto foi andado + a heuristica
-- 3:	escolher o nó de menor heuristica para avançar
-- 4:	adicionar numa lista de estados (caminho)
-- 5:	repita os passos de 1 a 4 até encontrar o nó da borda
-- 6:	retornar o caminho para o personagem seguir	