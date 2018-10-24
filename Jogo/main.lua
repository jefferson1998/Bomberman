local physics = require "physics"
physics.start()
physics.setGravity(0, 0)
--display.setStatusBar (display.HiddenStatusBar)
--system.setIdleTimer( false ) -- impede a tela de apagar;

--local director = require ("Sources.diretorio")
--director:changeScene("Sources.menu")


--local cenario = require ("Objects.cenario")
local mapa = require("view.mapaView")
--local inimigo = require ("Objects.inimigo")
local personagem = require ("Objects.personagem")

-- local bounds = personagem.contentBounds
-- print( "xMin: ".. bounds.xMin ) -- xMin: 75
-- print( "yMin: ".. bounds.yMin ) -- yMin: 75
-- print( "xMax: ".. bounds.xMax ) -- xMax: 125
-- print( "yMax: ".. bounds.yMax ) -- yMax: 125

local vertices = {-10,0, -10, 16, 10, 16, 10, 0}
physics.addBody( personagem.personagemEmMovimento, "dynamic", {shape = vertices})
personagem.personagemEmMovimento.isFixedRotation = true

local botaoBomba = require("Objects.bomba")
