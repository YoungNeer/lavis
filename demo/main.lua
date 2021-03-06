lavis=require 'lib.lavis'
clove=require 'lib.clove'
clove.requireAll('lib')
clove.requireAll('src')
--since our assets are very HD we don't want to draw to canvas (for this demo) you can try removing this!
lavis.directDraw=true
clove.requireAll('src/states')

gAssets=clove.importAll('assets',true)

--try setting this to true
WIREFRAME_MODE=false
opacity={value=0}

function love.load()
	gStateMachine=StateMachine({
		['start']=function() return StartState() end,
		['menu']=function() return MainMenuState() end,
	})
	gStateMachine:change('start',{just_started=true})
end

function love.update(dt)
	gStateMachine:update(dt)
	flux.update(dt)
	Timer.update(dt)
	lavis.update(dt)
end

function love.draw()
	love.graphics.setBackgroundColor(1-opacity.value,1-opacity.value,1-opacity.value)	
	gStateMachine:render()
	lavis.draw()
end
