local no = {
	vizinhos = {},
	estadoPrincipal =  nil, 
	isBorda =  false, 
	distancia = 0,
	explorado = false
}

function no:getValues(arg)
	local newEstate = {
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{},
		{},
	}

	for i = 1, #arg do
		for j = 1, #arg[i] do
			newEstate[i][j] = arg[i][j]
		end
	end

	return newEstate
		
end

function no:posicaoDosJogadores(estado)
	-- print("POSICAO___" .. estado[1][1])
	local inimigoPosX, inimigoPosY, personagemPosX, personagemPosY = nil, nil, nil, nil

	for i = 1, #estado do
		for j = 1, #estado[i] do
			if(estado[i][j] == 2) then
				personagemPosX, personagemPosY = i, j
			elseif(estado[i][j] == 4) then
				inimigoPosX, inimigoPosY = i, j
			end
			if(personagemPosX ~= nil and personagemPosY ~= nil and inimigoPosX ~= nil and inimigoPosY ~= nil) then
				return inimigoPosX, inimigoPosY, personagemPosX, personagemPosY
			end
		end
	end
end

function no:validarVizinho(estado, direcao)
	local inimigoPosX, inimigoPosY = self:posicaoDosJogadores(estado)

	if(direcao == "cima" and estado[inimigoPosX - 1][inimigoPosY] ~= 0) then
		return true
	end
	if(direcao == "direita" and estado[inimigoPosX][inimigoPosY + 1] ~= 0) then
		return true
	end
	if(direcao == "baixo" and estado[inimigoPosX + 1][inimigoPosY] ~= 0) then
		return true
	end
	if(direcao == "esquerda" and estado[inimigoPosX][inimigoPosY - 1] ~= 0) then
		return true
	end
end

function no:newVizinho(estado, direcao)

	print ("Estado que chega")
	print (self:mostrarEstado(estado))

	local novoEstado = self:getValues(estado)

	print("Novo Estado")
	print(print (self:mostrarEstado(novoEstado)))

	local posX, posY = self:posicaoDosJogadores(estado)
	local aux = nil

	if(direcao == "cima") then
		aux = novoEstado[posX - 1][posY]
		novoEstado[posX - 1][posY] = novoEstado[posX][posY]
		novoEstado[posX][posY] = aux
		print("ESTADO ALTERADO: " .. novoEstado[posX - 1][posY])
	end
	if(direcao == "direita") then
		aux = novoEstado[posX][posY + 1]
		novoEstado[posX][posY + 1] = novoEstado[posX][posY]
		novoEstado[posX][posY] = aux
		print("ESTADO ALTERADO: " .. novoEstado[posX][posY + 1])
	end
	if(direcao == "baixo") then
		aux = novoEstado[posX + 1][posY]
		novoEstado[posX + 1][posY] = novoEstado[posX][posY]
		novoEstado[posX][posY] = aux
		print("ESTADO ALTERADO: " .. novoEstado[posX + 1][posY])
	end
	if(direcao == "esquerda") then
		aux = novoEstado[posX][posY - 1]
		novoEstado[posX][posY - 1] = novoEstado[posX][posY]
		novoEstado[posX][posY] = aux
		print("ESTADO ALTERADO: " .. novoEstado[posX][posY - 1])
	end
	print ("novoEstado que Sai")
	print (self:mostrarEstado(novoEstado))
	novoEstado.explorado = false
	return novoEstado
end

function no:verificaEstadosIguais(argEstado, argVizinho)
	print ("Mostrando Estado")
	print (self:mostrarEstado(argEstado))
	print ("Mostrando Vizinho")
	print (self:mostrarEstado(argVizinho))

	for i=1,#argEstado do
		for j=1,#argEstado[i] do
			if argEstado[i][j] ~= argVizinho[i][j] then
				print("DIFERENTE")
				return false
			end
		end
	end
	return true
end

function no:addVizinho(argVizinho)
	print("Entrei no addVizinho()")
	print ("Mostrando Estado")
	print (self.estadoPrincipal)

	print ("Mostrando Vizinho")
	print (argVizinho.explorado)	
	if (self:verificaEstadosIguais(self.estadoPrincipal, argVizinho) == false and argVizinho.explorado == false) then
		print("ADD VIZINHOS")
		table.insert(self.vizinhos, argVizinho)
		argVizinho.explorado = true
	end
	-- if(argVizinho ~= self.estadoPrincipal) then
		
	-- end
end

function no:gerarVizinho(estado)

	print ("Mostrando Estado")
	print (self:mostrarEstado(self.estadoPrincipal))
	local vizinho = nil
	
	if(self:validarVizinho(estado, "cima") == true) then
		vizinho = self:newVizinho(estado, "cima")
		self:addVizinho(vizinho)
	end
	if(self:validarVizinho(estado, "direita") == true) then
		vizinho = self:newVizinho(estado, "direita")
		self:addVizinho(vizinho)
	end
	if(self:validarVizinho(estado, "baixo") == true) then
		vizinho = self:newVizinho(estado, "baixo")
		self:addVizinho(vizinho)
	end
	if(self:validarVizinho(estado, "esquerda") == true) then
		vizinho = self:newVizinho(estado, "esquerda")
		self:addVizinho(vizinho)
	end
end

function no:setExplorado(argExplorado)
	self.explorado = argExplorado
end

function no:getExplorado()
	return self.explorado
end

function no:calcularDistancia(estado)
	local inimigoPosX, inimigoPosY, personagemPosX, personagemPosY = self:posicaoDosJogadores(estado)
	return math.abs(inimigoPosX - personagemPosX) + math.abs(inimigoPosY - personagemPosY)
end

function no:estaNaBorda(inimigoPosX, inimigoPosY, personagemPosX, personagemPosY)
	
	if(inimigoPosX == personagemPosX and inimigoPosY == personagemPosY) then
		self.isBorda = true
		print("ENTREI NA BORDA")
		return true

	end
	return false
end

function no:criarNo(estadoDoJogo)

	if(self:estaNaBorda(self:posicaoDosJogadores(estadoDoJogo)) == false) then
		print( self.estadoPrincipal )
		self.estadoPrincipal = estadoDoJogo
		print (self:mostrarEstado(self.estadoPrincipal))
		self.explorado = true
		self.distancia = self:calcularDistancia(self.estadoPrincipal)
		self:gerarVizinho(self.estadoPrincipal)
		for i = 1, #self.vizinhos do
			print("CRIEI VIZINHOS")
			print ("Vizinho ".. i)
			print (self:mostrarEstado(self.vizinhos[i]))

			self:criarNo(self.vizinhos[1])
		end
	end
end

function no:mostrarEstado(argEstado)
	local srt = ""

	for i=1,#argEstado do
		for j=1,#argEstado[i] do
			srt = srt .. argEstado[i][j]
		end
		srt = srt .. "\n"
	end
	return srt
end

return no