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
    local textGraphics = display.newImage("imagens/graficos.png",display.actualContentWidth * 0.19, display.actualContentHeight * 0.18)
    local graphics = display.newImage("imagens/nomeDosDesigns.png",display.actualContentWidth * 0.69, display.actualContentHeight * 0.27)
    local textDesenvolpers = display.newImage("imagens/desenvolvedores.png",display.actualContentWidth * 0.235, display.actualContentHeight * 0.53)
    local desenvolvedores = display.newImage("imagens/desenvolvedor.png",display.actualContentWidth * 0.735, display.actualContentHeight * 0.53)
    -- local database =  display.newImage("imagens/database.png",display.actualContentWidth * 0.19, display.actualContentHeight * 0.75)
    -- local testSoftware = display.newImage("imagens/testsoft.png",display.actualContentWidth * 0.275, display.actualContentHeight * 0.95)
    local buttonReturn = display.newImage("imagens/botaoVoltar.png",display.actualContentWidth * 0.055, display.actualContentHeight * 1.0)
    buttonReturn:addEventListener( "touch", scene )
    sceneGroup:insert(brackgound)
    sceneGroup:insert(textGraphics)
    sceneGroup:insert(graphics)
    sceneGroup:insert(textDesenvolpers)
    sceneGroup:insert(desenvolvedores)
    -- sceneGroup:insert(database)
    -- sceneGroup:insert(testSoftware)
    sceneGroup:insert(buttonReturn)

    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end

-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    sceneGroup.isVisible = true
end

function scene:touch(event)
    if event.phase == "began" then
        local options = {
            effect = "fade",
            time = 250,
        }
        composer.removeScene("Sources.credit")
        composer.gotoScene("Sources.menu", options)
    end
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