local frames = require "view.frames"
local mapa = cenario:getMapa()
local bomba = require "Objects.bomba"
local explosao = require "view.explosaoBomba"
local bombaInimigo = bomba:newBomba()
local bombaPersonagem = bomba:newBomba()
local bomba = {bombaSprite = 0,tempoBomba_run = 0, animacaoBomba = 0, sprite = 0}

local imagem = "imagens/animacaoBomba.png"


local function tempoDaBombaPersonagem()
    
    bombaPersonagem.tempo = bombaPersonagem.tempo - 1
    
    if  bombaPersonagem.tempo == 0 then
        -- remove a imagem da bomba
        -- print("entrei")
        bombaSprite:removeSelf()

        -- print("BOMBAMODEL___" .. bombaModel.tempo)
        -------------------------------------------------------------
        -- Cria a sprite da explosao e nela ve se tem algum objeto --
        -------------------------------------------------------------
        explosao:explodir(bomba, cenario:getEstadoJogo(), bombaPersonagem)
   	end     
end

local function tempoDaBombaInimigo()

    bombaInimigo.tempo = bombaInimigo.tempo - 1

    if  bombaInimigo.tempo == 0 then
        bombaSprite:removeSelf()
        explosao:explodir(bomba, cenario:getEstadoJogo(), bombaInimigo)
    end     
end

function bomba:newBombaPersonagem(argPosicaoX, argPosicaoY)
	-- -- print(tempoBomba_run)
 --    -- print(bombaModel.tempo)
	tempoBomba_run, animacaoBomba = frames:tempoBomba(imagem)

	bombaSprite = display.newSprite( animacaoBomba, tempoBomba_run);
	bombaSprite.x, bombaSprite.y = mapa:boardToPixel(mapa:pixelToBoard(argPosicaoX, argPosicaoY))
    -- print(bombaSprite.x,  bombaSprite.y)
    cenario:getEstadoJogo():atualizarEstado(bomba)
    local countDownTimer = timer.performWithDelay( 1000, tempoDaBombaPersonagem, bombaPersonagem.tempo)
    -- local novaBomba = bomba:newBomba()
    -- table.insert( listaDeBombas, novaBomba)
	return bombaSprite

end

function bomba:newBombaInimigo(argPosicaoX, argPosicaoY)
    -- -- print(tempoBomba_run)
 --    -- print(bombaModel.tempo)
    tempoBomba_run, animacaoBomba = frames:tempoBomba(imagem)

    bombaSprite = display.newSprite( animacaoBomba, tempoBomba_run);
    bombaSprite.x, bombaSprite.y = mapa:boardToPixel(mapa:pixelToBoard(argPosicaoX, argPosicaoY))
    -- print(bombaSprite.x,  bombaSprite.y)
    cenario:getEstadoJogo():atualizarEstado(bomba)
    local countDownTimer = timer.performWithDelay( 1000, tempoDaBombaInimigo, bombaInimigo.tempo)
    -- local novaBomba = bomba:newBomba()
    -- table.insert( listaDeBombas, novaBomba)
    return bombaSprite

end

function bomba:getBombaPersonagem()
    return bombaPersonagem
end

function bomba:getBombaInimigo()
    return bombaInimigo
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
