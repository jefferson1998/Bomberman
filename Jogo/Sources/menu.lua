local _M = {} 

--Principal Function--------------------------------------------------------------------------->
----------------------------------------------------------------------------------------------->
function _M.new()
	--Variables--------------->

	local director = require("Sources.diretorio")

	local w = display.contentWidth -- representa a largura da tela
	local h = display.contentHeight -- altura da tela

	--Functions--------------->

	------------------//----------------------------
	
	local localGroup = display.newGroup()
    local settingsGroup = display.newGroup()
	
	local background = display.newImage(localGroup,"imagens/projeçãoDaTelaInicial.png",display.actualContentWidth * 0.5, display.actualContentHeight * 0.6)    

	local buttonPlay = display.newImage(localGroup, "imagens/start.png", display.actualContentWidth * 0.7, display.actualContentHeight * 0.7 )
	
	function _M:touch(e)
		if e.phase == "began" then
			print("entrei")
			_M:freeMemory()
			director:changeScene("Sources.gamePlay")
		end
	end 

	function _M:freeMemory()
		display.remove(localGroup)
		localGroup = nil 
	end

	buttonPlay:addEventListener("touch", _M )

	return localGroup
end

return _M