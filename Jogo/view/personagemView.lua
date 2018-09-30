local personagem = {bomberman = 0,animacaoBomberman_run = 0, animacaoBomberman = 0 }
local framesBomberman = require "view.frames"
local cX = display.contentCenterX
local cY = display.contentCenterY

local imagem = "imagens/framesDoBomberman.png"

function personagem:newPersonagem()
	animacaoBomberman_run, animacaoBomberman = framesBomberman:personagemBomberman(imagem)
	
	bomberman = display.newSprite( animacaoBomberman, animacaoBomberman_run);
		  bomberman.x = cX
		  bomberman.y = cY + 22
 
	return bomberman
end

function personagem:personagemParado()
	return display.newImage("imagens/bomberInicaParado.png", cX, cY + 22)
end

function personagem:orientacaoTras()
	animacaoBomberman_run, animacaoBomberman = framesBomberman:personagemBomberman(argFrames)
	
	bomberman = display.newSprite( animacaoBomberman, animacaoBomberman_run);
		  bomberman.x = cX
		  bomberman.y = cY
 
	return bomberman
end

return personagem