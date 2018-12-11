local composer = require( "composer" )
local banco = require "bd.bancoDeDados"
local scene = composer.newScene()
 

function scene:create( event )
 
    local sceneGroup = self.view
    local brackgound = display.newImage("imagens/planoDeFundo.png",display.actualContentWidth * 0.5, display.actualContentHeight * 0.5)  
    local victories =  display.newImage("imagens/vitorias.png",display.actualContentWidth * 0.25, display.actualContentHeight * 0.5)
    local numeroVitorias = display.newText(banco:getVitorias(), display.actualContentWidth * 0.25, display.actualContentHeight * 0.65, "Courier New", 30)
    local defeats =  display.newImage("imagens/derrotas.png",display.actualContentWidth * 0.75, display.actualContentHeight * 0.5)
    local numeroDerrotas = display.newText(banco:getDerrotas(), display.actualContentWidth * 0.75, display.actualContentHeight * 0.65, "Courier New", 30)
    local buttonReturn = display.newImage("imagens/botaoVoltar.png",display.actualContentWidth * 0.055, display.actualContentHeight * 1.0)
    sceneGroup:insert(brackgound)
    sceneGroup:insert(buttonReturn)
    sceneGroup:insert(victories)
    sceneGroup:insert(defeats)
    sceneGroup:insert(numeroVitorias)
    sceneGroup:insert(numeroDerrotas)

    buttonReturn:addEventListener( "touch", scene )
 
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

 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    display.remove( sceneGroup )
 
end
 
scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene