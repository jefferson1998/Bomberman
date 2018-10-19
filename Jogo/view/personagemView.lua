local personagem = {bomberman = 0,animacaoBomberman_run = 0, animacaoBomberman = 0, margemDeFisica = 0}
local framesBomberman = require "view.frames"
local cX = display.contentCenterX
local cY = display.contentCenterY

local imagem = "imagens/framesDoBomberman.png"

function personagem:newPersonagem()
	animacaoBomberman_run, animacaoBomberman = framesBomberman:personagemBomberman(imagem)
	
	bomberman = display.newSprite( animacaoBomberman, animacaoBomberman_run);
		  bomberman.x = 32 * 2.5
		  bomberman.y = 32 * 2.6
 	
 	bomberman.anchorX = 0.5
 	bomberman.anchorY = 0.25

	return bomberman
end

function personagem:margemDeFisica()
	
	local vertices = {-10,0, -10, 6, 10, 6, 10, 0}
		margemDeFisica = display.newPolygon(32*2.5, 32 * 3.4,  vertices )
		margemDeFisica:setStrokeColor(1,0,0)
		margemDeFisica.isVisible = true

		return margemDeFisica
end

return personagem