local bomba = {bombaSprite = 0,tempoBomba_run = 0, animacaoBomba = 0 }
local frames = require "view.frames"

local imagem = "imagens/animacaoBomba.png"

function bomba:newBomba(argPosicaoX, argPosicaoY)
	print(tempoBomba_run)
	tempoBomba_run, animacaoBomba = frames:tempoBomba(imagem)

	bombaSprite = display.newSprite( animacaoBomba, tempoBomba_run);
		  bombaSprite.x = argPosicaoX
		  bombaSprite.y = argPosicaoY
 
	return bombaSprite
end

return bomba
