GameCamera = class()

function GameCamera:init(entity)
    self.entity = entity
    self.camera = entity:get(craft.camera)
    Camera = self.camera
    --[[Camera.z = -4
    local fieldOfView = 60
    local ortho = false
    local orthoSize = 5
    Camera.fieldOfView = fieldOfView
    Camera.ortho = ortho
    Camera.orthoSize = orthoSize ]]--
end

function GameCamera:update(dt)
    if CurrentTouch.state == MOVING then 
        CameraX = (CameraX or 0) - CurrentTouch.deltaX * 0.25
        CameraY = (CameraY or 0) - CurrentTouch.deltaY * 0.25
    end
    local rotation = quat.eulerAngles(CameraX or 0, CameraY or 0, CameraZ or 0)
    self.entity.rotation = rotation
    self.entity.position = -self.entity.forward * 20 + vec3(8,0,8)
end
