



-- local bounds = personagem.contentBounds
-- print( "xMax: ".. bounds.xMax ) -- xMax: 125
-- print( "xMin: ".. bounds.xMin ) -- xMin: 75
-- print( "yMax: ".. bounds.yMax ) -- yMax: 125
-- print( "yMin: ".. bounds.yMin ) -- yMin: 75
--director:changeScene("Sources.menu")
--display.setStatusBar (display.HiddenStatusBar)
--local cenario = require ("Objects.cenario")
--local director = require ("Sources.diretorio")
--local inimigo = require ("Objects.inimigo")
--system.setIdleTimer( false ) -- impede a tela de apagar;




--------------------------------------------------
-- 					JOGO						--
--------------------------------------------------
-- local cenario = require("view.cenario")




--------------------------------------------------
-- 					TESTE						--
--------------------------------------------------
local no = require "Objects.no"
local estado = {
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

no:criarNo(estado)

