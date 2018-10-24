
local inimigo = display.newCircle(80, 90, 10 )


function inimigo:posicaoInimigo()
	return inimigo.x, inimigo.y
end

return inimigo
