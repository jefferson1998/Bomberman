local _M = {} 

--Variables--------------->

local director = require("Sources.diretorio")

--Images------------------>

local background

--Functions--------------->	

local touchEvent
local freeMemory

--Principal Function--------------------------------------------------------------------------->
----------------------------------------------------------------------------------------------->
function _M.new()
	system.activate( "multitouch" )
	local localGroup = display.newGroup()
	local cenarioPorTrasDeTudo = display.newImageRect("imagens/cenario.png", 1000, 600	)
--	local cenario = require ("Objects.cenario")
	local inimigo = require ("Objects.inimigo")
	local personagem = require ("Objects.personagem")
	local botaoBomba = require("Objects.bomba")
	

	return localGroup
end

return _M