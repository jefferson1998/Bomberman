local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- create()
function scene:create( event )
 
    composer.removeScene("Sources.gamePlay")
    local sceneGroup = self.view
    system.activate( "multitouch" )

    local restart = display.newImage("imagens/restartJogo.png", display.contentCenterX, display.contentCenterY * 0.8)
    restart.id = "restart"
    local menu = display.newImage("imagens/menuJogo.png", display.contentCenterX, display.contentCenterY * 1.4)
    menu.id = "menu"
    restart:addEventListener( "touch", scene )
    menu:addEventListener( "touch", scene )
    sceneGroup:insert(restart)
    sceneGroup:insert(menu)    
end

function scene:touch(event)
     if event.phase == "began" then
        local options = {
            effect = "fade",
            time = 250,
        }
        if event.target.id == "restart" then
            composer.gotoScene("Sources.gamePlay", options)
            composer.removeScene("Sources.restart")
        elseif event.target.id== "menu" then
            composer.gotoScene("Sources.menu", options)
            composer.removeScene("Sources.restart")
        end 
    end
end
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    display.remove(sceneGroup)
     
end
 
scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )
 
return scene