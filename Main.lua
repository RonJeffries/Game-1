-- Game-1
-- 20200222 initial plan, make a floor

function setup()
    scene = craft.scene()

    -- Setup camera and lighting
    scene.sun.rotation = quat.eulerAngles(25, 125, 0)

    -- Set the scenes ambient lighting
    scene.ambientColor = color(127, 127, 127, 255)   
    
    allBlocks = blocks()
    
    -- Setup voxel terrain
    scene.voxels:resize(vec3(5,1,5))      
    scene.voxels.coordinates = vec3(0,0,0)    
    scene.voxels:fill("Dirt Grass")
    local m = 5 -- 5
    scene.voxels:box(0,1,0,16*m,1,16*m)
    scene.voxels:fill("Bedrock")
    scene.voxels:box(0,0,0, 16*m,0,16*m)
    
    setupCamera(scene)
end

function setupCamera(scene)
    scene.camera.z = -4
    local cameraSettings = scene.camera:get(craft.camera)
    local fieldOfView = 60
    local ortho = false
    local orthoSize = 5
    cameraSettings.fieldOfView = fieldOfView
    cameraSettings.ortho = ortho
    cameraSettings.orthoSize = orthoSize
end


function update(dt)
    updateCamera(dt, scene)
    scene:update(dt)
end

function updateCamera(dt, scene)
    if CurrentTouch.state == MOVING then 
        CameraX = (CameraX or 0) - CurrentTouch.deltaX * 0.25
        CameraY = (CameraY or 0) - CurrentTouch.deltaY * 0.25
        scene.camera.eulerAngles = vec3(CameraY, CameraX, 0)
        scene.camera.position = -scene.camera.forward * 5
    end
end

function draw()
    update(DeltaTime)
    scene:draw()	
end