local tempoDaBomba
local framesBomberman = require "view.frames"
local passosX, passosY = 0, 0
local imagem = "imagens/framesDoInimigo.png"
local posicaoAtualX, posicaoAtualY, posAntX, posAntY
local imagemVencedor = "imagens/inimigoVencedor.png"
local bombaAtiva = false
local movimentacao = nil
local posXpixel, posYpixel = 0, 0

local inimigo = {id = 4}

function inimigo:newInimigo()
	inimigo.animacaoBomberman_run, inimigo.animacaoBomberman = framesBomberman:personagemBomberman(imagem)
	inimigo.bombermanSprite = display.newSprite( inimigo.animacaoBomberman, inimigo.animacaoBomberman_run);
	inimigo.bombermanSprite.x, inimigo.bombermanSprite.y = cenario:getMapa():boardToPixel(9, 13)
	inimigo.bombermanSprite.anchorY = 0.85

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

	posXpixel, posYpixel = cenario:getMapa():boardToPixel(px, py)

	local orientacao = self:determinarOrientacao(px, py)

	if	orientacao == "cima" then
		inimigoGrafico:setSequence( "framesTrasRun" )
		inimigoGrafico:play()
		passosY = -1
		passosX = 0

	elseif orientacao == "baixo" then
		inimigoGrafico:setSequence( "framesFrenteRun" )
		inimigoGrafico:play()
		passosY = 1
		passosX = 0
	
	elseif orientacao == "direita" then
		inimigoGrafico:setSequence( "framesLadoDireitoRun" )
		inimigoGrafico:play()
		passosY = 0
		passosX = 1

	elseif orientacao == "esquerda" then
		inimigoGrafico:setSequence( "framesLadoEsquerdoRun" )
		inimigoGrafico:play()
		passosY = 0
		passosX = -1
	end

end

local function compare(no1, no2)
	if (no1.G < no2.G) then
		return true
	end
	return false
end

local pegarCaminho = true
local caminhoFeito = true
local caminhoParaFazer
function inimigo:enterFrame()
	
	if(posXpixel and posYpixel)then

		if(#caminhoDoInimigo > 0)then
			table.sort( caminhoDoInimigo, compare)
			if(caminhoFeito == true) then

				caminhoParaFazer = caminhoDoInimigo[1]

				self:mover(caminhoParaFazer.px, caminhoParaFazer.py)

			end

			if (inimigoGrafico.x == posXpixel and inimigoGrafico.y == posYpixel) then
				table.remove(caminhoDoInimigo, 1)
				caminhoFeito = true
				passosX = 0
				passosY = 0
				inimigoGrafico:setFrame(1)
				inimigoGrafico:pause()
				caminhoDoInimigo = getAEstrela():getCaminho()
			else
				caminhoFeito = false
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
			inimigoGrafico:setFrame(1)
			inimigoGrafico:pause()

			local posicaoXPersonagem, posicaoYPersonagem = cenario:getMapa():pixelToBoard(cenario:getMapa():localizarNoMapa(cenario:getPersonagem():getSprite()))
			local posicaoXInimigo, posicaoYInimigo = cenario:getMapa():pixelToBoard(cenario:getMapa():localizarNoMapa(inimigoGrafico))
			
			if(math.abs(posicaoXInimigo - posicaoXPersonagem) + math.abs(posicaoYInimigo - posicaoYPersonagem) == 0) then
				inimigo:soltarBomba()
			end
			
			if(aEstrela) then
				caminhoDoInimigo = getAEstrela():getCaminho()
			end
		end
	end
end

function inimigo:restartInimigoGrafico()
	inimigoGrafico = inimigo:newInimigo()
	posX, posY = cenario:getMapa():pixelToBoard(cenario:getMapa():localizarNoMapa(inimigoGrafico))
	cenario:getEstadoJogo():atualizarEstado(inimigo)
	pegarCaminho = true
	caminhoFeito = true
	caminhoParaFazer = nil
	passosX, passosY = 0, 0
	posicaoAtualX, posicaoAtualY, posAntX, posAntY = nil,nil,nil,nil

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

function inimigo:setBombaAtiva(condicao)
	bombaAtiva = condicao
end

function inimigo:pegarCaminho()
	pegarCaminho = true
end

function inimigo:timer(event)
    if event.source.params ~= nil then
        if (event.source.params.bombaDoInimigo ~= nil) then
            event.source.params.bombaDoInimigo.duracao = event.source.params.bombaDoInimigo.duracao - 1
            if  event.source.params.bombaDoInimigo.duracao == 0 then

            	if (posXpixel == inimigoGrafico.x and posYpixel == inimigoGrafico.y) then
            		inimigo:morrer()
            	end

                event.source.params.bombaDoInimigo.bombaSprite:removeSelf()

                cenario:getExplosao():explodir(cenario:getEstadoJogo(), event.source.params.bombaDoInimigo)
                event.source.params.bombaDoInimigo = nil
                inimigo:setBombaAtiva(false)
            end  
        end 
    else
        timer.cancel(tempoDaBomba)
    end
end

function inimigo:soltarBomba()
	if bombaAtiva == false then
		bomba = cenario:getBombaView():newBombaInimigo(inimigoGrafico.x, inimigoGrafico.y)
		bombaAtiva = true
		if tempoDaBomba == nil then
    		tempoDaBomba = timer.performWithDelay( 1000, inimigo, 0)
		end
	    tempoDaBomba.params = {bombaDoInimigo = bomba} 
		inimigoGrafico:toFront()
		bomba.bombaSprite:play()
	end
end

function inimigo:spriteVencedor(spriteBomberman)
	local posX, posY = spriteBomberman.x, spriteBomberman.y
	display.remove( spriteBomberman )
	inimigo.animacaoVencedor_run, inimigo.animacaoVencedor = framesBomberman:animacaoVencedor(imagemVencedor)
	inimigo.vencedorSprite = display.newSprite( inimigo.animacaoVencedor, inimigo.animacaoVencedor_run)
	inimigo.vencedorSprite.x = posX
	inimigo.vencedorSprite.y = posY
	inimigo.vencedorSprite.anchorY = 0.85


	return inimigo.vencedorSprite
end

function inimigo:getSpriteVencedor()
	return inimigo.vencedorSprite
end

function inimigo:morrer(id)
	if(id == 4) then
		cenario.inimigoMorto = true
		cenario:getPersonagem():spriteVencedor(cenario:getPersonagem():getSprite()):play()
		display.remove(inimigo:getSprite())
		cenario:removerEventos(cenario:getPersonagem():getId())
 		cenario.tempo = timer.performWithDelay( 6000, cenario, 1)
	end
end

cenario:getEstadoJogo():atualizarEstado(inimigo)

return inimigo