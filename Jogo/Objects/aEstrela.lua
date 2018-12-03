local aEstrela = {listaAberta = {}, listaFechada = {}, caminho = {}}
local node = require "Objects.node"
local contador = 1

function aEstrela:equals(no, outroNo)
	-- -- print ("Rodando o Equals")
	if(no.px == outroNo.px and no.py == outroNo.py) then
		return true
	end
	return false
end

function aEstrela:addListaFechada(no)
	-- -- print ("Rodando o addListaFechada")
	local contains = false
	if (#self.listaFechada ~= 0) then 
		for i=1, #self.listaFechada do
			if(self:equals(self.listaFechada[i], no) == true) then
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
	-- -- print ("Rodando o addListaAberta")
	local contains = false
	if (#self.listaAberta ~= 0) then
		for i = 1, #self.listaAberta do
			if(self:equals(self.listaAberta[i], argNo) == true) then
				contains = true
				break
			end
		end

		if(contains == false) then
			-- -- print ("quant elementos ListaFechada " ..tostring(#self.listaFechada))
			-- -- print("NO que chega")
			if (#self.listaFechada ~= 0) then 
				for i = 1, #self.listaFechada do
					if(self:equals(self.listaFechada[i], argNo) == true) then
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

	self.listaFechada = {}
	self.listaAberta = {}
	self.caminho = {}

	local px, py = cenario:getMapa():pixelToBoard(cenario:getMapa():localizarNoMapa(cenario:getInimigoView():getSprite()))
	local no = node:new(px, py , nil, 0)
	self:addListaAberta(no)
	self:pathFinding(self.listaAberta, self.listaFechada)
end

function aEstrela:continuarProcura(no)
	-- -- print ("Rodando o continuarProcura")

	local vizinhos = node:gerarVizinhos(no)
	for i = 1, #vizinhos do
		self:addListaAberta(vizinhos[i])		
	end
end

function aEstrela:isBorda(no)
	if (no.H == 0) then
		return true
	end
	return false 
end

function aEstrela:retornarCaminho(caminho, no)
	-- -- print("Rodando o retornarCaminho")
	if (no.pai ~= nil) then
		table.insert(caminho, no)
		return self:retornarCaminho(caminho, no.pai)
	else
		return caminho
	end
end

function aEstrela:removerDaListaAberta(no)
	-- -- print ("Rodando o removerDaListaAberta")
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
	-- print ("Rodando o PathFinding")
	-- -- print ("Lista Aberta " ..#self.listaAberta)
	-- -- print ("Lista Fechada " ..#self.listaFechada)

	if(#self.listaAberta ~= 0) then
		local menorF = listaAberta[1].F
		local posMenor = 1

		for i = 1, #listaAberta do
			if (listaAberta[i].F <= menorF) then
				menorF = listaAberta[i].F
				posMenor = i
			end
		end

		if (self:isBorda(listaAberta[posMenor]) == true) then
			if(listaAberta[posMenor].pai ~= nil) then
				self.caminho = self:retornarCaminho(self.caminho, listaAberta[posMenor].pai)
			else
				self.caminho = listaAberta[posMenor]
			end
		end

		self:continuarProcura(listaAberta[posMenor])
		self:addListaFechada(listaAberta[posMenor])
		self:pathFinding(self.listaAberta, self.listaFechada)
	end
end

function aEstrela:getCaminho()
	if(not(self.caminho))then
		self:run()
	end
	
	return self.caminho
end

return aEstrela