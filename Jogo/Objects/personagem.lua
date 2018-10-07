-- cria o sistema de rotação

local widget = require "widget"

local frames = require "view.frames"

local personagemView = require ("view.personagemView")

local buttons = require "view.botaoOrientacaoView"

local personagemBomberman = {
	personagemEmMovimento = personagemView:newPersonagem(),
	margemDeFisica = personagemView:margemDeFisica()
}


local passosX = 0
local passosY = 0

local sequencia = ""

function touchFunction(e)
	-- quando há clique ou clicar e arrastar para o lado
	if e.phase == "began" or e.phase == "moved" then
		if e.target.myName == "up" then
			print(personagemBomberman.margemDeFisica.x)
			personagemBomberman.personagemEmMovimento:setSequence( "framesTrasRun" )
			personagemBomberman.personagemEmMovimento:play()
			passosY = -1.3
			passosX = 0
		elseif e.target.myName == "down" then
			print(personagemBomberman.margemDeFisica.x)
			personagemBomberman.personagemEmMovimento:setSequence( "framesFrenteRun" )
			personagemBomberman.personagemEmMovimento:play()
			passosY = 1.3
			passosX = 0
		elseif e.target.myName == "right" then
			print(personagemBomberman.margemDeFisica.x)
			personagemBomberman.personagemEmMovimento:setSequence( "framesLadoDireitoRun" )
			personagemBomberman.personagemEmMovimento:play()
			passosX = 1.3
			passosY = 0
		elseif e.target.myName == "left" then
			print(personagemBomberman.margemDeFisica.x)
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
	margemDeFisica.x = margemDeFisica.x + passosX
	margemDeFisica.y = margemDeFisica.y + passosY
end

function personagemBomberman:localizacaoNoMapa()
	return personagemBomberman.personagemEmMovimento.x, personagemBomberman.personagemEmMovimento.y
end

-- executa em vários circulos, ou seja, fica atualizando direto a posição do personagem
Runtime:addEventListener("enterFrame", update)
personagemBomberman.personagemEmMovimento:addEventListener("touch", touchFunction)


return personagemBomberman