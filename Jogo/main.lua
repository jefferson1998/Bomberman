



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
-- local cenario = require("view.cenario")
local diretorio = require ("Sources.diretorio")
diretorio:changeScene ("Sources.menu")