local frames = require "view.frames"
local mapa = cenario:getMapa()
local bomba = require "Objects.bomba"
local listaDeBombas = {}
local explosao = require "view.explosaoBomba"
local bombaModel = bomba:newBomba()
local bomba = {bombaSprite = 0,tempoBomba_run = 0, animacaoBomba = 0, sprite = 0}

local imagem = "imagens/animacaoBomba.png"

local function tempoDaBomba()
    --Decrementando os segundos
    -- for i=1,#listaDeBombas do
    --     listaDeBombas[i].tempo = listaDeBombas[i].tempo - 1
    -- end
    bombaModel.tempo = bombaModel.tempo - 1
    -- print("tempo bomba _____" .. bombaModel.tempo)
    --se o tempo for igual a 0 então    
    -- for i=1,#listaDeBombas do
          -- if  listaDeBombas[i].tempo == 0 then
            -- remove a imagem da bomba
            -- print("entrei")
            -- bombaSprite:removeSelf()

            -- print("BOMBAMODEL___" .. bombaModel.tempo)
            -------------------------------------------------------------
            -- Cria a sprite da explosao e nela ve se tem algum objeto --
            -------------------------------------------------------------
            -- explosao:explodir(bomba, cenario:getEstadoJogo())
        -- end     
    -- end  
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
    -- local novaBomba = bomba:newBomba()
    -- table.insert( listaDeBombas, novaBomba)
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
