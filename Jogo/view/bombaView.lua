local bomba = {bombaSprite = 0,tempoBomba_run = 0, animacaoBomba = 0 }
local frames = require "view.frames"
local mapa = require "view.mapaView"

local imagem = "imagens/animacaoBomba.png"

function bomba:newBomba(argPosicaoX, argPosicaoY)
	print(tempoBomba_run)
	tempoBomba_run, animacaoBomba = frames:tempoBomba(imagem)

	local x, y
	
	x = 16 + (32 * (math.ceil(math.fmod(argPosicaoX, mapa.designedWidth) / 32) - 1))
	y = 16 + (32 * (math.ceil(math.fmod(argPosicaoY, mapa.designedHeight) / 32) - 1))


	bombaSprite = display.newSprite( animacaoBomba, tempoBomba_run);
	  bombaSprite.x = x
	  bombaSprite.y = y
 
	return bombaSprite
end

return bomba
