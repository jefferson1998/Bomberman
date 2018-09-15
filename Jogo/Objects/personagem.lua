local cX = display.contentCenterX
local cY = display.contentCenterY
local w = display.contentWidth
local h = display.contentHeight

-- cria o sistema de rotação

local widget = require "widget"
local framesBombermanParaFrente = require "view.frames"

local animacaoBombermanFrente = graphics.newImageSheet( "imagens/frentePersonagemBranco.png", framesBombermanParaFrente:personagemBombermanParaFrente())

-- faz a animação acontecer: star - determina de que recorte deve começar
--count determina até quanto deve contar
--time é o tempo em milisegundos
--loopCount determina deverá repetir a animação
local animacaoBombermanFrente_run = {
	name = "normalRun",
	start = 2,
	count = 7,
	time = 800,
	loopCount = 0
}


local personagemEmMovimento = display.newSprite( animacaoBombermanFrente, animacaoBombermanFrente_run)
personagemEmMovimento.x = cX
personagemEmMovimento.y = cY


personagemEmMovimento.isVisible = false;

--local personagemParado = 
--personagemParado.x = cX
--personagemParado.y = cY

local personagemBomberman = {
	personagemParado = display.newImage("imagens/bomberInicaParado.png", cX, cY),
	personagemEmMovimento = personagemEmMovimento,
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
			personagemBomberman.personagemParado.isVisible = false;
			personagemBomberman.personagemEmMovimento.isVisible = true;
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
		personagemBomberman.personagemEmMovimento.isVisible = false;
		personagemBomberman.personagemParado.isVisible = true;
		personagemBomberman.personagemEmMovimento:play()

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
	personagemBomberman.personagemParado.x = personagemBomberman.personagemParado.x + passosX
	personagemBomberman.personagemParado.y = personagemBomberman.personagemParado.y + passosY

end

function personagemBomberman:localizacaoNoMapa()
	return personagemEmMovimento.x, personagemEmMovimento.y
end

-- executa em vários circulos, ou seja, fica atualizando direto a posição do personagem
Runtime:addEventListener("enterFrame", update)
personagemBomberman.personagemParado:addEventListener("touch", touchFunction)


return personagemBomberman