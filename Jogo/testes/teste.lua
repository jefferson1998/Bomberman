local luaunit = require ('luaunit')
local mapa = require ('mapa')
local aEstrela = require ('aEstrela')
local node = require ('node')


print(mapa:mostrarMapa())

--Função de converter o valor do Pixel em Posição na Matriz
function testInsercaoBomba()
    local X,Y = mapa:pixelToBoard(80,83)
    return luaunit.assertEquals(mapa[X][Y], 2)
end

--Função de converter o valor da Matriz para Pixel no Mapa

function testeBoardToPixel()
	local px, py = mapa:boardToPixel(9, 13)
	return luaunit.assertEquals(px, 400, py, 272)
end

--Função de calcular o valor Heurístico.
function testIaCalcularDistancia()
	luaunit.assertEquals(16, node:calcularDistancia(9, 13))
	luaunit.assertEquals(15, node:calcularDistancia(9, 12))
	luaunit.assertEquals(14, node:calcularDistancia(9, 11))
end

--Função de verificar se a posição é válida
function testIaValidarVizinho()
	luaunit.assertEquals(nil, node:validarVizinho(9, 13, "direita"))
	luaunit.assertEquals(nil, node:validarVizinho(9, 13, "baixo"))
	luaunit.assertEquals(true, node:validarVizinho(9, 13, "esquerda"))
	luaunit.assertEquals(true, node:validarVizinho(9, 13, "cima"))
end

function testIaEstaNaBorda()
	local novoNo = node:new(9, 12, {9,13}, 1)
	local noFinal = node:new(3, 3, {3,4}, 1)
	luaunit.assertEquals(false,  aEstrela:isBorda(novoNo))
	luaunit.assertEquals(true,  aEstrela:isBorda(noFinal))
end

function testIaNosIguais()
	local no1 = node:new(9, 12, {9,13}, 1)
	local no2 = node:new(9, 12, {9,13}, 1)
	luaunit.assertEquals(true,aEstrela:equals(no1,no2))
end

function testIaNosDiferentes()
	local no1 = node:new(9, 12, {9,13}, 1)
	local no2 = node:new(9, 11, {9,12}, 1)
	luaunit.assertEquals(false,aEstrela:equals(no1,no2))
end

function testIaGerarVizinhos()
	local no1 = node:new(9, 12, {9,13}, 1)
	local listaDeVizinhos = node:gerarVizinhos(no1)
	luaunit.assertEquals(2,#listaDeVizinhos)
end

function testListaAberta()
	local no = node:new(9, 13, {9,13}, 1)
	local no2 = node:new(9, 12, {9,13}, 1)

	aEstrela:addListaAberta(no)
	luaunit.assertEquals(1,#aEstrela.listaAberta)

	aEstrela:addListaAberta(no2)
	luaunit.assertEquals(2,#aEstrela.listaAberta)
end

function testListaFechada()
	local no = node:new(9, 13, {9,13}, 1)
	local no2 = node:new(9, 12, {9,13}, 1)
	aEstrela:addListaAberta(no)
	aEstrela:addListaFechada(no)

	luaunit.assertEquals(1,#aEstrela.listaAberta)
	luaunit.assertEquals(1,#aEstrela.listaFechada)

	aEstrela:addListaFechada(no2)
	luaunit.assertEquals(0,#aEstrela.listaAberta)

end

function testIaCaminho()
	-- local no = node:new(9, 13, {9,13}, 1)
	-- local caminho = {}
	-- print(aEstrela:getCaminho())
	-- print(#aEstrela:retornarCaminho(caminho, no))
	
end

os.exit (  luaunit . LuaUnit . run ()  )