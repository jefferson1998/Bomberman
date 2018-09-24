local cX = display.contentCenterX
local cY = display.contentCenterY
local w = display.contentWidth
local h = display.contentHeight

-- cria o sistema de rotação

local widget = require "widget"

local animacao = require ("view.personagemView")

local personagemBomberman = {
	personagemEmMovimento = animacao:newPersonagem()
}

local buttons = {}

buttons[1] = display.newImage("imagens/botaoMovimentarPersonagem.png")
buttons[1]:rotate ( 180 )
buttons[1].x = w - 445
buttons[1].y = h - 196
buttons[1].width = 30
buttons[1].height = 35
buttons[1].myName = "up"

buttons[2] = display.newImage("imagens/botaoMovimentarPersonagem.png")
buttons[2]:rotate ( 360 )
buttons[2].x =  w - 444
buttons[2].y = h - 154
buttons[2].width = 30
buttons[2].height = 35
buttons[2].myName = "down"

buttons[3] = display.newImage("imagens/botaoMovimentarPersonagem.png")
buttons[3]:rotate ( 90 )
buttons[3].x = w - 461
buttons[3].y = h - 175
buttons[3].width = 30
buttons[3].height = 35
buttons[3].myName = "left"

buttons[4] = display.newImage("imagens/botaoMovimentarPersonagem.png")
buttons[4]:rotate ( 270 )
buttons[4].x = w - 428	
buttons[4].y = h - 175
buttons[4].width = 30
buttons[4].height = 35
buttons[4].myName = "right"

local passosX= 0
local passosY = 0

local touchFunction = function (e)
	-- quando há clique    ou clicar e arrastar para o lado
	if e.phase == "began"  or e.phase == "moved" then
		if e.target.myName == "up" then
			passosY = -1.3
			passosX = 0
		elseif e.target.myName == "down" then
			personagemBomberman.personagemEmMovimento:play()
			passosY = 1.3
			passosX = 0
		elseif e.target.myName == "right" then
			passosX = 1.3
			passosY = 0
		elseif e.target.myName == "left" then
			passosX = -1.3
			passosY = 0
		end
	-- quando soltar o botão ele para
	else
		personagemBomberman.personagemEmMovimento:pause()

		passosY = 0
		passosX = 0
	end
end
	-- for que adiciona o evento de toque
for i=1, #buttons do
	buttons[i]:addEventListener("touch", touchFunction)
end

-- atualiza o jogo
local update = function ()
	personagemBomberman.personagemEmMovimento.x = personagemBomberman.personagemEmMovimento.x + passosX
	personagemBomberman.personagemEmMovimento.y = personagemBomberman.personagemEmMovimento.y + passosY

end

function personagemBomberman:localizacaoNoMapa()
	return personagemBomberman.personagemEmMovimento.x, personagemBomberman.personagemEmMovimento.y
end

-- executa em vários circulos, ou seja, fica atualizando direto a posição do personagem
Runtime:addEventListener("enterFrame", update)
personagemBomberman.personagemEmMovimento:addEventListener("touch", touchFunction)

return personagemBomberman