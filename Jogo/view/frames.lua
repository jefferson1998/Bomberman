local frames = {}

function frames:personagemBomberman(imagem)
	local frames = 
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
		}

	},
	-- tamanho total da imagem
	sheetContentWidth = imagem.width,
    sheetContentHeight = imagem.height
}
-- faz a animação acontecer: star - determina de que recorte deve começar
	--count determina até quanto deve contar
	--time é o tempo em milisegundos
	--loopCount determina deverá repetir a animação
local animacaoBomberman_run = {
		name = "normalRun",
		start = 1,
		count = 7,
		time = 800,
		loopCount = 0
	}
	return animacaoBomberman_run, graphics.newImageSheet( imagem, frames)
end


return frames
