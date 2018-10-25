local widget = require "widget"
local bombaView = require "view.bombaView"
local bomba = require "Objects.bomba"
local personagemView = require "view.personagemView"
local inimigoView = require "view.inimigoView"

local botaoView = widget.newButton {
	defaultFile = "imagens/botaoBomba.png"
}

local w = display.contentWidth
local h = display.contentHeight
local eixoX, eixoY

botaoView.x = w - 35
botaoView.y = h - 150

local function tempoDaBomba()
    --Decrementando os segundos
    bomba.tempo =  bomba.tempo - 1
    print(bomba.tempo)
    --se o tempo for igual a 0 então      
    if  bomba.tempo == 0 then
        --remova a imagem do inimigo
        if botaoView:percorrerAreaDaBomba(inimigoView) then
        	inimigoView:removeSelf()
        end
        -- remove a imagem da bomba
        bombaView.sprite:removeSelf()
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

function botaoView:pegandoLocalizandoPersonagem()	
	eixoX, eixoY = personagemView:enterFrame()
	print("LINHA___________" .. eixoX)
	return eixoX,eixoY
end 



function botaoView:touch(evento)
	if evento.phase == "began" then
		if bomba.tempo == 0 then
				bombaView.sprite = bombaView:newBomba(botaoView:pegandoLocalizandoPersonagem())
				bombaView.sprite:play()
				bomba.tempo = 5
				local countDownTimer = timer.performWithDelay( 1000, tempoDaBomba	, bomba.tempo)
		end
	end
end

botaoView:addEventListener("touch", botaoView)

return botaoView