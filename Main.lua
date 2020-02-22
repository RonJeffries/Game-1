-- Game-1
-- 20200222 initial plan, make a floor

function setup()
    scene = craft.scene()
    local e = scene:entity()
end

function update(dt)
    scene:update(dt)
end

function draw()
    update(DeltaTime)
    scene:draw()	
end