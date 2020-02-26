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
    parameter.watch("Camera.position")
    parameter.watch("Camera.forward")

end

function setupCamera(scene)
    Camera = scene.camera
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
    end
    scene.camera.eulerAngles = vec3(CameraY, CameraX, CameraZ or 0)
    scene.camera.position = -scene.camera.forward * 20 + vec3(8,0,8)
end

function draw()
    update(DeltaTime)
    scene:draw()	
end