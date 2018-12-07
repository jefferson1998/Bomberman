local composer = require( "composer" )
 
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
    local brackgound = display.newImage("imagens/planoDeFundo.png",display.actualContentWidth * 0.5, display.actualContentHeight * 0.5)  
    local victories =  display.newImage("imagens/vitorias.png",display.actualContentWidth * 0.25, display.actualContentHeight * 0.5)
    local defeats =  display.newImage("imagens/derrotas.png",display.actualContentWidth * 0.75, display.actualContentHeight * 0.5)
    local buttonReturn = display.newImage("imagens/botaoVoltar.png",display.actualContentWidth * 0.055, display.actualContentHeight * 1.0)
    sceneGroup:insert(brackgound)
    sceneGroup:insert(buttonReturn)
    sceneGroup:insert(victories)
    sceneGroup:insert(defeats)
    buttonReturn:addEventListener( "touch", scene )
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end

function scene:touch(event)
    if event.phase == "began" then
        local options = {
            effect = "fade",
            time = 250,
        }
        composer.removeScene("Sources.ranking")
        composer.gotoScene("Sources.menu", options)
    end
end

-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    sceneGroup.isVisible = true
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    sceneGroup.isVisible = false

end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    display.remove( sceneGroup )
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