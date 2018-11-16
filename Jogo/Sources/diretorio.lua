local director = {scene = 'main'}
function director:changeScene (moduleName)
    
    local loading 

    local w = display.contentWidth
    local h = display.contentHeight

    local background
    local logo
    local localGroup

    local loadFunction = function()
        localGroup = display.newGroup()



        if self.scene == "main" then
            logo = display.newImage(localGroup, "imagens/abertura.png",display.actualContentWidth * 0.5, display.actualContentHeight * 0.5)
            -- determina o modo de transição da imagem
            transition.from(logo, {delay=300, time=300, alpha=0, xScale=.5, yScale=.5, transition=easing.outExpo})
            transition.from(background, {delay=400, time=300, alpha=0})
        end
    end



    loadFunction()

    loading = function()              
        local loadedModule = package.loaded[self.scene]
            
        if type(loadedModule) == 'table' and type(loadedModule.clean) == 'function' then
            loadedModule.clean()
        end
            
        local group = self.view
            
        if self.scene ~= 'main' and type(loadedModule) == 'table' then
            display.remove(group)
            package.loaded[self.scene], group, loadedModule = nil
            collectgarbage('collect')
        end

        self.scene = moduleName
        require(moduleName).new()

        display.remove(background)
        background = nil

        display.remove(logo)
        logo = nil

        display.remove(localGroup)
        localGroup = nil

        loading = nil
    end

    if self.scene == "main" then
        timer.performWithDelay(2000, loading)
    else 
        transition.from(localGroup, {time=100, alpha=1, onComplete=loading})
    end
end

return director