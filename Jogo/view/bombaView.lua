local frames = require "view.frames"
local mapa = cenario:getMapa()
local bombaModel = require "Objects.bomba"
local explosao = require "view.explosaoBomba"

local bomba = {bombaSprite = 0,tempoBomba_run = 0, animacaoBomba = 0, sprite = 0}

local imagem = "imagens/animacaoBomba.png"

local function tempoDaBomba()
    --Decrementando os segundos
    bombaModel.tempo = bombaModel.tempo - 1
    -- print("tempo bomba _____" .. bombaModel.tempo)
    --se o tempo for igual a 0 então      
    if  bombaModel.tempo == 0 then
        -- remove a imagem da bomba
        -- print("entrei")
        bombaSprite:removeSelf()

        -- print("BOMBAMODEL___" .. bombaModel.tempo)
        -------------------------------------------------------------
        -- Cria a sprite da explosao e nela ve se tem algum objeto --
        -------------------------------------------------------------
        explosao:explodir(bomba, cenario:getEstadoJogo())
   	end     
end

function bomba:newBomba(argPosicaoX, argPosicaoY)
	-- -- print(tempoBomba_run)
 --    -- print(bombaModel.tempo)
	tempoBomba_run, animacaoBomba = frames:tempoBomba(imagem)

	bombaSprite = display.newSprite( animacaoBomba, tempoBomba_run);
	bombaSprite.x, bombaSprite.y = mapa:boardToPixel(mapa:pixelToBoard(argPosicaoX, argPosicaoY))
    -- print(bombaSprite.x,  bombaSprite.y)
    cenario:getEstadoJogo():atualizarEstado(bomba)
    local countDownTimer = timer.performWithDelay( 1000, tempoDaBomba, bombaModel.tempo)

	return bombaSprite

end

function bomba:getBombaModel()
    return bombaModel
end

function bomba:addFisica()
    physics.addBody( bombaSprite, "static")
end

function bomba:getSprite()
    return bombaSprite
end

function bomba:getId()
    return 5
end

return bomba
