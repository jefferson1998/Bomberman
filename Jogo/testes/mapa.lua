local mapa = {
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
	local X = (math.ceil(math.fmod(80, larguraMapa) / 32))
    local Y = (math.ceil(math.fmod(83, alturaMapa) / 32))
    return X,Y
end

function mapa:boardToPixel(posBoardX, posBoardY)
	return 16 + (32 * (posBoardY - 1)), 16 + (32 * (posBoardX - 1))
end

return mapa