local composer = require( "composer" )
 
local scene = composer.newScene()
 

function scene:create( event )

    local function onSwitchPress( event )
        local switch = event.target
        if switch.isOn == false then
             audio.pause()
        else 
            audio.resume()
        end
    end

    local sceneGroup = self.view
    local brackgound = display.newImage("imagens/planoDeFundo.png",display.actualContentWidth * 0.5, display.actualContentHeight * 0.5)   
    local textSon = display.newImage("imagens/son.png",display.actualContentWidth * 0.1, display.actualContentHeight * 0.2)
    local son = composer.getVariable("son")
    local widget = require( "widget" )
    local buttonReturn = display.newImage("imagens/botaoVoltar.png",display.actualContentWidth * 0.055, display.actualContentHeight * 1.0)
    buttonReturn:addEventListener( "touch", scene )

    local onOffSwitch = widget.newSwitch(
        {
            left = display.actualContentWidth * 0.2,
            top = display.actualContentHeight * 0.15,
            style = "onOff",
            id = "onOffSwitch",
            onPress = onSwitchPress
        }
    )
    sceneGroup:insert(brackgound)
    sceneGroup:insert(textSon)
    sceneGroup:insert(buttonReturn)
    sceneGroup:insert(onOffSwitch)


 
end

function scene:touch(event)
    if event.phase == "began" then
        local options = {
            effect = "fade",
            time = 250,
        }
        composer.removeScene("Sources.sounds")
        composer.gotoScene("Sources.menu", options)
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