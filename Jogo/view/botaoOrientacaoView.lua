local imagemBotao = "imagens/botaoMovimentarPersonagem.png"
local w = display.contentWidth
local h = display.contentHeight
local buttons = {}
local personagemView = cenario:getPersonagem()

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


-- for que adiciona o evento de toque no botoes
for i=1, #buttons do
	buttons[i]:addEventListener("touch", personagemView)
end

function buttons:create()
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

	for i=1, #buttons do
		buttons[i]:addEventListener("touch", personagemView)
	end
end

function buttons:removerEvento()
	if(buttons ~= nil) then
		for i = 1, #buttons do
			buttons[i]:removeEventListener( "touch", buttons)
			buttons[i]:removeSelf()	
		end
	end
end

return buttons