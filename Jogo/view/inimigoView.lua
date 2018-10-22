local personagem = require "view.personagemView"
local imagem = "imagens/framesDoBomberman.png"
local mapa = require "view.mapaView"

local inimigo = personagem:newPersonagem(imagem)


function inimigo:posicaoInimigo()
	return inimigo.x, inimigo.y
end

return inimigo
