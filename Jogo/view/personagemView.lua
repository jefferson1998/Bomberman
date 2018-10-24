local framesBomberman = require "view.frames"
local imagem = "imagens/framesDoBomberman.png"
local personagem = {}

function personagem:newPersonagem()
		personagem.animacaoBomberman_run, personagem.animacaoBomberman = framesBomberman:personagemBomberman(imagem)
		personagem.bomberman = display.newSprite( personagem.animacaoBomberman, personagem.animacaoBomberman_run);
		personagem.bomberman.x = 32 * 2.5
		personagem.bomberman.y = 32 * 2.6
 		personagem.bomberman.anchorY = 0.85

	return personagem.bomberman
end



return personagem