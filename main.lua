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
			x = 17,
			y = 26,
			width = 74,
            height = 176
		},

		--Frame 2
		{
			x = 95,
			y = 26,
			width = 74,
            height = 176
		},
		--Frame 3
		{
			x = 166,
			y = 26,
			width = 74,
            height = 176
		},
		--Frame 4
		{
			x = 240,
			y = 26,
			width = 74,
            height = 176
		},

		-- Frame 5
		{
			x = 314,
			y = 26,
			width = 74,
            height = 176
		}

	},
	-- tamanho total da imagem
	sheetContentWidth = 400,
    sheetContentHeight = 200
}

local animacao = graphics.newImageSheet( "BomberAtualizado.png", options)

local animacao_run = {
	name = "normalRun",
	start = 1,
	count = 5,
	time = 1100,
	loopCount = 0
}

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
