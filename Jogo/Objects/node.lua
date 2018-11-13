local no = {}

function no:calcularDistancia(px, py)
	local personagemPosX, personagemPosY = cenario:getMapa():pixelToBoard(cenario:getPersonagem():getSprite())
	return math.abs(px - personagemPosX) + math.abs(py - personagemPosY)
end

function no:new(argPx, argPy, argPai, argG)
	local node = {
		px = argPx, -- Coordenada X
		py = argPy, -- Coordenada Y
		pai = argPai, -- parent
		H = self:calcularDistancia(px, py),
		G = argG,
		F = H + G
	}

	return no
end