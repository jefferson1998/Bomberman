local no = {
	vizinhos = {},
	estado =  cenario:getEstadoJogo(), 
	explorado =  false, 
	distancia = 0
}

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
	local posX, posY = self:posicaoDosJogadores(estado)
	local aux = nil
	if(direcao == "cima") then
		aux = estado[posX - 1][posY]
		estado[posX - 1][posY] = estado[posX][posY]
		estado[posX][posY] = aux
	end
	if(direcao == "direita") then
		aux = estado[posX][posY + 1]
		estado[posX][posY + 1] = estado[posX][posY]
		estado[posX][posY] = aux
	end
	if(direcao == "baixo") then
		aux = estado[posX + 1][posY]
		estado[posX + 1][posY] = estado[posX][posY]
		estado[posX][posY] = aux
	end
	if(direcao == "esquerda") then
		aux = estado[posX][posY - 1]
		estado[posX][posY - 1] = estado[posX][posY]
		estado[posX][posY] = aux
	end
	return estado
end

function no:gerarVizinho(estado)
	
	if(self:validarVizinho(estado, "cima") == true) then
		self:addVizinho(self:newVizinho(estado, "cima"))
	end
	if(self:validarVizinho(estado, "direita") == true) then
		self:addVizinho(self:newVizinho(estado, "direita"))
	end
	if(self:validarVizinho(estado, "baixo") == true) then
		self:addVizinho(self:newVizinho(estado, "baixo"))
	end
	if(self:validarVizinho(estado, "esquerda") == true) then
		self:addVizinho(self:newVizinho(estado, "esquerda"))
	end
end

function no:setExplorado(argExplorado)
	self.explorado = argExplorado
end

function no:getExplorado()
	return self.explorado
end

function no:addVizinho(argVizinho)
	if(argVizinho ~= self.estado) then
		table.insert(self.vizinhos, argVizinho)
	end
end

function no:posicaoDosJogadores(estado)
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

function no:calcularDistancia(estado)
	local inimigoPosX, inimigoPosY, personagemPosX, personagemPosY = self:posicaoDosJogadores(estado)
	return math.abs(inimigoPosX - personagemPosX) + math.abs(inimigoPosY - personagemPosY)
end

function no:estaNaBorda(inimigoPosX, inimigoPosY, personagemPosX, personagemPosY)
	if(inimigoPosX == personagemPosX and inimigoPosY == personagemPosY) then
		return true
	end
	return false
end

function no:criarNo(estado)

	if(self:estaNaBorda(self.posicaoDosJogadores(estado)) == false) then
		self.estado = estado
		self.distancia = self:calcularDistancia(self.estado)
		self:gerarVizinhos(self.estado)
		for i = 1, #self.vizinhos do
			self:criarNo(vizinho[i])
		end
	end
end

