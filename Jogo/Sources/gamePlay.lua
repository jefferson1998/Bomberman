local composer = require( "composer" )
local cenario = require("view.cenario")
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    system.activate( "multitouch" )

    -- local restart = display.newImage("imagens/restartJogo.png", display.contentCenterX, display.contentCenterY)
    -- local menu = display.newImage("imagens/menuJogo.png", display.contentCenterX, display.contentCenterY* 1.3)
    -- local winner = display.newImage("imagens/loser.png", display.contentCenterX, display.contentCenterY* 0.3)
    -- sceneGroup:insert(restart)
    -- sceneGroup:insert(menu)
    -- Code here runs when the scene is first created but has not yet appeared on screen
    
end

-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    if(event.phase == "will") then
       
    end
end
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene