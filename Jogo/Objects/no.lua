local no = {
	estado = cenario:getEstadoJogo(),
	pai = nil, 
	isBorda =  false, 
	distancia = 0
}

function no:posicaoDosJogadores(estado)
	-- -- print("POSICAO___" .. estado[1][1])
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

	if(direcao == "cima" and estado[inimigoPosX - 1][inimigoPosY] ~= 0 and estado[inimigoPosX - 1][inimigoPosY] ~= 5) then
		return true
	end
	if(direcao == "direita" and estado[inimigoPosX][inimigoPosY + 1] ~= 0 and estado[inimigoPosX][inimigoPosY + 1] ~= 5) then
		return true
	end
	if(direcao == "baixo" and estado[inimigoPosX + 1][inimigoPosY] ~= 0 and estado[inimigoPosX + 1][inimigoPosY] ~= 5) then
		return true
	end
	if(direcao == "esquerda" and estado[inimigoPosX][inimigoPosY - 1] ~= 0 and estado[inimigoPosX][inimigoPosY - 1] ~= 5) then
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
		-- print("ESTADO ALTERADO: " .. estado[posX - 1][posY])
	end
	if(direcao == "direita") then
		aux = estado[posX][posY + 1]
		estado[posX][posY + 1] = estado[posX][posY]
		estado[posX][posY] = aux
		-- print("ESTADO ALTERADO: " .. estado[posX][posY + 1])
	end
	if(direcao == "baixo") then
		aux = estado[posX + 1][posY]
		estado[posX + 1][posY] = estado[posX][posY]
		estado[posX][posY] = aux
		-- print("ESTADO ALTERADO: " .. estado[posX + 1][posY])
	end
	if(direcao == "esquerda") then
		aux = estado[posX][posY - 1]
		estado[posX][posY - 1] = estado[posX][posY]
		estado[posX][posY] = aux
		-- print("ESTADO ALTERADO: " .. estado[posX][posY - 1])
	end
	-- print(no:mostrarEstado(estado))
	return estado
end

function no:verificaEstadosIguais(estado, argVizinho)
	for i=1,#estado do
		for j=1,#estado[i] do
			if estado[i][j] ~= argVizinho[i][j] then
				-- print("DIFERENTE")
				return true

			end
		end
	end
	return false
end

function no:addVizinho(argVizinho)	
	if no:verificaEstadosIguais(self.estado, argVizinho) == true then
		-- print("ADD VIZINHOS")
		table.insert(self.vizinhos, argVizinho)
	end
	-- if(argVizinho ~= self.estado) then
		
	-- end
end

function no:gerarVizinho(estado)
	
	if(self:validarVizinho(estado, "cima") == true) then
		self:addVizinho(self:newVizinho(estado, "cima"))
		print("ENTREI CIMA")
	end
	if(self:validarVizinho(estado, "direita") == true) then
		self:addVizinho(self:newVizinho(estado, "direita"))
		-- print("ENTREI DIREITA")
	end
	if(self:validarVizinho(estado, "baixo") == true) then
		self:addVizinho(self:newVizinho(estado, "baixo"))
		-- print("ENTREI BAIXO")
	end
	if(self:validarVizinho(estado, "esquerda") == true) then
		self:addVizinho(self:newVizinho(estado, "esquerda"))
		-- print("ENTREI EQUERS")
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
		-- print("ENTREI NA BORDA")
		return true

	end
	return false
end

function no:criarNo(estado)
	if(self:estaNaBorda(self:posicaoDosJogadores(estado)) == false) then
		self.estado = estado
		self.distancia = self:calcularDistancia(self.estado)
		self:gerarVizinho(self.estado)
		for i = 1, #self.vizinhos do
			self:criarNo(vizinhos[i])
			-- print("CRIEI VIZINHOS")
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