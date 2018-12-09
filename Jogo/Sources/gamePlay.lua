local composer = require( "composer")
local cenario = require("view.cenario")

local scene = composer.newScene()
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    system.activate( "multitouch" )    
end

-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    if(event.phase == "will") then
		   local play = composer.getVariable("play")
		   if play == true then
		   		cenario:getMapa().isVisible = true
		   end
    end
end
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view

     
end
 

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "destroy", scene )
 
return scene