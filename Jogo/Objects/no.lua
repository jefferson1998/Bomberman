local node = {}

local cont = 1

function node:criarNo(estadoDoJogo)
	local no = {
		pai = nil,
		vizinhos = {},
		estado =  nil, 
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
		local inimigoPosX, inimigoPosY = no:posicaoDosJogadores(estado)

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

		local novoEstado = no:getValues(estado)

		local posX, posY = no:posicaoDosJogadores(estado)
		local aux = nil

		if(direcao == "cima") then
			aux = novoEstado[posX - 1][posY]
			novoEstado[posX - 1][posY] = novoEstado[posX][posY]
			novoEstado[posX][posY] = aux
		end
		if(direcao == "direita") then
			aux = novoEstado[posX][posY + 1]
			novoEstado[posX][posY + 1] = novoEstado[posX][posY]
			novoEstado[posX][posY] = aux
		end
		if(direcao == "baixo") then
			aux = novoEstado[posX + 1][posY]
			novoEstado[posX + 1][posY] = novoEstado[posX][posY]
			novoEstado[posX][posY] = aux
		end
		if(direcao == "esquerda") then
			aux = novoEstado[posX][posY - 1]
			novoEstado[posX][posY - 1] = novoEstado[posX][posY]
			novoEstado[posX][posY] = aux
		end
		novoEstado.explorado = false
		return novoEstado
	end

	function no:verificaEstadosIguais(argEstado, argVizinho)

		for i=1,#argEstado do
			for j=1,#argEstado[i] do
				if argEstado[i][j] ~= argVizinho[i][j] then
					return false
				end
			end
		end
		return true
	end

	function no:addVizinho(argVizinho)

		if (no:verificaEstadosIguais(no.estado, argVizinho) == false) then
			table.insert(no.vizinhos, argVizinho)
		end
		-- if(argVizinho ~= no.estado) then
			
		-- end
	end

	function no:gerarVizinho(estado)

		local vizinho = nil
		
		if(no:validarVizinho(estado, "cima") == true) then
			vizinho = no:newVizinho(estado, "cima")
			if (no.pai == nil or no:verificaEstadosIguais(no.pai, vizinho) == false) then
				-- print (no:mostrarEstado(no.pai))
				print (no:mostrarEstado(vizinho))

				no:addVizinho(vizinho)
			end
		end
		if(no:validarVizinho(estado, "direita") == true) then
			vizinho = no:newVizinho(estado, "direita")
			if (no.pai == nil or no:verificaEstadosIguais(no.pai, vizinho) == false) then
				print (no.pai, vizinho)
				print (no:mostrarEstado(vizinho))
				no:addVizinho(vizinho)
			end
		end
		if(no:validarVizinho(estado, "baixo") == true) then
			vizinho = no:newVizinho(estado, "baixo")
			if (no.pai == nil or no:verificaEstadosIguais(no.pai, vizinho) == false) then
				print (no.pai, vizinho)
				print (no:mostrarEstado(vizinho))
				no:addVizinho(vizinho)
			end
		end
		if(no:validarVizinho(estado, "esquerda") == true) then
			vizinho = no:newVizinho(estado, "esquerda")
			if (no.pai == nil or no:verificaEstadosIguais(no.pai, vizinho) == false) then
				print (no.pai, vizinho)
				print (no:mostrarEstado(vizinho))
				no:addVizinho(vizinho)
			end
		end
	end

	function no:setExplorado(argExplorado)
		no.explorado = argExplorado
	end

	function no:getExplorado()
		return no.explorado
	end

	function no:calcularDistancia(estado)
		local inimigoPosX, inimigoPosY, personagemPosX, personagemPosY = no:posicaoDosJogadores(estado)
		return math.abs(inimigoPosX - personagemPosX) + math.abs(inimigoPosY - personagemPosY)
	end

	function no:estaNaBorda(estado)
		local inimigoPosX, inimigoPosY, personagemPosX, personagemPosY = no:posicaoDosJogadores(estado)

		if(inimigoPosX == personagemPosX and inimigoPosY == personagemPosY) then
			no.isBorda = true
			return true

		end
	
		return false
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
	
	if(no.estado == nil or no:estaNaBorda(no.estado) == false) then
		no.estado = estadoDoJogo -- passado no método criarNo lá em cima
		no.explorado = false
		no.distancia = no:calcularDistancia(no.estado)
		no:gerarVizinho(no.estado)
		no.vizinhos.pai = no:getValues(no.estado)
		for i = 1, #no.vizinhos do
			if(cont < 10) then
				cont = cont + 1
				self:criarNo(no.vizinhos[i])
			end
		end
	end

	return no
end

return node