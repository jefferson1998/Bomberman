local composer = require( "composer")

local scene = composer.newScene()
 
-- create()
function scene:create( event )
	local cenario = require("view.cenario")
 
    local sceneGroup = self.view
    system.activate( "multitouch" ) 
	print("entrei") 
    if cenario:isRestart() == true then
    	print("entrei no restart")
    	cenario:restart()
	   	cenario:setRestart(false)
	end  
end
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
	-- cenario = nil    
end
 
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "destroy", scene )
 
return scene