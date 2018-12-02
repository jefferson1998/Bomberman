-- faz referência a uma biblioteca do Corona	

local bomba = {}

function bomba:newBomba()
	local newBomba = {
		tamanho = 4,
		tempo = 0
	}

	return newBomba
end

return bomba
