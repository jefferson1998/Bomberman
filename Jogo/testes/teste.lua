local luaunit = require ('luaunit')
local mapa = require ('mapa')
local aEstrela = require ('aEstrela')
local node = require ('node')

print(mapa:mostrarMapa())
--Função de converter o valor do Pixel em Posição na Matriz
function testPixelToBoard()
    local colunaInimigo, linhaInimigo = mapa:pixelToBoard(400,272)
    local colunaPersonagem, linhaPersonagem  = mapa:pixelToBoard(80,83)
    luaunit.assertEquals(linhaInimigo, 9, colunaInimigo ,13 )
    luaunit.assertEquals(linhaPersonagem, 3, colunaPersonagem ,3)
end

--Função de converter o valor da Matriz para Pixel no Mapa
function testBoardToPixel()
	local pxInimigo, pyInimigo = mapa:boardToPixel(9, 13)
	local pxPersonagem, pyPersonagem = mapa:boardToPixel(3,3)
	luaunit.assertEquals(pxInimigo, 400, pyInimigo, 272)
	luaunit.assertEquals(pxPersonagem, 80, pyPersonagem, 83)
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
	luaunit.assertTrue(node:validarVizinho(9, 13, "esquerda"))
	luaunit.assertTrue(node:validarVizinho(9, 13, "cima"))
end

function testIaEstaNaBorda()
	local novoNo = node:new(9, 12, {9,13}, 1)
	local noFinal = node:new(3, 3, {3,4}, 1)
	luaunit.assertFalse(aEstrela:isBorda(novoNo))
	luaunit.assertTrue(aEstrela:isBorda(noFinal))
	luaunit.assertFalse(aEstrela:isBorda(nil))
end

function testIaGerarNo()
	local no1 = node:new(9, 12, {9,13}, 1)
	local no2 = node:new(3, 3, {3,4}, 1)
	luaunit.assertEquals(no1,  node:new(9, 12, {9,13}, 1))
	luaunit.assertEquals(no2,  node:new(3, 3, {3,4}, 1))
end

function testIaNosIguais()
	local no1 = node:new(9, 12, {9,13}, 1)
	local no2 = node:new(9, 12, {9,13}, 1)
	luaunit.assertEquals(true,aEstrela:equals(no1,no2))
end

function testIaNosDiferentes()
	local no1 = node:new(9, 12, {9,13}, 1)
	local no2 = node:new(9, 11, {9,12}, 1)
	luaunit.assertFalse(aEstrela:equals(no1,no2))
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
	aEstrela:addListaFechada(no)
	aEstrela:addListaAberta(no2)

	luaunit.assertEquals(1,#aEstrela.listaAberta)
	luaunit.assertEquals(1,#aEstrela.listaFechada)

	aEstrela:addListaFechada(no2)
	luaunit.assertEquals(0,#aEstrela.listaAberta)

end

function testIaCaminho()
	local caminho = {}
	local no = node:new(9, 12, {9,13}, 1)
	local caminhoRetornado = aEstrela:retornarCaminho(caminho, no)
	luaunit.assertNotNil(caminhoRetornado)
	luaunit.assertEquals(9, caminhoRetornado[1].px, 13, caminhoRetornado[1].py)
end

function testVerificaPersonagemNaBomba()
	local personagem, inimigo = mapa:verificarQuemEstaNaPosicao(4,3)
	luaunit.assertFalse(personagem)
	luaunit.assertFalse(inimigo)

	mapa[3][3] = 5		
	personagem, inimigo = mapa:verificarQuemEstaNaPosicao(3,3)
	luaunit.assertTrue(personagem)

	mapa[3][3] = 2
	mapa[9][13] = 5		
	personagem, inimigo = mapa:verificarQuemEstaNaPosicao(13,9)
	luaunit.assertFalse(personagem)
	luaunit.assertTrue(inimigo)

	mapa[9][13] = 4
end

os.exit (  luaunit . LuaUnit . run ()  )