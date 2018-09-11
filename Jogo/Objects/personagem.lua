local cX = display.contentCenterX
local cY = display.contentCenterY
local w = display.contentWidth
local h = display.contentHeight

-- cria o sistema de rotação
local o = system.orientation;

local widget = require "widget"

local optionsBombermanDeFrente =
{
	frames =
	{
		--Frame 1
		{
			x = 2,
			y = 1,
			width = 18,
            height = 31
		},

		--Frame 2
		{
			x = 25,
			y = 1,
			width = 18,
            height = 31
		},
		--Frame 3
		{
			x = 48,
			y = 1,
			width = 18,
            height = 31
		},
		--Frame 4
		{
			x = 72,
			y = 1,
			width = 18,
            height = 31
		},

		-- Frame 5
		{
			x = 92,
			y = 1,
			width = 18,
            height = 31
		},

		-- Frame 6
		{
			x = 112,
			y = 1,
			width = 18,
            height = 31
		},

		-- Frame 7
		{
			x = 132,
			y = 1,
			width = 18,
            height = 31
		},

		-- Frame 8
		{
			x = 151,
			y = 1,
			width = 18,
            height = 31
		}

	},
	-- tamanho total da imagem
	sheetContentWidth = 172,
    sheetContentHeight = 32
}

local optionsBombermanDeTras =
{
	frames =
	{
		--Frame 1
		{
			x = 2,
			y = 1,
			width = 16,
            height = 25
		},

		--Frame 2
		{
			x = 23,
			y = 1,
			width = 16,
            height = 25
		},
		--Frame 3
		{
			x = 45,
			y = 1,
			width = 16,
            height = 25
		},
		--Frame 4
		{
			x = 69,
			y = 1,
			width = 16,
            height = 25
		},

		-- Frame 5
		{
			x = 89,
			y = 1,
			width = 16,
            height = 25
		},

		-- Frame 6
		{
			x = 112,
			y = 1,
			width = 16,
            height = 25
		},

		-- Frame 7
		{
			x = 132,
			y = 1,
			width = 16,
            height = 25
		},

		-- Frame 8
		{
			x = 150,
			y = 1,
			width = 16,
            height = 25
		}

	},
	-- tamanho total da imagem
	sheetContentWidth = 169,
    sheetContentHeight = 26
}

local animacaoBombermanFrente = graphics.newImageSheet( "imagens/frentePersonagemBranco.png", optionsBombermanDeFrente)
local animacaoBombermanTras = graphics.newImageSheet( "imagens/trasPersonagemBranco.png", optionsBombermanDeTras)


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

local animacaoBombermanTras_run = {
	name = "normalRun",
	start = 2,
	count = 7,
	time = 800,
	loopCount = 0
}

local animacaoDoBomberPosicao = display.newSprite( animacaoBombermanFrente, animacaoBombermanFrente_run)
animacaoDoBomberPosicao.x = cX
animacaoDoBomberPosicao.y = cY


local animacaoDoBomberDeTrasPosicao = display.newSprite( animacaoBombermanTras, animacaoBombermanTras_run)
--animacaoDoBomberDeTrasPosicao.x = cX
--animacaoDoBomberDeTrasPosicao.y = cY

animacaoDoBomberPosicao.isVisible = false;

local animacaoDoBomberParada = display.newImage("imagens/bomberInicaParado.png")
animacaoDoBomberParada.x = cX
animacaoDoBomberParada.y = cY




-- processo de rotação, verifica se o tipo é diferente de cima ou baixo, ou seja, ele sempre vira para o lado direito/esquerto
-- então ele rotaciona
local function onOrientationChange(e)
	if(e.type ~= "faceUp" or e.type ~= "faceDown") then
		animacaoDoBomberPosicao.play = e.type;
		animacaoDoBomberPosicao.rotation = animacaoDoBomberPosicao.rotation - e.delta;
		
	end
end

local personagemBomberman = {
	movimentacao = animacaoDoBomberPosicao:play(),
	rotacao = onOrientationChange
}

Runtime:addEventListener("orientation", onOrientationChange)


local buttons = {}

buttons[1] = display.newImage("imagens/buttonDown.png")
buttons[1].x = w - 445
buttons[1].y = h - 200
buttons[1].width = 20
buttons[1].height = 25
buttons[1].myName = "up"

buttons[2] = display.newImage("imagens/buttonUp.png")
buttons[2].x =  w - 445
buttons[2].y = h - 150
buttons[2].width = 20
buttons[2].height = 25
buttons[2].myName = "down"

buttons[3] = display.newImage("imagens/buttonRight.png")
buttons[3].x = w - 470
buttons[3].y = h - 175
buttons[3].width = 20
buttons[3].height = 25
buttons[3].myName = "left"

buttons[4] = display.newImage("imagens/buttonLeft.png")
buttons[4].x = w - 420
buttons[4].y = h - 175
buttons[4].width = 20
buttons[4].height = 25
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
		
			animacaoDoBomberParada.isVisible = false;
			animacaoDoBomberPosicao.isVisible = true;
			animacaoDoBomberPosicao:play()
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
		animacaoDoBomberPosicao.isVisible = false;
		animacaoDoBomberParada.isVisible = true;
		animacaoDoBomberPosicao:play()

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
	animacaoDoBomberPosicao.x = animacaoDoBomberPosicao.x + passosX
	animacaoDoBomberPosicao.y = animacaoDoBomberPosicao.y + passosY
	animacaoDoBomberParada.x = animacaoDoBomberParada.x + passosX
	animacaoDoBomberParada.y = animacaoDoBomberParada.y + passosY

end

-- executa em vários circulos, ou seja, fica atualizando direto a posição do personagem
Runtime:addEventListener("enterFrame", update)
animacaoDoBomberParada:addEventListener("touch", touchFunction)