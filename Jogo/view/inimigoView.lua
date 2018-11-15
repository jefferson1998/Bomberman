local framesBomberman = require "view.frames"
local passosX, passosY = 0, 0
local imagem = "imagens/framesDoInimigo.png"
local posicaoAtualX, posicaoAtualY, posAntX, posAntY
local imagemVencedor = "imagens/inimigoVencedor.png"

local inimigo = {id = 4}

function inimigo:newInimigo()
	inimigo.animacaoBomberman_run, inimigo.animacaoBomberman = framesBomberman:personagemBomberman(imagem)
	inimigo.bombermanSprite = display.newSprite( inimigo.animacaoBomberman, inimigo.animacaoBomberman_run);
	inimigo.bombermanSprite.x = 32 * 13
	inimigo.bombermanSprite.y = 32 * 8.7
	inimigo.bombermanSprite.anchorY = 0.85

	local vertices = {-10,0, -10, 16, 10, 16, 10, 0}
	physics.addBody( inimigo.bombermanSprite, "dynamic", {shape = vertices})
	inimigo.bombermanSprite.isFixedRotation = true
	physics.setGravity( 0, 0 )

	return inimigo.bombermanSprite
end

local inimigoGrafico = inimigo:newInimigo()

function inimigo:determinarOrientacao(posX, posY, caminhoX, caminhoY)

	print (posY - caminhoX)
	print (posX - caminhoY)

	if (posX - caminhoY == 0 and posY - caminhoX > 0) then
		return "cima"
	end
	if (posX - caminhoY == 0 and posY - caminhoX < 0) then
		return "baixo"
	end
	if (posX - caminhoY > 0 and posY - caminhoX == 0) then
		return "esquerda"
	end
	if (posX - caminhoY < 0 and posY - caminhoX == 0) then
		return "direita"
	end
end

function inimigo:mover(px, py)

	local posXnoMapa, posYnoMapa = cenario:getMapa():pixelToBoard(cenario:getMapa():localizarNoMapa(inimigoGrafico))

	local orientacao = self:determinarOrientacao(posYnoMapa, posXnoMapa, px, py)

	if	orientacao == "cima" then
		inimigoGrafico:setSequence( "framesTrasRun" )
		inimigoGrafico:play()
		passosY = -1.3
		passosX = 0

	elseif orientacao == "baixo" then
		inimigoGrafico:setSequence( "framesFrenteRun" )
		inimigoGrafico:play()
		passosY = 1.3
		passosX = 0
	
	elseif orientacao == "direita" then
		inimigoGrafico:setSequence( "framesLadoDireitoRun" )
		inimigoGrafico:play()
		passosY = 0
		passosX = 1.3

	elseif orientacao == "esquerda" then
		inimigoGrafico:setSequence( "framesLadoEsquerdoRun" )
		inimigoGrafico:play()
		passosY = 0
		passosX = -1.3
	end
	local posXpixel, posYpixel = cenario:getMapa():boardToPixel(px, py)
	print ("TESTE")
			
	while math.abs(inimigoGrafico.x - posXpixel) > math.abs(passosX) and math.abs(inimigoGrafico.y - posYpixel) > math.abs(passosY) do
		print (tostring(math.abs(inimigoGrafico.x - posXpixel)), math.abs(inimigoGrafico.y - posYpixel))
		inimigoGrafico.x = inimigoGrafico.x + passosX
		inimigoGrafico.y = inimigoGrafico.y + passosY
	end
	passosX = 0
	passosY = 0
	inimigoGrafico:setFrame(1)
	inimigoGrafico:pause()
end

function inimigo:posicao()
	return inimigoGrafico.x , inimigoGrafico.y
end

function inimigo:getId()
		return inimigo.id
end

function inimigo:getSprite()
	return inimigoGrafico
end

function inimigo:spriteVencedor(spriteBomberman)
	local posX, posY = spriteBomberman.x, spriteBomberman.y
	display.remove( spriteBomberman )
	inimigo.animacaoVencedor_run, inimigo.animacaoVencedor = framesBomberman:animacaoVencedor(imagemVencedor)
	inimigo.vencedorSprite = display.newSprite( inimigo.animacaoVencedor, inimigo.animacaoVencedor_run)
	inimigo.vencedorSprite.x = posX
	inimigo.vencedorSprite.y = posY
	inimigo.vencedorSprite.anchorY = 0.85

	return inimigo.vencedorSprite
end

function inimigo:morrer(id)
	if(id == 4) then
		-- print( "INIMIGO MORTO" )
		cenario:removerEventos()
		display.remove(inimigo:getSprite())
	end
end

local function compare(no1, no2)
	if (no1.G < no2.G) then
		return true
	end
	return false
end

function inimigo:run()
	local caminho = {}

	caminho = cenario:getAEstrela():getCaminho()
	table.sort(caminho, compare)

	for i = 1, #caminho do
		self:mover(caminho[1].px, caminho[1].py)
		cenario:getEstadoJogo():atualizarEstado(inimigo)
	end
end

cenario:getEstadoJogo():atualizarEstado(inimigo)

return inimigo
