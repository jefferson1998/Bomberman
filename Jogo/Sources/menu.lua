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
    buttonPlay.id = "bp"
    local buttonSounds = display.newImage("imagens/sounds.png", display.actualContentWidth * 0.5, display.actualContentHeight * 1.02)
    buttonSounds.id = "bs"
    local buttonRanking = display.newImage("imagens/ranking.png", display.actualContentWidth * 0.5, display.actualContentHeight * 0.85 )
    buttonRanking.id = "br"
    local buttonCredits = display.newImage("imagens/creditos.png", display.actualContentWidth * 0.87, display.actualContentHeight * 1.0)
    buttonCredits.id = "bc"
    local buttonExit = display.newImage("imagens/exit.png", display.actualContentWidth * 0.1, display.actualContentHeight * 1.0)
    buttonExit.id = "be"
    local son = audio.loadSound("sons/Blue_Dot_Sessions_-_04_-_Cupcake_Marshall.mp3")
    -- audio.play(son)

    buttonPlay:addEventListener( "touch", scene)
    buttonSounds:addEventListener( "touch", scene)
    buttonRanking:addEventListener( "touch", scene)
    buttonCredits:addEventListener( "touch", scene)
    buttonExit:addEventListener("touch", scene)

    sceneGroup:insert(background)
    sceneGroup:insert(buttonPlay)
    sceneGroup:insert(buttonRanking)
    sceneGroup:insert(buttonSounds)
    sceneGroup:insert(buttonCredits)
    sceneGroup:insert(buttonExit)



    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
function scene:touch(event)
    if event.phase == "began" then
        local options = {
            effect = "fade",
            time = 250,
        }
        if event.target.id == "bs" then
            composer.setVariable( "son", son )
            composer.gotoScene("Sources.sounds", options)
        elseif event.target.id== "bp" then
            composer.gotoScene("Sources.gamePlay", options)
        elseif event.target.id == "bc" then
            composer.gotoScene("Sources.credit", options)
        elseif event.target.id == "br" then
            composer.gotoScene( "Sources.ranking", options)
        elseif event.target.id == "be" then
            native.requestExit()
        end 
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