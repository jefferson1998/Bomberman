local no = {}

function no:calcularDistancia(px, py)
	local personagemPosX, personagemPosY = cenario:getMapa():pixelToBoard(cenario:getMapa():localizarNoMapa(cenario:getPersonagem():getSprite()))
	return math.abs(px - personagemPosX) + math.abs(py - personagemPosY)
end

function no:verificarDistanciaBomba(px, py, mapa)

	local cima, baixo, direita, esquerda = true, true, true, true

	if(mapa[px][py] == 5) then
		return 1
	end

	for i = 1, 4 do
		if(baixo == true and mapa[px + i][py] ~= 0 and mapa[px + i][py] ~= nil) then
			if(mapa[px + i][py] == 5)then
				return i
			end
		else
			baixo = false
		end
		
		if(cima == true and mapa[px - i][py] ~= 0 and mapa[px - i][py] ~= nil) then
			if(mapa[px - i][py] == 5)then
				return i
			end
		else 
			cima = false
		end
		
		if(direita == true and mapa[px][py + i] ~= 0 and mapa[px][py + i] ~= nil) then
			if(mapa[px][py + i] == 5)then
				return i
			end
		else
			direita = false
		end
		
		if(esquerda == true and mapa[px][py - i] ~= 0 and mapa[px][py - i] ~= nil) then
			if(mapa[px][py - i] == 5)then
				return i
			end
		else
			esquerda = false
		end
	end

	return 0

end

function no:validarVizinho(px, py, direcao)
	local estado = cenario:getEstadoJogo():getEstado()
	local distanciaAtualDaBomba = self:verificarDistanciaBomba(px, py, estado)

	if(direcao == "cima" and estado[px - 1][py] ~= 0 and estado[px - 1][py] ~= 3 and estado[px - 1][py] ~= 5 and estado[px - 1][py] ~= nil) then
		if(distanciaAtualDaBomba == 0) then
			if(self:verificarDistanciaBomba(px - 1, py, estado) ==  0) then
				return true
			end
		elseif(self:verificarDistanciaBomba(px - 1, py, estado) > distanciaAtualDaBomba or self:verificarDistanciaBomba(px - 1, py, estado) ==  0) then
			return true
		end
		
	end
	if(direcao == "direita" and estado[px][py + 1] ~= 0 and estado[px][py + 1] ~= 3 and estado[px][py + 1] ~= 5 and estado[px][py + 1] ~= nil) then
		if(distanciaAtualDaBomba == 0) then
			if(self:verificarDistanciaBomba(px, py + 1, estado) ==  0) then
				return true
			end
		elseif(self:verificarDistanciaBomba(px, py + 1, estado) > distanciaAtualDaBomba or self:verificarDistanciaBomba(px, py + 1, estado) ==  0) then
			return true
		end
	end
	if(direcao == "baixo" and estado[px + 1][py] ~= 0 and estado[px + 1][py] ~= 3 and estado[px + 1][py] ~= 5 and estado[px + 1][py] ~= nil) then
		if(distanciaAtualDaBomba == 0) then
			if(self:verificarDistanciaBomba(px + 1, py, estado) ==  0) then
				return true
			end
		elseif(self:verificarDistanciaBomba(px + 1, py, estado) > distanciaAtualDaBomba or self:verificarDistanciaBomba(px + 1, py, estado) ==  0) then
			return true
		end
	end
	if(direcao == "esquerda" and estado[px][py - 1] ~= 0 and estado[px][py - 1] ~= 3 and estado[px][py - 1] ~= 5 and estado[px][py - 1] ~= nil) then
		if(distanciaAtualDaBomba == 0) then
			if(self:verificarDistanciaBomba(px, py - 1, estado) ==  0) then
				return true
			end
		elseif(self:verificarDistanciaBomba(px, py - 1, estado) > distanciaAtualDaBomba or self:verificarDistanciaBomba(px, py - 1, estado) ==  0) then
			return true
		end
	end
end

function no:gerarVizinhos(no)
	local listaVizinhos = {}
	
	if(self:validarVizinho(no.px, no.py, "cima") == true) then
		table.insert(listaVizinhos, self:new(no.px - 1, no.py, no, no.G + 1))
	end
	if(self:validarVizinho(no.px, no.py, "direita") == true) then
		table.insert(listaVizinhos, self:new(no.px, no.py + 1, no, no.G + 1))
	end
	if(self:validarVizinho(no.px, no.py, "baixo") == true) then
		table.insert(listaVizinhos, self:new(no.px + 1, no.py, no, no.G + 1))
	end
	if(self:validarVizinho(no.px, no.py, "esquerda") == true) then
		table.insert(listaVizinhos, self:new(no.px, no.py - 1, no, no.G + 1))
	end

	return listaVizinhos

end

function no:new(argPx, argPy, argPai, argG)
	local node = {
		px = argPx, -- Coordenada X
		py = argPy, -- Coordenada Y
		pai = argPai, -- parent
		H = self:calcularDistancia(argPx, argPy),
		G = argG,
		F = 0
	}

	node.F = node.G + node.H

	return node
end

return no