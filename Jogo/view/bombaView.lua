local frames = require "view.frames"
local mapa = cenario:getMapa()
local bombaModel = require "Objects.bomba"
local bombaAtiva = false
local bombaInimigo = bombaModel:newBomba()
local bombaPersonagem = bombaModel:newBomba()
local tempoDaBomba


local bomba = {}

local imagem = "imagens/animacaoBomba.png"

function bomba:newBomba(bombaSprite, tempo, animacaoBomba, id)
    local newBomba = {bombaSprite = bombaSprite ,tempoBomba_run = tempo, animacaoBomba = animacaoBomba, idJogador = id, duracao = 4, tamanho = 4}

    function newBomba:getId()
        return 5
    end

    function newBomba:getSprite()
        return newBomba.bombaSprite
    end

    return newBomba
end

function bomba:timer(event)
    if event.source.params ~= nil then
        if (event.source.params.bombaDoInimigo ~= nil) then
            print("duração bomba inimigo " .. event.source.params.bombaDoInimigo.duracao)
            event.source.params.bombaDoInimigo.duracao = event.source.params.bombaDoInimigo.duracao - 1
            if  event.source.params.bombaDoInimigo.duracao == 0 then
                -- remove a imagem da bomba
                print("BOMBAMODEL inimigi _____")
                event.source.params.bombaDoInimigo.bombaSprite:removeSelf()

                -- print("BOMBAMODEL___" .. bombaMo.del.tempo)
                -------------------------------------------------------------
                -- Cria a sprite da explosao e nela ve se tem algum objeto --
                -------------------------------------------------------------
                cenario:getExplosao():explodir(cenario:getEstadoJogo(), event.source.params.bombaDoInimigo)
                event.source.params.bombaDoInimigo = nil
                cenario:getInimigoView():setBombaAtiva(false)
            end  
        end 
    else
        timer.cancel(tempoDaBomba)
    end
end

function bomba:newBombaPersonagem(argPosicaoX, argPosicaoY)
	-- -- print(tempoBomba_run)
 --    -- print(bombaModel.tempo)
    local tempoBomba_run, animacaoBomba = frames:tempoBomba(imagem)
    local bombaSprite = display.newSprite( animacaoBomba, tempoBomba_run);

    local newBomba = bomba:newBomba(bombaSprite, tempoBomba_run, animacaoBomba, cenario:getPersonagem():getId())

	newBomba.bombaSprite.x, newBomba.bombaSprite.y = mapa:boardToPixel(mapa:pixelToBoard(argPosicaoX, argPosicaoY))
    -- print(bombaSprite.x,  bombaSprite.y)
    cenario:getEstadoJogo():atualizarEstado(newBomba)
    -- if tempoDaBomba == nil then
    --     tempoDaBomba = timer.performWithDelay( 1000, bomba, 0)
    -- end
    -- tempoDaBomba.params = {bombaDoPersonagem = newBomba} 
    -- local novaBomba  bomba:newBomba()
    -- table.insert( listaDeBombas, novaBomba)
	return newBomba

end

function bomba:newBombaInimigo(argPosicaoX, argPosicaoY)
    -- -- print(tempoBomba_run)
 --    -- print(bombaModel.tempo)
    local tempoBomba_run, animacaoBomba = frames:tempoBomba(imagem)
    local bombaSprite = display.newSprite( animacaoBomba, tempoBomba_run);

    local newBomba = bomba:newBomba(bombaSprite, tempoBomba_run, animacaoBomba, cenario:getInimigoView():getId())

    newBomba.bombaSprite.x, newBomba.bombaSprite.y = mapa:boardToPixel(mapa:pixelToBoard(argPosicaoX, argPosicaoY))
    -- print(bombaSprite.x,  bombaSprite.y)
    cenario:getEstadoJogo():atualizarEstado(newBomba)

    if tempoDaBomba == nil then
        tempoDaBomba = timer.performWithDelay( 1000, bomba, 0)
    end

    tempoDaBomba.params = {bombaDoInimigo = newBomba}
    -- local novaBomba = bomba:newBomba()
    -- table.insert( listaDeBombas, novaBomba)
    return newBomba

end

function bomba:getBombaPersonagem()
    return bombaPersonagem
end

function bomba:getBombaInimigo()
    return bombaInimigo 
end

function bomba:getBombaAtiva()
    return bombaAtiva
end

function bomba:setBombaAtiva(condicao)
    bombaAtiva = condicao
end

function bomba:addFisica()
    physics.addBody( bombaPersonagem.bombaSprite, "static")
    physics.addBody( bombaInimigo.bombaSprite, "static")

end

function bomba:getSprite()
    return bombaPersonagem.bombaSprite, bombaInimigo.bombaSprite
end

function bomba:getId()
    return 5
end

return bomba
