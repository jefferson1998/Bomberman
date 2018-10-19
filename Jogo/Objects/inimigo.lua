-- pegar a sprite do inimigo
local inimigoView = require "view.inimigoView"

local inimigoView = display.newCircle( 30, 30, 30 )
inimigoView::setFillColor( 0.5 )

local inimigo = {
		inimigoEmTela = inimigoView	
	}

return inimigo