local _M = {} 

--Principal Function--------------------------------------------------------------------------->
----------------------------------------------------------------------------------------------->
function _M.new()
	--Variables--------------->

	local director = require("Sources.diretorio")

	local w = display.contentWidth -- representa a largura da tela
	local h = display.contentHeight -- altura da tela

	--Functions--------------->

	-- Evento de toque no botão ir para a próxima tela
	local touchEvent
	-- Evento de limpar memória, ou seja, limpar as variáveis
	local freeMemory

	------------------//----------------------------
	
	local localGroup = display.newGroup()
    local settingsGroup = display.newGroup()
	
	local background = display.newRect(localGroup, 0, 0, w, h)
	background.x = w * .5
	background.y = h * .5
	background:setFillColor(255, 255, 255)         


	local button = display.newImageRect(localGroup, "imagens/botaoDoJogo.png", 150, 50 )
	button.x = w *.5 
	button.y = h *.5 
	button.myName = "play"


	touchEvent = function(event)
		local t = event.target
		if t.myName == "play" then 
			freeMemory()
			director:changeScene("Sources.gamePlay")
		end
	end

	freeMemory = function()
		display.remove(localGroup)
		localGroup = nil 
	end

	button:addEventListener("tap", touchEvent )

	return localGroup
end

return _M