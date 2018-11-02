local buscaEmProfundidade = {posicaoAtual = 0, pilha = {}, posicaoPersonagem}

function buscaEmProfundidade:isResultadoBusca(argPosicaoAtual)
	return posicaoAtual == posicaoPersonagem 
end

function buscaEmProfundidade:buscar()
	if buscaEmProfundidade:isResultadoBusca then
		-- ExibirResultado
	else
		-- Expandir Pilha
	end

end