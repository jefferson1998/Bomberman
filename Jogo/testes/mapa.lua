mapa = {
	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,2,1,1,1,1,1,1,1,1,1,1,0,0},
    {0,0,1,0,1,0,1,0,1,0,1,0,1,0,0},
    {0,0,1,1,1,1,1,1,1,1,1,1,1,0,0},
    {0,0,1,0,1,0,1,0,1,0,1,0,1,0,0},
    {0,0,1,1,1,1,1,1,1,1,1,1,1,0,0},
    {0,0,1,0,1,0,1,0,1,0,1,0,1,0,0},
    {0,0,1,1,1,1,1,1,1,1,1,1,4,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
}

function mapa:mostrarMapa()
	local str = "\n"
	for i=1,#mapa do
		for j=1,#mapa[i] do
			str = str .. mapa[i][j]
		end
		str = str .. "\n"
	end
	return str
end

function mapa:pixelToBoard(px,py)
	local alturaMapa, larguraMapa = 320, 480
	local X = (math.ceil(math.fmod(px, larguraMapa) / 32))
    local Y = (math.ceil(math.fmod(py, alturaMapa) / 32))
    return X,Y
end

function mapa:boardToPixel(posBoardX, posBoardY)
	return 16 + (32 * (posBoardY - 1)), 16 + (32 * (posBoardX - 1))
end

function mapa:verificarQuemEstaNaPosicao( posX, posY )

	-- if (self:localizarNoMapa(cenario:getPersonagem():getSprite()) ~= nil) then
		local personagemX, personagemY = self:pixelToBoard(80,83)
	-- end

	-- if (self:localizarNoMapa(cenario:getInimigoView():getSprite()) ~= nil) then
		local inimigoX, inimigoY = self:pixelToBoard(400,272)
	-- end

	local hasPerson = false
	local hasEnemy = false

	if(personagemX == posX and personagemY == posY) then
		hasPerson = true
	end

	if(inimigoX == posX and inimigoY == posY) then
		hasEnemy = true
	end



	return hasPerson, hasEnemy

end



return mapa