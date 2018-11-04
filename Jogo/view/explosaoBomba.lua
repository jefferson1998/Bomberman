local estado = cenario:getEstadoJogo()
local imagens = display.newGroup( )

local explosaoCentro = "imagens/explosaoCentro.png"
local explosaoCorpo = "imagens/explosaoCorpo.png"
local explosaoPonta = "imagens/explosaoPonta.png"

local explosaoBomba = {
	duracao = 2
}

function explosaoBomba:explodir(objBomba, estado)
	local origemX, origemY = cenario:getMapa():pixelToBoard(cenario:getMapa():localizarNoMapa(objBomba:getSprite()))
	print (origemX,origemY)

	local cima, baixo, direita, esquerda = true, true, true, true
	
	for i = 1, cenario:getBombaView():getBombaModel().tamanho do
			print("CHEGUEI AKI ______________________________"..cenario:getBombaView():getBombaModel().tamanho)

		
		if(baixo == true and estado[origemX + i][origemY] ~= 0 and estado[origemX + i][origemY] ~= nil) then
			print("IF 1")
			if(estado[origemX + i][origemY] == 2) then
				cenario:getPersonagem():morrer(estado[origemX + i][origemY])
			elseif (estado[origemX + i][origemY] == 4) then
				cenario:getInimigoView():morrer(estado[origemX + i][origemY])
			end
			estado:setEstado(objBomba:getId(), origemX + i, origemY)
			print("Setei o Estado")
		else
			baixo = false
		end
		

		if(cima == true and estado[origemX - i][origemY] ~= 0 and estado[origemX - i][origemY] ~= nil) then
			print("IF 2")
			if(estado[origemX - i][origemY] == 2) then
				cenario:getPersonagem():morrer(estado[origemX - i][origemY])
			elseif (estado[origemX - i][origemY] == 4) then
				cenario:getInimigoView():morrer(estado[origemX - i][origemY])
			end
			estado:setEstado(objBomba:getId(), origemX - i, origemY)
			print("Setei o Estado")
		else 
			cima = false
		end
		
		if(direita == true and estado[origemX][origemY + i] ~= 0 and estado[origemX][origemY + i] ~= nil) then
			print("IF 3")
			if(estado[origemX][origemY + i] == 2) then
				cenario:getPersonagem():morrer(estado[origemX][origemY + i])
			elseif (estado[origemX][origemY + i] == 4) then
				cenario:getInimigoView():morrer(estado[origemX][origemY + i])
			end
			estado:setEstado(objBomba:getId(), origemX, origemY + i)
			print("Setei o Estado")
		else
			direita = false
		end
		
		if(esquerda == true and estado[origemX][origemY - i] ~= 0 and estado[origemX][origemY - i] ~= nil) then
			print("IF 4")
			if(estado[origemX][origemY - i] == 2) then
				cenario:getPersonagem():morrer(estado[origemX][origemY - i])
			elseif (estado[origemX][origemY - i] == 4) then
				cenario:getInimigoView():morrer(estado[origemX][origemY - i])
			end
			estado:setEstado(objBomba:getId(), origemX, origemY - i)
			print("Setei o Estado")
		else
			esquerda = false
		end
	end
	local explosaoSprite = explosaoBomba:pintarExplosao(origemX, origemY, estado)
	explosaoBomba:fimExplosao(origemX, origemY, explosaoSprite)
	print(estado:mostrarTabuleiroDoJogo())
end

function explosaoBomba:timer(event)
	print ("resetando o estado")
	
	local posX, posY = event.source.params.posicaoX, event.source.params.posicaoY

	local cima, baixo, direita, esquerda = true, true, true, true

	for i = 0, cenario:getBombaView():getBombaModel().tamanho do

		if(baixo == true and estado[posX + i][posY] ~= 0 and estado[posX + i][posY] ~= nil) then
			if(estado[posX + i][posY] == 3) then 
				estado:setEstado(1, posX + i, posY)
			end
		else
			baixo = false
		end
		if(cima == true and estado[posX - i][posY] ~= 0 and estado[posX - i][posY] ~= nil) then
			if(estado[posX - i][posY] == 3) then 
				estado:setEstado(1, posX - i, posY)
			end
		else 
			cima = false
		end

		if(direita == true and estado[posX][posY + i] ~= 0 and estado[posX][posY + i] ~= nil) then
			if(estado[posX][posY + i] == 3) then 
				estado:setEstado(1, posX, posY + i)
			end
		else
			direita = false
		end
		
		if(esquerda == true and estado[posX][posY - i] ~= 0 and estado[posX][posY - i] ~= nil) then
			if(estado[posX][posY - i] == 3) then 
				estado:setEstado(1, posX, posY - i)
			end
		else
			esquerda = false
		end
	end
	display.remove(event.source.params.spriteExplosao)
	event.source.params.spriteExplosao = nil
end

function explosaoBomba:fimExplosao(posX, posY, sprite)
	local tempo = timer.performWithDelay(1500, explosaoBomba, 1)
	tempo.params = {posicaoX = posX, posicaoY = posY, spriteExplosao = sprite}
	print "Chamada a funcao fimExplosao"
end

function explosaoBomba:pintarExplosao(x, y, estado)
	local imagensBomba = display.newGroup( )

	local cima, baixo, direita, esquerda = true, true, true, true
	
	local explosao = audio.loadSound("sons/explosion.mp3")
	audio.play(explosao, {channel = 1, duration = 3000})

	for i = 0, cenario:getBombaView():getBombaModel().tamanho do
		if (i == 0) then
			local centroDaExplosao = display.newImage(explosaoCentro)
			centroDaExplosao.x, centroDaExplosao.y = cenario:getMapa():boardToPixel(x, y)
			imagensBomba:insert(centroDaExplosao)
		else
			if(baixo == true and estado[x + i][y] ~= 0 and estado[x + i][y] ~= nil) then
				if(estado[x + i][y] == 3) then
					if(i == cenario:getBombaView():getBombaModel().tamanho) then
						local pontaDaExplosaoBaixo = display.newImage(explosaoPonta)
						pontaDaExplosaoBaixo.x, pontaDaExplosaoBaixo.y = cenario:getMapa():boardToPixel(x + i, y)
						pontaDaExplosaoBaixo.rotation = 90
						imagensBomba:insert(pontaDaExplosaoBaixo)
					else
						local corpoDaExplosaoBaixo = display.newImage(explosaoCorpo)
						corpoDaExplosaoBaixo.x, corpoDaExplosaoBaixo.y = cenario:getMapa():boardToPixel(x + i, y)
						corpoDaExplosaoBaixo.rotation = 90
						imagensBomba:insert(corpoDaExplosaoBaixo)
					end
				end
			else
				baixo = false
			end
			if(cima == true and estado[x - i][y] ~= 0 and estado[x - i][y] ~= nil) then
				if(estado[x - i][y] == 3) then
					if(i == cenario:getBombaView():getBombaModel().tamanho) then
						local pontaDaExplosaoCima = display.newImage(explosaoPonta)
						pontaDaExplosaoCima.x, pontaDaExplosaoCima.y = cenario:getMapa():boardToPixel(x - i, y)
						pontaDaExplosaoCima.rotation = 270
						imagensBomba:insert(pontaDaExplosaoCima)
					else
						local corpoDaExplosaoCima = display.newImage(explosaoCorpo)
						corpoDaExplosaoCima.x, corpoDaExplosaoCima.y = cenario:getMapa():boardToPixel(x - i, y)
						corpoDaExplosaoCima.rotation = 270
						imagensBomba:insert(corpoDaExplosaoCima)
					end
				end
			else
				cima = false
			end
			if(direita == true and estado[x][y + i] ~= 0 and estado[x][y + i] ~= nil) then
				if(estado[x][y + i] == 3) then
					if(i == cenario:getBombaView():getBombaModel().tamanho) then
						local pontaDaExplosaoDireita = display.newImage(explosaoPonta)
						pontaDaExplosaoDireita.x, pontaDaExplosaoDireita.y = cenario:getMapa():boardToPixel(x, y + i)
						imagensBomba:insert(pontaDaExplosaoDireita)
					else
						local corpoDaExplosaoDireita = display.newImage(explosaoCorpo)
						corpoDaExplosaoDireita.x, corpoDaExplosaoDireita.y = cenario:getMapa():boardToPixel(x, y + i)
						imagensBomba:insert(corpoDaExplosaoDireita)
					end
				end
			else
				direita = false
			end
			if(esquerda == true and estado[x][y - i] ~= 0 and estado[x][y - i] ~= nil) then
				if(estado[x][y - i] == 3) then
					if(i == cenario:getBombaView():getBombaModel().tamanho) then
						local pontaDaExplosaoEsquerda = display.newImage(explosaoPonta)
						pontaDaExplosaoEsquerda.x, pontaDaExplosaoEsquerda.y = cenario:getMapa():boardToPixel(x, y - i)
						pontaDaExplosaoEsquerda.rotation = 180
						imagensBomba:insert(pontaDaExplosaoEsquerda)
					else
						local corpoDaExplosaoEsquerda = display.newImage(explosaoCorpo)
						corpoDaExplosaoEsquerda.x, corpoDaExplosaoEsquerda.y = cenario:getMapa():boardToPixel(x, y - i)
						corpoDaExplosaoEsquerda.rotation = 180
						imagensBomba:insert(corpoDaExplosaoEsquerda)
					end
				end
			else
				esquerda = false
			end
		end
	end
	return imagensBomba
end

return explosaoBomba