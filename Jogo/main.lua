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
physics.addBody( personagem.margemDeFisica, "dynamic")
personagem.margemDeFisica.isFixedRotation = true

local botaoBomba = require("Objects.bomba")
