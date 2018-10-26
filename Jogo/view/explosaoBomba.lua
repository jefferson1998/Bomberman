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











return explosaoBomba