



-- local bounds = personagem.contentBounds
-- print( "xMax: ".. bounds.xMax ) -- xMax: 125
-- print( "xMin: ".. bounds.xMin ) -- xMin: 75
-- print( "yMax: ".. bounds.yMax ) -- yMax: 125
-- print( "yMin: ".. bounds.yMin ) -- yMin: 75
--director:changeScene("Sources.menu")
--display.setStatusBar (display.HiddenStatusBar)
--local cenario = require ("Objects.cenario")
--local director = require ("Sources.diretorio")
--local inimigo = require ("Objects.inimigo")
--system.setIdleTimer( false ) -- impede a tela de apagar;
-- local cenario = require("view.cenario")
-- local diretorio = require ("Sources.diretorio")
-- diretorio:changeScene ("Sources.menu")
local composer = require ("composer")
composer.gotoScene("Sources.diretorio")

-- local function onKeyEvent( event )
-- 	-- Print which key was pressed down/up to the log.
-- 	local message = "'" .. event.keyName .. "' is " .. event.phase
-- 	print( message )

-- 	-- Display the key event's information onscreen.
-- 	if event.device then
-- 		message = event.device.displayName .. "\n" .. message
-- 	end
-- 	eventTxt.text = message

-- 	-- If the "back" key was pressed, then prevent it from backing out of the app.
-- 	-- We do this by returning true, telling the operating system that we are overriding the key.
-- 	if (event.keyName == "back") then
-- 		return true
-- 	end

-- 	-- Return false to indicate that this app is not overriding the received key.
-- 	-- This lets the operating system execute its default handling of this key.
-- 	return false
-- end

-- -- Add the key callback
-- Runtime:addEventListener( "key", onKeyEvent );

