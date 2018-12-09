	local framesBomberman = require "view.frames"
local personagemModel = require "Objects.personagem"
local imagem = "imagens/framesDoBomberman.png"
local imagemVencedor = "imagens/vencedor.png"
local personagem = personagemModel
local passosX, passosY = 0, 0

function personagem:newPersonagem()
	personagem.animacaoBomberman_run, personagem.animacaoBomberman = framesBomberman:personagemBomberman(imagem)
	personagem.bombermanSprite = display.newSprite( personagem.animacaoBomberman, personagem.animacaoBomberman_run);
	personagem.bombermanSprite.x = 32 * 2.5
	personagem.bombermanSprite.y = 32 * 2.6
	personagem.bombermanSprite.anchorY = 0.85

	local vertices = {-10,0, -10, 16, 10, 16, 10, 0}
	physics.addBody( personagem.bombermanSprite, "dynamic", {shape = vertices})
	personagem.bombermanSprite.isFixedRotation = true
	physics.setGravity( 0, 0 )

	return personagem.bombermanSprite
end

function personagem:spriteVencedor(spriteBomberman)
	local posX, posY = spriteBomberman.x, spriteBomberman.y
	display.remove( spriteBomberman )
	cenario:getBanco():vencedor()
	personagem.animacaoVencedor_run, personagem.animacaoVencedor = framesBomberman:animacaoVencedor(imagemVencedor)
	personagem.vencedorSprite = display.newSprite( personagem.animacaoVencedor, personagem.animacaoVencedor_run)
	personagem.vencedorSprite.x = posX 
	personagem.vencedorSprite.y = posY
	personagem.vencedorSprite.anchorY = 0.85
	personagem.vitorias = personagem.vitorias + 1

	return personagem.vencedorSprite
end

function personagem:getSpriteVencedor()
	return personagem.vencedorSprite
end

local personagemGrafico = personagem:newPersonagem()

function personagem:touch( e ) 
	
	-- quando há clique ou clicar e arrastar para o lado
	 if e.phase == "began" or e.phase == "moved" then

		if e.target.myName == "up" then

			personagemGrafico:setSequence( "framesTrasRun" )
			personagemGrafico:play()
			passosY = -1
			passosX = 0

		elseif e.target.myName == "down" then

			personagemGrafico:setSequence( "framesFrenteRun" )
			personagemGrafico:play()
			passosY = 1
			passosX = 0

		elseif e.target.myName == "right" then
			personagemGrafico:setSequence( "framesLadoDireitoRun" )
			personagemGrafico:play()
			passosX = 1
			passosY = 0

		elseif e.target.myName == "left" then

			personagemGrafico:setSequence( "framesLadoEsquerdoRun" )
			personagemGrafico:play()
			passosX = -1
			passosY = 0

		end
		
		-- quando soltar o botão ele para
	elseif (e.phase == "ended" or e.phase == "canceled") then
				
		passosX = 0
		passosY = 0
		personagemGrafico:setFrame(1)
		personagemGrafico:pause()
		-- -- print(math.floor(personagemGrafico.x / 32))
		-- -- print(personagemGrafico.x / 32)
	end
end

function personagem:enterFrame()
	local posicaoXAtualNoMapa, posicaoYAtualNoMapa = cenario:getMapa():pixelToBoard(cenario:getMapa():localizarNoMapa(personagemGrafico))
	
	personagemGrafico.x = personagemGrafico.x + passosX
	personagemGrafico.y = personagemGrafico.y + passosY

	local novaPosicaoX, novaPosicaoY = cenario:getMapa():pixelToBoard(cenario:getMapa():localizarNoMapa(personagemGrafico))

	if(novaPosicaoX ~= posicaoXAtualNoMapa or novaPosicaoY ~= posicaoYAtualNoMapa) then
		if(cenario:getEstadoJogo()[novaPosicaoX][novaPosicaoY] == 3) then
			personagem:morrer(personagem.id)
		end
		cenario:getEstadoJogo():atualizarEstado(personagem)
	end

	if(cenario:getBombaView():getBombaPersonagem().tempo == 0 and cenario:getEstadoJogo():getEstado()[posicaoXAtualNoMapa][posicaoYAtualNoMapa] == 3) then
		self:morrer(self:getId())
	end

	--return personagemGrafico.x , personagemGrafico.y
end

function personagem:getSprite()
	return personagemGrafico
end

function personagem:getId()
	return personagem.id
end

function personagem:animacaoVencedor()
	-- body
end

function personagem:morrer(id)
	if(id == 2) then
		cenario:getBanco():perdedor()
		cenario:getInimigoView():spriteVencedor(cenario:getInimigoView():getSprite()):play()
		display.remove(personagem:getSprite())
 		cenario:removerEventos(personagem:getId())
 		cenario.tempo = timer.performWithDelay( 5000, cenario, 1)
	end
end

cenario:getEstadoJogo():atualizarEstado(personagem)

return personagem