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

function bomba:newBombaPersonagem(argPosicaoX, argPosicaoY)

    local tempoBomba_run, animacaoBomba = frames:tempoBomba(imagem)
    local bombaSprite = display.newSprite( animacaoBomba, tempoBomba_run);

    local newBomba = bomba:newBomba(bombaSprite, tempoBomba_run, animacaoBomba, cenario:getPersonagem():getId())

	newBomba.bombaSprite.x, newBomba.bombaSprite.y = mapa:boardToPixel(mapa:pixelToBoard(argPosicaoX, argPosicaoY))
    cenario:getEstadoJogo():atualizarEstado(newBomba)

	return newBomba

end

function bomba:newBombaInimigo(argPosicaoX, argPosicaoY)

    local tempoBomba_run, animacaoBomba = frames:tempoBomba(imagem)
    local bombaSprite = display.newSprite( animacaoBomba, tempoBomba_run);

    local newBomba = bomba:newBomba(bombaSprite, tempoBomba_run, animacaoBomba, cenario:getInimigoView():getId())

    newBomba.bombaSprite.x, newBomba.bombaSprite.y = mapa:boardToPixel(mapa:pixelToBoard(argPosicaoX, argPosicaoY))
    cenario:getEstadoJogo():atualizarEstado(newBomba)

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
