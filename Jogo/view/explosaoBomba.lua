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
			if(estado[origemX + i][origemY] == 2 or estado[origemX + i][origemY] == 4) then
				print("IF 1.1")
				cenario:getPersonagem():morrer(estado[origemX + i][origemY])
				cenario:getInimigo():morrer(estado[origemX + i][origemY])
			end
			estado:setEstado(objBomba:getId(), origemX + i, origemY)
			print("Setei o Estado")
		else
			baixo = false
		end
		

		if(cima == true and estado[origemX - i][origemY] ~= 0 and estado[origemX - i][origemY] ~= nil) then
			print("IF 2")
			if(estado[origemX - i][origemY] == 2 or estado[origemX - i][origemY] == 4) then
				print("IF 2.1")
				cenario:getPersonagem():morrer(estado[origemX - i][origemY])
				cenario:getInimigo():morrer(estado[origemX - i][origemY])
			end
			estado:setEstado(objBomba:getId(), origemX - i, origemY)
			print("Setei o Estado")
		else 
			cima = false
		end
		
		if(direita == true and estado[origemX][origemY + i] ~= 0 and estado[origemX][origemY + i] ~= nil) then
			print("IF 3")
			if(estado[origemX][origemY + i] == 2 or estado[origemX][origemY + i] == 4) then
				print("IF 3.1")
				cenario:getPersonagem():morrer(estado[origemX][origemY + i])
				cenario:getInimigo():morrer(estado[origemX][origemY + i])
			end
			estado:setEstado(objBomba:getId(), origemX, origemY + i)
			print("Setei o Estado")
		else
			direita = false
		end
		
		-- if(esquerda == true and estado[origemX][origemY - i] ~= 0 and estado[origemX][origemY - i] ~= nil) then
		-- 	print("IF 4")
		-- 	if(estado[origemX][origemY - i] == 2 or estado[origemX][origemY - i] == 4) then
		-- 		print("IF 4.1")
		-- 		cenario:getPersonagem():morrer(estado[origemX][origemY - i])
		-- 	end
		-- 	estado:setEstado(objBomba:getId(), origemX, origemY - i)
		-- 	print("Setei o Estado")
		-- else
		-- 	esquerda = false
		-- end
		
	end

		print(estado:mostrarTabuleiroDoJogo())

		explosaoBomba:fimExplosao()

		
end

function explosaoBomba:onTimer(estado)
	for i = 1, #estado do
		for j = 1, #estado[i] do
			if(estado[i][j] == 3) then
				estado[i][j] = 1
			end
		end
	end
	print(estado:mostrarTabuleiroDoJogo())
end

function explosaoBomba:fimExplosao()
	timer.performWithDelay( 1500, explosaoBomba, 1)
end
-- function botaoView:percorrerAreaDaBomba(inimigo)
-- 	inimigo.x, inimigo.y = inimigo:posicaoInimigo()
-- 	for i=1,7  do
-- 		if math.floor(bombaView.sprite.x) == inimigo.x or math.floor(bombaView.sprite.y) == inimigo.y then
-- 			return true
-- 		end
-- 		bombaView.sprite.y = bombaView.sprite.y + 1
-- 	end

-- 	for i=1,7 do
-- 		if bombaView.sprite.x == inimigo.x or bombaView.sprite.y == inimigo.y then
-- 			return true
-- 		end
-- 		bombaView.sprite.y = bombaView.sprite.y - 1
-- 	end

-- 	for i=1,7 do
-- 		if bombaView.sprite.x == inimigo.x or bombaView.sprite.y == inimigo.y then
-- 			return true
-- 		end
-- 		bombaView.sprite.x = bombaView.sprite.x + 1
-- 	end

-- 	for i=1,7 do
-- 		if bombaView.sprite.x == inimigo.x or bombaView.sprite.y == inimigo.y then
-- 			return true
-- 		end
-- 		bombaView.sprite.x = bombaView.sprite.x - 1
-- 	end

-- end






return explosaoBomba