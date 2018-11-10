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

function inimigo:mover(argOrientacao)

	if	argOrientacao == "up" then
		inimigoGrafico:setSequence( "framesTrasRun" )
		inimigoGrafico:play()
		passosY = -1.3
		passosX = 0

	elseif argOrientacao == "down" then
		inimigoGrafico:setSequence( "framesFrenteRun" )
		inimigoGrafico:play()
		passosY = 1.3
		passosX = 0
	
	elseif argOrientacao == "right" then
		inimigoGrafico:setSequence( "framesLadoDireitoRun" )
		inimigoGrafico:play()
		passosY = 0
		passosX = 1.3

	elseif argOrientacao == "left" then
		inimigoGrafico:setSequence( "framesLadoEsquerdoRun" )
		inimigoGrafico:play()
		passosY = 0
		passosX = -1.3

	end
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
		print( "INIMIGO MORTO" )
		cenario:removerEventos()
		display.remove(inimigo:getSprite())
	end
end

-- function inimigo:setPosicaoAtual(posicaoX, posicaoY)
-- 	posicaoAtualX, posicaoAtualY =  posicaoX, posicaoY
-- end

-- function inimigo:setPosicaoAnterior(posicaoX, posicaoY)
-- 	posAntX, posAntY =  posicaoX, posicaoY
-- end

-- function inimigo:getPosicaoAtual()
-- 	return posicaoAtualX, posicaoAtualY
-- end

-- function inimigo:getPosicaoAnterior()
-- 	return posAntX, posAntY
-- end

function inimigo:enterFrame()

	local posicaoXAtualNoMapa, posicaoYAtualNoMapa = cenario:getMapa():pixelToBoard(cenario:getMapa():localizarNoMapa(inimigoGrafico))

	inimigoGrafico.x = inimigoGrafico.x + passosX
	inimigoGrafico.y = inimigoGrafico.y + passosY 	
	local novaPosicaoX, novaPosicaoY = cenario:getMapa():pixelToBoard(cenario:getMapa():localizarNoMapa(inimigoGrafico))
	
	if(novaPosicaoX ~= posicaoXAtualNoMapa or novaPosicaoY ~= posicaoYAtualNoMapa) then
		cenario:getEstadoJogo():atualizarEstado(inimigo)
	end

	return posicaoXAtualNoMapa , posicaoXAtualNoMapa
end
cenario:getEstadoJogo():atualizarEstado(inimigo)
cenario:getAEstrela():percorrerVizinhos(cenario:getEstadoJogo())
return inimigo
