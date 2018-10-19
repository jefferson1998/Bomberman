-- faz referência a uma biblioteca do Corona	
local widget = require "widget"
local personagem = require "Objects.personagem"
local inimigoView = require "view.inimigoView"
local bombaView = require "view.bombaView"
local botaoBombaView = require "view.botaoBombaView"

local bomba = {
	tamanho = 7,
	tempo = 0,
	imagem = bombaView,
}

local eixoX, eixoY

local update = function ()
	eixoX, eixoY = personagem:localizacaoNoMapa()
end

local function updateTime()
    --Decrementando os segundos
    bomba.tempo =  bomba.tempo - 1
    
    --se o tempo for igual a 0 então      
    if  bomba.tempo == 0 then
        --remova a imagem do inimigo
        if bomba:percorrerAreaDaBomba(inimigoView) then
        	inimigoView:removeSelf()
        end
        -- remove a imagem da bomba
        bomba.imagem:removeSelf()
   	end     
end


function bomba:percorrerAreaDaBomba(inimigo)
	inimigo.x, inimigo.y = inimigo:posicaoInimigo()
	for i=1,7  do
		if math.floor(bomba.imagem.x) == inimigo.x or math.floor(bomba.imagem.y) == inimigo.y then
			return true
		end
		bomba.imagem.y = bomba.imagem.y + 1
	end

	for i=1,7 do
		if bomba.imagem.x == inimigo.x or bomba.imagem.y == inimigo.y then
			return true
		end
		bomba.imagem.y = bomba.imagem.y - 1
	end

	for i=1,7 do
		if bomba.imagem.x == inimigo.x or bomba.imagem.y == inimigo.y then
			return true
		end
		bomba.imagem.x = bomba.imagem.x + 1
	end

	for i=1,7 do
		if bomba.imagem.x == inimigo.x or bomba.imagem.y == inimigo.y then
			return true
		end
		bomba.imagem.x = bomba.imagem.x - 1
	end

end

local touchFunction = function (evento)
	-- quando há clique  
	if evento.phase == "began" then
			if bomba.tempo == 0 then
				bomba.imagem = bombaView:newBomba(eixoX, eixoY)
				bomba.imagem:play()
				bomba.tempo = 5
				local countDownTimer = timer.performWithDelay( 1000, updateTime, bomba.tempo)
			end
	end
end

Runtime:addEventListener("enterFrame", update)
botaoBombaView:addEventListener("touch", touchFunction)