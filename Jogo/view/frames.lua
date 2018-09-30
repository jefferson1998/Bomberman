local frames = {}

function frames:personagemBomberman(imagem)
	local frames = 
{
		width = 16,
		height = 37,
		numFrames = 31

}
-- faz a animação acontecer: star - determina de que recorte deve começar
	--count determina até quanto deve contar
	--time é o tempo em milisegundos
	--loopCount determina deverá repetir a animação
local animacaoBomberman_run = {
	{
		name = "framesFrenteRun",
		start = 1,
		count = 7,
		time = 800,
		loopCount = 0

	},

	{
		name = "framesTrasRun",
		frames = {9,10,11,12,13,14,15},
		time = 800,
		loopCount = 0
	},

	{
		name = "framesLadoDireitoRun",
		frames = {17,18,19,20,21,22,23},
		time = 800,
		loopCount = 0
	},

	{
		name = "framesLadoEsquerdoRun",
		frames = {25,26,27,28,29,30,31},
		time = 800,
		loopCount = 0
	},


}
	return animacaoBomberman_run, graphics.newImageSheet( imagem, frames)

end


return frames
