local composer = require( "composer" )
 
local scene = composer.newScene()

-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    local logo = display.newImage("imagens/abertura.png",display.actualContentWidth * 0.5, display.actualContentHeight * 0.5)
    sceneGroup:insert(logo)

    local options = {
        time = 1500,
    }

    function scene:timer( event )
        composer.gotoScene( "Sources.menu", options )
    end
    --800 time
    timer.performWithDelay( 800, scene )

 
end
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    display.remove(sceneGroup()) 
end
 
 
scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )
 
return scene