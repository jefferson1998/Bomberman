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
	
	for i = 1, cenario:getBombaView():getBombaModel().tamanho do
		if(estado[origemX + i][origemY] ~= 0 and estado[origemX + i][origemY] ~= nil) then
			estado:setEstado(objBomba:getId(), origemX + i, origemY)
			print(estado:mostrarTabuleiroDoJogo())
		end
		if(estado[origemX - i][origemY] ~= 0 and estado[origemX - i][origemY] ~= nil) then
			estado:setEstado(objBomba:getId(), origemX - i, origemY)
			print(estado:mostrarTabuleiroDoJogo())
		end
		if(estado[origemX][origemY + i] ~= 0 and estado[origemX][origemY + i] ~= nil) then
			estado:setEstado(objBomba:getId(), origemX, origemY + i)
			print(estado:mostrarTabuleiroDoJogo())
		end
		if(estado[origemX][origemY - i] ~= 0 and estado[origemX][origemY - i] ~= nil) then
			estado:setEstado(objBomba:getId(), origemX, origemY - i)
			print(estado:mostrarTabuleiroDoJogo())
		end
	end
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