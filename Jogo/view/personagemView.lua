local personagem = {bomberman = 0,animacaoBomberman_run = 0, animacaoBomberman = 0, posicaoX = 0, posicaoY = 0 }
local framesBomberman = require "view.frames"
local cX = display.contentCenterX
local cY = display.contentCenterY

local imagem = "imagens/framesDoBomberman.png"

function personagem:newPersonagem()
	animacaoBomberman_run, animacaoBomberman = framesBomberman:personagemBomberman(imagem)
	
	bomberman = display.newSprite( animacaoBomberman, animacaoBomberman_run);
		  bomberman.x = 32 * 2.5
		  bomberman.y = 32 * 2.6
 
	return bomberman
end

return personagem