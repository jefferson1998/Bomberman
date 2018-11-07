local no = {vizinhos = {}, estado =  {} , explorado =  false, distancia = 0}


function no:setExplorado(argExplorado)
	no.explorado = argExplorado
end

function no:getExplorado()
	return no.explorado
end

function no:addVizinhos(argVizinho)
	table.insert(no.vizinhos, argVizinho)
end
