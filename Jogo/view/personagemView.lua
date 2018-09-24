local personagem = {bomberman = 0,animacaoBombermanFrente_run = 0, animacaoBombermanFrente = 0 }
local framesBombermanParaFrente = require "view.frames"
local cX = display.contentCenterX
local cY = display.contentCenterY

function personagem:newPersonagem()
	animacaoBombermanFrente_run, animacaoBombermanFrente = framesBombermanParaFrente:personagemBombermanParaFrente("imagens/frentePersonagemBranco.png")
	
	bomberman = display.newSprite( animacaoBombermanFrente, animacaoBombermanFrente_run);
		  bomberman.x = cX
		  bomberman.y = cY + 22
 
	return bomberman
end

function personagem:personagemParado()
	return display.newImage("imagens/bomberInicaParado.png", cX, cY + 22)
end

function personagem:mudandoOrientacao(argPosicaoX, argPosicaoY, argFrames)
	animacaoBombermanFrente_run, animacaoBombermanFrente = framesBombermanParaFrente:personagemBombermanParaFrente(argFrames)
	
	bomberman = display.newSprite( animacaoBombermanFrente, animacaoBombermanFrente_run);
		  bomberman.x = cX
		  bomberman.y = cY
 
	return bomberman
end

return personagem