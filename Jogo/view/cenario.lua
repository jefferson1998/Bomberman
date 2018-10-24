local buttons = require "view.botaoOrientacaoView"
local personagemView = require "view.personagemView"
local personagemGrafico = personagemView:newPersonagem()
local bomba = require "Objects.bomba"
local passosX = 0
local passosY = 0


local cenario = {}


function cenario:touch(e)
	-- quando há clique ou clicar e arrastar para o lado
	if e.phase == "began" or e.phase == "moved" then
		if e.target.myName == "up" then

			personagemGrafico:setSequence( "framesTrasRun" )
			personagemGrafico:play()
			passosY = -1.3
			passosX = 0

		elseif e.target.myName == "down" then

			personagemGrafico:setSequence( "framesFrenteRun" )
			personagemGrafico:play()
			passosY = 1.3
			passosX = 0

		elseif e.target.myName == "right" then
			
			personagemGrafico:setSequence( "framesLadoDireitoRun" )
			personagemGrafico:play()
			passosX = 1.3
			passosY = 0

		elseif e.target.myName == "left" then

			personagemGrafico:setSequence( "framesLadoEsquerdoRun" )
			personagemGrafico:play()
			passosX = -1.3
			passosY = 0

		end
	-- quando soltar o botão ele para
	elseif (e.phase == "ended" or e.phase == "canceled") then
		
		passosX = 0
		passosY = 0
		personagemGrafico:setFrame(1)
		personagemGrafico:pause()
		-- print(math.floor(personagemGrafico.x / 32))
		-- print(personagemGrafico.x / 32)
	end
end

local update = function ()

	personagemGrafico.x = personagemGrafico.x + passosX
	personagemGrafico.y = personagemGrafico.y + passosY

end

function localizacaoNoMapa()
	return personagemGrafico.x, personagemGrafico.y
end


function personagemGrafico:adicionandoFisica()
		local vertices = {-10,0, -10, 16, 10, 16, 10, 0}
		physics.addBody( personagemGrafico, "dynamic", {shape = vertices})
		personagemGrafico.isFixedRotation = true
end

personagemGrafico:adicionandoFisica()

-- executa em vários circulos, ou seja, fica atualizando direto a posição do personagem
Runtime:addEventListener("enterFrame", update)
personagemGrafico:addEventListener("touch", cenario)


	-- for que adiciona o evento de toque no botoes
for i=1, #buttons do
	buttons[i]:addEventListener("touch", cenario)
end

return cenario