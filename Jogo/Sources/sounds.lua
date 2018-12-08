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

    local function onSwitchPress( event )
        local switch = event.target
        if switch.isOn == false then
             audio.pause()
        else 
            audio.resume()
        end
        -- print( "Switch with ID '"..switch.id.."' is on: "..tostring() )
    end

    local sceneGroup = self.view
    local brackgound = display.newImage("imagens/planoDeFundo.png",display.actualContentWidth * 0.5, display.actualContentHeight * 0.5)   
    local textSon = display.newImage("imagens/son.png",display.actualContentWidth * 0.1, display.actualContentHeight * 0.2)
    local son = composer.getVariable("son")
    local widget = require( "widget" )
    local buttonReturn = display.newImage("imagens/botaoVoltar.png",display.actualContentWidth * 0.055, display.actualContentHeight * 1.0)
    buttonReturn:addEventListener( "touch", scene )
    -- Handle press events for the checkbox

    -- Create the widget
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


    -- Code here runs when the scene is first created but has not yet appeared on screen
 
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
    -- Code here runs prior to the removal of scene's view
    display.remove(sceneGroup)
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