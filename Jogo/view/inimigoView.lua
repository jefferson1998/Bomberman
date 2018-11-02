local framesBomberman = require "view.frames"
local imagem = "imagens/framesDoBomberman.png"

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

function inimigo:mover()
	
end

function inimigo:enterFrame()
	local posicaoXAtualNoMapa, posicaoYAtualNoMapa = cenario:getMapa():pixelToBoard(cenario:getMapa():localizarNoMapa(inimigoGrafico))

	inimigoGrafico.imagem.x = inimigoGrafico.x + passosX
	inimigoGrafico.imagem.y = inimigoGrafico.y + passosY

	local novaPosicaoX, novaPosicaoY = cenario:getMapa():pixelToBoard(cenario:getMapa():localizarNoMapa(inimigoGrafico))

	if(novaPosicaoX ~= posicaoXAtualNoMapa or novaPosicaoY ~= posicaoYAtualNoMapa) then
		cenario:getEstadoJogo():atualizarEstado(inimigo)
	end

	return inimigoGrafico.x , inimigoGrafico.y
end

function inimigo:getId()
	return inimigo.id
end

function inimigo:getSprite()
	return inimigoGrafico
end

function inimigo:morrer(id)
	if(id == 4) then
		print( "INIMIGO MORTO" )
		cenario:removerEventos()
		display.remove(inimigo:getSprite())
	end
end

return inimigo
