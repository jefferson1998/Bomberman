local framesBomberman = require "view.frames"
local imagem = "imagens/framesDoBomberman.png"
local personagem = {}

local passosX, passosY = 0, 0

function personagem:newPersonagem()
		personagem.animacaoBomberman_run, personagem.animacaoBomberman = framesBomberman:personagemBomberman(imagem)
		personagem.bombermanSprite = display.newSprite( personagem.animacaoBomberman, personagem.animacaoBomberman_run);
		personagem.bombermanSprite.x = 32 * 2.5
		personagem.bombermanSprite.y = 32 * 2.6
 		personagem.bombermanSprite.anchorY = 0.85

	return personagem.bombermanSprite
end

local personagemGrafico = personagem:newPersonagem()

function personagem:adicionandoFisica()
		local vertices = {-10,0, -10, 16, 10, 16, 10, 0}
		physics.addBody( personagemGrafico, "dynamic", {shape = vertices})
		personagemGrafico.isFixedRotation = true
		physics.setGravity( 0, 0 )
end

personagem:adicionandoFisica()

function personagem:touch( e ) 
	-- quando há clique ou clicar e arrastar para o lado
	 if e.phase == "began" or e.phase == "moved" then
		if direcao == "up" then

			personagemGrafico:setSequence( "framesTrasRun" )
			personagemGrafico:play()
			passosY = -1.3
			passosX = 0

		elseif direcao == "down" then

			personagemGrafico:setSequence( "framesFrenteRun" )
			personagemGrafico:play()
			passosY = 1.3
			passosX = 0

		elseif direcao == "right" then
			
			personagemGrafico:setSequence( "framesLadoDireitoRun" )
			personagemGrafico:play()
			passosX = 1.3
			passosY = 0

		elseif direcao == "left" then

			personagemGrafico:setSequence( "framesLadoEsquerdoRun" )
			personagemGrafico:play()
			passosX = -1.3
			passosY = 0

		 else
		 	passosX = 0
			passosY = 0
			personagemGrafico:setFrame(1)
			personagemGrafico:pause()
		end
	-- quando soltar o botão ele para
	elseif (e.phase == "ended" or e.phase == "canceled") then
		
		passosX = 0
		passosY = 0
		personagemGrafico:setFrame(1)
		personagemGrafico:pause()
		-- print(math.floor(personagemGrafico.x / 32))
		-- print(personagemGrafico.x / 32)
	end
end

function personagem:enterFrame()
	personagemGrafico.x = personagemGrafico.x + passosX
	personagemGrafico.y = personagemGrafico.y + passosY
	return personagemGrafico.x , personagemGrafico.y
end

function personagem:getPersonagemGrafico()
	return personagemGrafico
end

-- executa em vários ciclos, ou seja, fica atualizando direto a posição do personagem
Runtime:addEventListener("enterFrame", personagem)

return personagem