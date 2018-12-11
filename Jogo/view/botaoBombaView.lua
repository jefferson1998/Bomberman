local widget = require "widget"
local bombaView = cenario:getBombaView()
local bombaModel = bombaView:getBombaPersonagem()
local botaoView = display.newImage("imagens/botaoBomba.png")
local bombaAtiva = false
local tempoDaBomba

local w = display.contentWidth
local h = display.contentHeight
local eixoX, eixoY

botaoView.x = w - 35
botaoView.y = h - 150


function botaoView:timer(event)
    if (event.source.params.bombaDoPersonagem ~= nil) then
        event.source.params.bombaDoPersonagem.duracao = event.source.params.bombaDoPersonagem.duracao - 1
        if  event.source.params.bombaDoPersonagem.duracao == 0 then
            event.source.params.bombaDoPersonagem.bombaSprite:removeSelf()
            cenario:getExplosao():explodir(cenario:getEstadoJogo(), event.source.params.bombaDoPersonagem)
            event.source.params.bombaDoPersonagem = nil
            botaoView:setBombaAtiva(false)
       	end  
    end 
end

function botaoView:touch(evento)
	if evento.phase == "began" then
		if bombaAtiva == false then
			bomba = bombaView:newBombaPersonagem(cenario:getMapa():localizarNoMapa(cenario:getPersonagem():getSprite()))
			botaoView:setBombaAtiva(true)
			if tempoDaBomba == nil then
        		tempoDaBomba = timer.performWithDelay( 1000, botaoView, 0)
    		end
		    tempoDaBomba.params = {bombaDoPersonagem = bomba} 
			cenario:getPersonagem():getSprite():toFront()
			bomba.bombaSprite:play() 
		end
	end
end

function botaoView:setBombaAtiva(condicao)
	bombaAtiva = condicao
end

botaoView:addEventListener("touch", botaoView)

function botaoView:removerEvento()
	botaoView:removeEventListener( "touch", botaoView )
	botaoView:removeSelf()
end

function botaoView:setBombaAtiva(condicao)
	bombaAtiva = condicao
end

function botaoView:create()
	botaoView = display.newImage("imagens/botaoBomba.png")
	botaoView.x = w - 35
	botaoView.y = h - 150
	function botaoView:touch(evento)
		if evento.phase == "began" then
			if bombaAtiva == false then
				bomba = bombaView:newBombaPersonagem(cenario:getMapa():localizarNoMapa(cenario:getPersonagem():getSprite()))
				botaoView:setBombaAtiva(true)
				if tempoDaBomba == nil then
	        		tempoDaBomba = timer.performWithDelay( 1000, botaoView, 0)
	    		end
			    tempoDaBomba.params = {bombaDoPersonagem = bomba} 
				cenario:getPersonagem():getSprite():toFront()
				bomba.bombaSprite:play() 
			end
		end
	end
	
	function botaoView:setBombaAtiva(condicao)
		bombaAtiva = condicao
	end

	function botaoView:timer(event)
	    if (event.source.params.bombaDoPersonagem ~= nil) then
	        event.source.params.bombaDoPersonagem.duracao = event.source.params.bombaDoPersonagem.duracao - 1
	        if  event.source.params.bombaDoPersonagem.duracao == 0 then
	            event.source.params.bombaDoPersonagem.bombaSprite:removeSelf()
	            cenario:getExplosao():explodir(cenario:getEstadoJogo(), event.source.params.bombaDoPersonagem)
	            event.source.params.bombaDoPersonagem = nil
	            botaoView:setBombaAtiva(false)
	       	end  
	    end 
	end
	botaoView:addEventListener("touch", botaoView)
end

return botaoView