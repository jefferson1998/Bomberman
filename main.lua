-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local cX = display.contentCenterX
local cY = display.contentCenterY
-- cria o sistema de rotação
local o = system.orientation;

local widget = require "widget"

local options =
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

local animacao = graphics.newImageSheet( "frentePersonagemBranco.png", options)

local animacao_run = {
	name = "normalRun",
	start = 1,
	count = 8,
	time = 1100,
	loopCount = 0
}


local imagemCenario = display.newImageRect("cenario1.png", 350, 270	)

imagemCenario.x = cX
imagemCenario.y = cY
local animacaoDoBomber = display.newSprite( animacao, animacao_run)
animacaoDoBomber.x = cX
animacaoDoBomber.y = cY

animacaoDoBomber:play()

--function funcaoBotao( )
--	 texto.text = "Consegui"
--end



--local botao = widget.newButton{
	--local texto = display.newText( "Bomberman", cX, cY + 160 , "Arial", 40)
--	defaultFile ="botaoDoJogo.png",
--	 x = display.contentCenterX, y = display.contentCenterY + 150,
	 --onRelease = funcaoBotao

--}

-- processo de rotação, verifica se o tipo é diferente de cima ou baixo, ou seja, ele sempre vira para o lado direito/esquerto
-- então ele rotaciona
local function onOrientationChange(e)
	if(e.type ~= "faceUp" or e.type ~= "faceDown") then
		animacaoDoBomber.play = e.type;
		animacaoDoBomber.rotation = animacaoDoBomber.rotation - e.delta;
		--botao.display = e.type;
		--botao.rotation = botao.rotation - e.delta;
	end
end

Runtime:addEventListener("orientation", onOrientationChange)


	-- body
