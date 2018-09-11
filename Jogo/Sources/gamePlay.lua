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
	

	return localGroup
end

return _M