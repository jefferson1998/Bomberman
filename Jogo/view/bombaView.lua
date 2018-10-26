local frames = require "view.frames"
local mapa = require "view.mapaView"
local bombaModel = require "Objects.bomba"

local bomba = {bombaSprite = 0,tempoBomba_run = 0, animacaoBomba = 0, sprite = 0}


local imagem = "imagens/animacaoBomba.png"

local function tempoDaBomba()
    --Decrementando os segundos
    bombaModel.tempo = bombaModel.tempo - 1
    print(bombaModel.tempo)
    --se o tempo for igual a 0 então      
    if  bombaModel.tempo == 0 then
        -- remove a imagem da bomba
        bombaSprite:removeSelf()

        -------------------------------------------------------------
        -- Cria a sprite da explosao e nela ve se tem algum objeto --
        -------------------------------------------------------------
   	end     
end

function bomba:newBomba(argPosicaoX, argPosicaoY)
	print(tempoBomba_run)
	tempoBomba_run, animacaoBomba = frames:tempoBomba(imagem)

	bombaSprite = display.newSprite( animacaoBomba, tempoBomba_run);
	bombaSprite.x = 16 + (32 * (math.ceil(math.fmod(argPosicaoX, mapa.designedWidth) / 32) - 1))
	bombaSprite.y = 16 + (32 * (math.ceil(math.fmod(argPosicaoY, mapa.designedHeight) / 32) - 1))
 
	local countDownTimer = timer.performWithDelay( 1000, tempoDaBomba, bombaModel.tempo)

	return bombaSprite
end

return bomba
