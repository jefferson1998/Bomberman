local estado = require "Objects.estadoJogo"
local imagens = display.newGroup( )

local explosaoCentro = "imagens/explosaoCentro.png"
local explosaoCorpo = "imagens/explosaoCorpo.png"
local explosaoPonta = "imagens/explosaoPonta.png"

local explosaoBomba = {
	duracao = 2
}

function explosaoBomba:explodir(bomba, estado)
	local origemX, origemY = bomba
	for i = 1, #estado do
		for j = 1, #estado[i] do
			
		end
	end
end

function botaoView:percorrerAreaDaBomba(inimigo)
	inimigo.x, inimigo.y = inimigo:posicaoInimigo()
	for i=1,7  do
		if math.floor(bombaView.sprite.x) == inimigo.x or math.floor(bombaView.sprite.y) == inimigo.y then
			return true
		end
		bombaView.sprite.y = bombaView.sprite.y + 1
	end

	for i=1,7 do
		if bombaView.sprite.x == inimigo.x or bombaView.sprite.y == inimigo.y then
			return true
		end
		bombaView.sprite.y = bombaView.sprite.y - 1
	end

	for i=1,7 do
		if bombaView.sprite.x == inimigo.x or bombaView.sprite.y == inimigo.y then
			return true
		end
		bombaView.sprite.x = bombaView.sprite.x + 1
	end

	for i=1,7 do
		if bombaView.sprite.x == inimigo.x or bombaView.sprite.y == inimigo.y then
			return true
		end
		bombaView.sprite.x = bombaView.sprite.x - 1
	end

end






return explosaoBomba