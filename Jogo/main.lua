-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

display.setStatusBar (display.HiddenStatusBar)
system.setIdleTimer( false ) -- impede a tela de apagar;

local director = require ("Sources.diretorio")
director:changeScene("Sources.menu")




