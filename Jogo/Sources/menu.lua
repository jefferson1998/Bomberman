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
    local background = display.newImage("imagens/projeçãoDaTelaInicial.png",display.actualContentWidth * 0.5, display.actualContentHeight * 0.65)    
    local buttonPlay = display.newImage("imagens/start.png", display.actualContentWidth * 0.5, display.actualContentHeight * 0.7 )
    local buttonSounds = display.newImage("imagens/sounds.png", display.actualContentWidth * 0.5, display.actualContentHeight * 1.02)
    local buttonRanking = display.newImage("imagens/ranking.png", display.actualContentWidth * 0.5, display.actualContentHeight * 0.85 )
    local buttonCredits = display.newImage("imagens/creditos.png", display.actualContentWidth * 0.87, display.actualContentHeight * 1.0)
    local son = audio.loadSound("sons/Blue_Dot_Sessions_-_04_-_Cupcake_Marshall.mp3")
    audio.play(son)

    buttonPlay:addEventListener( "touch", scene)
    buttonSounds:addEventListener( "touch", sceneSounds)
    buttonRanking:addEventListener( "touch", sceneRanking)
    buttonCredits:addEventListener( "touch", sceneCredits)
    sceneGroup:insert(background)
    sceneGroup:insert(buttonPlay)
    sceneGroup:insert(buttonRanking)
    sceneGroup:insert(buttonSounds)
    sceneGroup:insert(buttonCredits)

    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
function scene:touch(event)
    if event.phase == "began" then
            print("entrei")
        local options = {
            effect = "fromBottom",
            time = 10,
        }
        composer.gotoScene("Sources.gamePlay", options)
    end
end

function sceneSounds(event)
    if event.phase == "began" then
        local options = {
            effect = "fromBottom",
            time = 10,
        }
        composer.gotoScene("Sources.sounds", options)
    end
end

function sceneRanking(event)
    if event.phase == "began" then
        local options = {
            effect = "fromBottom",
            time = 10,
        }
        composer.gotoScene("Sources.ranking", options)
    end
end

function sceneCredits(event)
    if event.phase == "began" then
        local options = {
            effect = "fromBottom",
            time = 10,
        }
        composer.gotoScene("Sources.credit", options)
    end
end
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
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