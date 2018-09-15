local inimigo = display.newCircle(50, 50, 15)
inimigo:setFillColor(0.1,0.5,0.7)

function inimigo:posicaoInimigo()
	return inimigo.x, inimigo.y
end

return inimigo