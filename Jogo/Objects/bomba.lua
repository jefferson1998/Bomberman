-- faz referência a uma biblioteca do Corona	
local widget = require "widget"
local personagem = require "Objects.personagem"
local inimigo = require "Objects.inimigo"

local bomba = {
	tamanho = 0,
	tempo = 5,
	imagem = "",
}

local w = display.contentWidth
local h = display.contentHeight


local buttonExplosion = widget.newButton {
	defaultFile = "imagens/botaoBomba.png"
}

buttonExplosion.x = w - 35
buttonExplosion.y = h - 150


function mover()
	buttonExplosion.x = buttonExplosion - 10
end

local eixoX, eixoY

local update = function ()
	
	eixoX, eixoY = personagem:localizacaoNoMapa()
end

local function updateTime()
    --Decrementando os segundos
    bomba.tempo =  bomba.tempo - 1
    
    --se o tempo for igual a 0 então      
    if  bomba.tempo == 0 then
        --remova a imagem
        bomba.imagem:removeSelf()
        -- renove o tempo, quando houver outra bomba o tempo voltará o mesmo
        bomba.tempo = 5
    --se não, exiba BOOOOM!
   	end     
end


local touchFunction = function (evento)
	-- quando há clique  
	if evento.phase == "began" then
			bomba.imagem = display.newCircle(eixoX, eixoY, 7)

	local countDownTimer = timer.performWithDelay( 1000, updateTime, bomba.tempo)
	end
end

Runtime:addEventListener("enterFrame", update)
buttonExplosion:addEventListener("touch", touchFunction)

