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
	
	local cenario = require("view.cenario")
	return localGroup
end

return _M