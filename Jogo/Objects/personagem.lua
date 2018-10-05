local cX = display.contentCenterX
local cY = display.contentCenterY
local w = display.contentWidth
local h = display.contentHeight

-- cria o sistema de rotação

local widget = require "widget"

local frames = require "view.frames"

local personagemView = require ("view.personagemView")

local personagemBomberman = {
	personagemEmMovimento = personagemView:newPersonagem()
}

personagemBomberman.anchorX = 0.5
personagemBomberman.anchorY = 0.25

local imagemBotao = "imagens/botaoMovimentarPersonagem.png"

local buttons = {}


-- BOTAO CIMA
buttons[1] = display.newImage(imagemBotao)
buttons[1].anchorX = 0.5
buttons[1].anchorY = 0.0
buttons[1]:rotate ( 180 )
buttons[1].x = w * 0.07
buttons[1].y = h * 0.5
buttons[1].width = 30
buttons[1].height = 35
buttons[1].myName = "up"


--BOTAO BAIXO
buttons[2] = display.newImage(imagemBotao)
buttons[2].anchorX = 0.5
buttons[2].anchorY = 0.0
buttons[2].x = buttons[1].x
buttons[2].y = buttons[1].y
buttons[2].width = 30
buttons[2].height = 35
buttons[2].myName = "down"

--BOTAO ESQUERDA
buttons[3] = display.newImage(imagemBotao)
buttons[3].anchorX = 0.5
buttons[3].anchorY = 0.0
buttons[3]:rotate ( 90 )
buttons[3].x = buttons[1].x
buttons[3].y = buttons[1].y
buttons[3].width = 30
buttons[3].height = 35
buttons[3].myName = "left"

--BOTAO DIREITA
buttons[4] = display.newImage(imagemBotao)
buttons[4].anchorX = 0.5
buttons[4].anchorY = 0.0
buttons[4]:rotate ( 270 )
buttons[4].x = buttons[1].x
buttons[4].y = buttons[1].y
buttons[4].width = 30
buttons[4].height = 35
buttons[4].myName = "right"

local passosX = 0
local passosY = 0
local sequencia = ""
function touchFunction(e)
	-- quando há clique ou clicar e arrastar para o lado
	if e.phase == "began" or e.phase == "moved" then
		if e.target.myName == "up" then

			personagemBomberman.personagemEmMovimento:setSequence( "framesTrasRun" )
			personagemBomberman.personagemEmMovimento:play()
			passosY = -1.3
			passosX = 0
		elseif e.target.myName == "down" then
			personagemBomberman.personagemEmMovimento:setSequence( "framesFrenteRun" )
			personagemBomberman.personagemEmMovimento:play()
			passosY = 1.3
			passosX = 0
		elseif e.target.myName == "right" then
			personagemBomberman.personagemEmMovimento:setSequence( "framesLadoDireitoRun" )
			personagemBomberman.personagemEmMovimento:play()
			passosX = 1.3
			passosY = 0
		elseif e.target.myName == "left" then
			personagemBomberman.personagemEmMovimento:setSequence( "framesLadoEsquerdoRun" )
			personagemBomberman.personagemEmMovimento:play()
			passosX = -1.3
			passosY = 0
		end
	-- quando soltar o botão ele para
	elseif (e.phase == "ended" or e.phase == "canceled") then
		passosX = 0
		passosY = 0
		personagemBomberman.personagemEmMovimento:setFrame(1)
		personagemBomberman.personagemEmMovimento:pause()
		-- print(math.floor(personagemBomberman.personagemEmMovimento.x / 32))
		-- print(personagemBomberman.personagemEmMovimento.x / 32)
	end
end
	-- for que adiciona o evento de toque no botoes
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