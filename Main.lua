-- Game-1
-- 20200222 initial plan, make a floor
-- 20200226 camera object works w/o touch

function setup()
    scene = craft.scene()

    -- Setup camera and lighting
    scene.sun.rotation = quat.eulerAngles(25, 125, 0)

    -- Set the scenes ambient lighting
    scene.ambientColor = color(127, 127, 127, 255)   
    
    allBlocks = blocks()
    
    -- Setup voxel terrain
    local m = 1 -- 5
    scene.voxels:resize(vec3(5,1,5))      
    scene.voxels.coordinates = vec3(-16*m,0,-16*m)    
    scene.voxels:fill("Dirt Grass")
    scene.voxels:box(0,2,0,16*m,2,16*m)
    scene.voxels:fill("Bedrock")
    scene.voxels:box(0,0,0, 16*m,0,16*m)
    
    setupCamera(scene)
    
    parameter.number("CameraX", 0, 360)
    parameter.number("CameraY", 0, 360)
    parameter.number("CameraZ", 0, 360)
    parameter.watch("scene.camera.position")
    parameter.watch("scene.camera.forward")

end

function setupCamera(scene)
    scene.camera:add(GameCamera)
end


function update(dt)
    scene:update(dt)
end


function draw()
    update(DeltaTime)
    scene:draw()	
end