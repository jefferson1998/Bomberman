local no = {}

function no:calcularDistancia(px, py)
	local personagemPosX, personagemPosY = cenario:getMapa():pixelToBoard(cenario:getMapa():localizarNoMapa(cenario:getPersonagem():getSprite()))
	return math.abs(px - personagemPosX) + math.abs(py - personagemPosY)
end

function no:validarVizinho(px, py, direcao)
	local estado = cenario:getEstadoJogo():getEstado()

	if(direcao == "cima" and estado[px - 1][py] ~= 0 and estado[px - 1][py] ~= 3 and estado[px - 1][py] ~= 5 and estado[px - 1][py] ~= nil) then
		return true
	end
	if(direcao == "direita" and estado[px][py + 1] ~= 0 and estado[px][py + 1] ~= 3 and estado[px][py + 1] ~= 5 and estado[px][py + 1] ~= nil) then
		return true
	end
	if(direcao == "baixo" and estado[px + 1][py] ~= 0 and estado[px + 1][py] ~= 3 and estado[px + 1][py] ~= 5 and estado[px + 1][py] ~= nil) then
		return true
	end
	if(direcao == "esquerda" and estado[px][py - 1] ~= 0 and estado[px][py - 1] ~= 3 and estado[px][py - 1] ~= 5 and estado[px][py - 1] ~= nil) then
		return true
	end
end

function no:gerarVizinhos(no)
	local listaVizinhos = {}
	
	if(self:validarVizinho(no.px, no.py, "cima") == true) then
		table.insert(listaVizinhos, self:new(no.px - 1, no.py, no, no.G + 1))
		-- print("ENTREI CIMA")
		-- print("Y __" .. no.py)
		-- print("X __" .. no.px)
	end
	if(self:validarVizinho(no.px, no.py, "direita") == true) then
		table.insert(listaVizinhos, self:new(no.px, no.py + 1, no, no.G + 1))
		-- -- print("ENTREI DIREITA")
		-- -- print("X __" .. no.px)
		-- -- print("Y __" .. no.py)
	end
	if(self:validarVizinho(no.px, no.py, "baixo") == true) then
		table.insert(listaVizinhos, self:new(no.px + 1, no.py, no, no.G + 1))
		-- -- print("ENTREI BAIXO")
		-- -- print("X __" .. no.px)
		-- -- print("Y __" .. no.py)
	end
	if(self:validarVizinho(no.px, no.py, "esquerda") == true) then
		table.insert(listaVizinhos, self:new(no.px, no.py - 1, no, no.G + 1))
		-- -- print("ENTREI ESQUERDA")
		-- -- print("X __" .. no.px)
		-- -- print("Y __" .. no.py)
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