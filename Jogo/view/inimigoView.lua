local framesBomberman = require "view.frames"
local passosX, passosY = 0, 0
local imagem = "imagens/framesDoInimigo.png"
local posicaoAtualX, posicaoAtualY, posAntX, posAntY
local imagemVencedor = "imagens/inimigoVencedor.png"

local movimentacao = nil
local posXpixel, posYpixel = 0, 0

local inimigo = {id = 4}

local caminho = {}

function inimigo:newInimigo()
	inimigo.animacaoBomberman_run, inimigo.animacaoBomberman = framesBomberman:personagemBomberman(imagem)
	inimigo.bombermanSprite = display.newSprite( inimigo.animacaoBomberman, inimigo.animacaoBomberman_run);
	inimigo.bombermanSprite.x = 400
	inimigo.bombermanSprite.y = 272
	inimigo.bombermanSprite.anchorY = 0.85

	-- local vertices = {-10,0, -10, 16, 10, 16, 10, 0}
	-- physics.addBody( inimigo.bombermanSprite, "dynamic", {shape = vertices})
	-- inimigo.bombermanSprite.isFixedRotation = true
	-- physics.setGravity( 0, 0 )

	return inimigo.bombermanSprite
end

local inimigoGrafico = inimigo:newInimigo()
local posX, posY = cenario:getMapa():pixelToBoard(cenario:getMapa():localizarNoMapa(inimigoGrafico))
function inimigo:determinarOrientacao(caminhoX, caminhoY)

	local orientacao = ""

	if (posX - caminhoX == 0 and posY - caminhoY > 0) then
		orientacao = "esquerda"
	end
	if (posX - caminhoX == 0 and posY - caminhoY < 0) then
		orientacao = "direita"
	end
	if (posX - caminhoX > 0 and posY - caminhoY == 0) then
		orientacao = "cima"
	end
	if (posX - caminhoX < 0 and posY - caminhoY == 0) then
		orientacao = "baixo"
	end

	posX,posY = caminhoX, caminhoY
	return orientacao

end

function inimigo:mover(px, py)

	-- print (px, py)

	posXpixel, posYpixel = cenario:getMapa():boardToPixel(px, py)
	local orientacao = self:determinarOrientacao(px, py)

	if	orientacao == "cima" then
		inimigoGrafico:setSequence( "framesTrasRun" )
		inimigoGrafico:play()
		passosY = -1.3
		passosX = 0

	elseif orientacao == "baixo" then
		inimigoGrafico:setSequence( "framesFrenteRun" )
		inimigoGrafico:play()
		passosY = 1.3
		passosX = 0
	
	elseif orientacao == "direita" then
		inimigoGrafico:setSequence( "framesLadoDireitoRun" )
		inimigoGrafico:play()
		passosY = 0
		passosX = 1.3

	elseif orientacao == "esquerda" then
		inimigoGrafico:setSequence( "framesLadoEsquerdoRun" )
		inimigoGrafico:play()
		passosY = 0
		passosX = -1.3
	end

end

local function compare(no1, no2)
	if (no1.G < no2.G) then
		return true
	end
	return false
end
local pegarCaminho = true
function inimigo:enterFrame()
	
	if(posXpixel and posYpixel)then

		if(pegarCaminho == true) then
			caminho = getAEstrela():getCaminho()
			table.sort(caminho, compare)
		end

		if(#caminho > 0)then

			self:mover(caminho[1].px, caminho[1].py)
			-- print (#caminho)

			if (math.floor(math.abs(inimigoGrafico.x - posXpixel)) <= 1.4 and math.floor(math.abs(inimigoGrafico.y - posYpixel)) <= 1.4) then

				table.remove(caminho, 1)
				-- passosX = 0
				-- passosY = 0
				-- inimigoGrafico:setFrame(1)
				-- inimigoGrafico:pause()

			else
				--print (math.abs(inimigoGrafico.x - posXpixel), math.abs(passosX), math.abs(inimigoGrafico.y - posYpixel), math.abs(passosY))

				local posicaoXAtualNoMapa, posicaoYAtualNoMapa = cenario:getMapa():pixelToBoard(cenario:getMapa():localizarNoMapa(inimigoGrafico))
		
				inimigoGrafico.x = inimigoGrafico.x + passosX
				inimigoGrafico.y = inimigoGrafico.y + passosY

				local novaPosicaoX, novaPosicaoY = cenario:getMapa():pixelToBoard(cenario:getMapa():localizarNoMapa(inimigoGrafico))

				if(novaPosicaoX ~= posicaoXAtualNoMapa or novaPosicaoY ~= posicaoYAtualNoMapa) then
					if(cenario:getEstadoJogo()[novaPosicaoX][novaPosicaoY] == 3) then
						inimigo:morrer(inimigo.id)
					end
					cenario:getEstadoJogo():atualizarEstado(inimigo)
				end
			end
		else
			passosX = 0
			passosY = 0
			inimigoGrafico:setFrame(1)
			inimigoGrafico:pause()
			pegarCaminho = false
			cenario:getEstadoJogo():pegarCaminho()
		end
	end
	-- pegarCaminho = true
end

function inimigo:posicao()
	return inimigoGrafico.x , inimigoGrafico.y
end

function inimigo:getId()
		return inimigo.id
end

function inimigo:getSprite()
	return inimigoGrafico
end

function inimigo:pegarCaminho()
	pegarCaminho = true
end

function inimigo:spriteVencedor(spriteBomberman)
	local posX, posY = spriteBomberman.x, spriteBomberman.y
	--timer.cancel( movimentacao )
	display.remove( spriteBomberman )
	inimigo.animacaoVencedor_run, inimigo.animacaoVencedor = framesBomberman:animacaoVencedor(imagemVencedor)
	inimigo.vencedorSprite = display.newSprite( inimigo.animacaoVencedor, inimigo.animacaoVencedor_run)
	inimigo.vencedorSprite.x = posX
	inimigo.vencedorSprite.y = posY
	inimigo.vencedorSprite.anchorY = 0.85


	return inimigo.vencedorSprite
end

function inimigo:morrer(id)
	if(id == 4) then
		-- print( "INIMIGO MORTO" )
		--timer.cancel( movimentacao )
		cenario:removerEventos()
		display.remove(inimigo:getSprite())
	end
end

local function compare(no1, no2)
	if (no1.G < no2.G) then
		return true
	end
	return false
end

function inimigo:timer(event)
	local rota = event.source.param
	index = index + 1
	self:mover(rota[index].px, rota[index].py)
end

function inimigo:run()
	print ("Rodando o Run no inimigo")

	caminho = getAEstrela():getCaminho()
	table.sort(caminho, compare)
	-- index = 1

	-- if (movimentacao) then
	-- 	timer.cancel(movimentacao)
	-- end

	-- print ("Tamanho Caminho: " ..tostring(#caminho))
	-- if(#caminho ~= 0)then
	-- 	self:mover(caminho[index].px, caminho[index].py)
		
	-- 	if(#caminho == 1) then
	-- 		self:mover(caminho[index].px, caminho[index].py)
	-- 	else
	-- 		movimentacao = timer.performWithDelay( 450, inimigo, #caminho - 1)
	-- 		movimentacao.param = caminho
	-- 	end
	-- end
end

cenario:getEstadoJogo():atualizarEstado(inimigo)

return inimigo
