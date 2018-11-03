local frames = {}

function frames:personagemBomberman(imagem)
	local frames = 
{
	width = 24,
	height = 35,
	numFrames = 32
}
print (imagem.height)
-- faz a animação acontecer: star - determina de que recorte deve começar
	--count determina até quanto deve contar
	--time é o tempo em milisegundos
	--loopCount determina deverá repetir a animação
local animacaoBomberman_run = {
	{
		name = "framesFrenteRun",
		start = 1,
		count = 7,
		time = 650,
		loopCount = 0

	},

	{
		name = "framesTrasRun",
		frames = {9,10,11,12,13,14,15},
		time = 650,
		loopCount = 0
	},

	{
		name = "framesLadoDireitoRun",
		frames = {17,18,19,20,21,22,23},
		time = 650,
		loopCount = 0
	},

	{
		name = "framesLadoEsquerdoRun",
		frames = {32,31,30,29,28,27,26,25},
		time = 650,
		loopCount = 0
	},


}
	return animacaoBomberman_run, graphics.newImageSheet( imagem, frames)

end

function frames:tempoBomba(imagem)
	
	local frames = {

		width = 29,
		height = 29,
		numFrames = 7
	
	}

	local animacaoTempoBomba_run = {
			name = "framesTempoRum",
			start = 1,
			count = 7,
			time = 5000,
			loopCount = 1
		}
	

	return animacaoTempoBomba_run, graphics.newImageSheet(imagem, frames)

end

function frames:animacaoVencedor(imagem)

	local frames = 
	{
		width = 24,
		height = 48,
		numFrames = 5
	}

	local animacaoVencedor_run = {
		name = "framesVencedorRun",
		start = 1,
		count = 5,
		time = 650,
		loopCount = 0,

	}
	print("VENCEDOR")
	return animacaoVencedor_run, graphics.newImageSheet(imagem, frames)
end

function frames:explosaoBomba(imagem)
	-- body
end

return frames