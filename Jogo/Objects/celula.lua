local celula = {noPai =  {}, noEstado = {}, custo = 0}

function celula:getNoPai()
	return celula.noPai
end

function celula:addNoPai(argNoPai)
	table.insert(celula.noPai, argNoPai)
end

function celula:addNoEstado(argNoEstado)
	table.insert(celula.noEstado, argNoEstado)
end

function celula:getNoEstado()
	return celula.noEstado
end

function celula:setCusto(argCusto)
	celula.custo = argCusto
end

function celula:getCusto()
	return celula.custo
end
