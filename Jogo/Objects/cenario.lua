local imagemCenario = display.newImageRect("imagens/Mapa1.png", 350, 265)

local cX = display.contentCenterX
local cY = display.contentCenterY

imagemCenario.x = cX
imagemCenario.y = cY
local personagem = require ("Objects.personagem")
local physics = require ( "physics" )
	
	physics.start()
	physics.addBody(imagemCenario, "static", {friction = 0, bounce = 0})
	imagemCenario.myName = "cenario"


-- Teste

--physics.addBody(personagem, { density = 3.0, friction = 0.5, bounce = 0.3 })

--physics.addBody(botaoBomba, { density = 3.0, friction = 0.5, bounce = 0.3 })

--local function onLocalCollision(self, event)
--	if ( event.phase == "began" ) then
  --      print( self.myName .. ": collision began with " .. event.other.myName )
 
    --elseif ( event.phase == "ended" ) then
      --  print( self.myName .. ": collision ended with " .. event.other.myName )
   -- end
--end


--personagem.collision = onLocalCollision
--personagem:addEventListener( "collision" )
 
--botaoBomba.collision = onLocalCollision
--botaoBomba:addEventListener( "collision" )