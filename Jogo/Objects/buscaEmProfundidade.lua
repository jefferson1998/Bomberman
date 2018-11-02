local buscaEmLargura = {}
local map = cenario:getMapa()
local posInimigoX, posInimigoY
local posPersonagemX, posPersonagemY

function buscaEmLargura:isResultadoBusca(obj)
	posPersonagemX, posPersonagemY = map:pixelToBoard(cenario:getMapa():localizarNoMapa(obj:getSprite()))

	return posPersonagemX == posInimigoX and posPersonagemY == posInimigoY
end

function buscaEmLargura:buscar(posInimigoX, posInimigoY, posPersonagemX, posPersonagemY)
	if buscaEmLargura:isResultadoBusca then
		-- Para o jogo
	else
		if posInimigoX + 1  ~= nil and posInimigoY + 1 ~= nil then
			if posInimigoX + 1 == posPersonagemX and posInimigoY + 1 == posPersonagemY then
				-- Para o jogo
			end 
		elseif posInimigoX - 1  ~= nil and posInimigoY - 1 ~= nil then
			if posInimigoX - 1 == posPersonagemX and posInimigoY - 1 == posPersonagemY then
				-- Para o jogo
			end 
		end
		
	end

end