local _M = {} 

--Variables--------------->

local director = require("Sources.diretorio")

local w = display.contentWidth -- representa a largura da tela
local h = display.contentHeight -- altura da tela


--Images------------------>

local background

--Functions--------------->	

local touchEvent
local freeMemory

--Principal Function--------------------------------------------------------------------------->
----------------------------------------------------------------------------------------------->
function _M.new()
	local localGroup = display.newGroup()
	
	local cenarioPorTrasDeTudo = display.newImageRect("imagens/cenario.png", 1000, 600	)
	--local cenario = require ("Objects.cenario")
	local personagem = require ("Objects.personagem")
	local botaoBomba = require("Objects.bomba")

	local physics = require("physics")
	physics.start()
	local lime = require("lime.lime")

	display.setStatusBar( display.HiddenStatusBar )
	 function loadMap(tmx)
			-- Load the map into our instance of lime
		map = lime.loadMap(tmx)

		-- Tell lime to create the visual aspect of the world
		visual = lime.createVisual(map)

		--Tell lime to create the physics bodies needed for the world
		local physical = lime.buildPhysical(map)
	end	

	loadMap("imagens/Mapa1.tmx")



	
	function getCharacterInMotion()
		return personagem.onOrientationChange();
	end

	function getMoverBombermanDown()
		return personagem.touch();
		-- body
	end



	
	return localGroup
end

return _M