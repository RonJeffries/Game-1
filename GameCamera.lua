-- GameCamera
-- RJ 20200226
-- RJ 20200227 move camera rotation inside; cleanup

GameCamera = class()

function GameCamera:init(entity)
    self.entity = entity
    self.camera = entity:get(craft.camera)
    Camera = self.camera
    self.cameraX = 0
    self.cameraY = 0
    self.cameraZ = 0
    self.cameraDistance = 20
    self.target = vec3(8,0,8)
    --[[local fieldOfView = 60
    local ortho = false
    local orthoSize = 5
    Camera.fieldOfView = fieldOfView
    Camera.ortho = ortho
    Camera.orthoSize = orthoSize ]]--
end

function GameCamera:update(dt)
    if CurrentTouch.state == MOVING then 
        self.cameraX = self.cameraX - CurrentTouch.deltaX * 0.25
        self.cameraY = self.cameraY - CurrentTouch.deltaY * 0.25
    end
    local rotation = quat.eulerAngles(self.cameraX, self.cameraY, self.cameraZ)
    self.entity.rotation = rotation
    self.entity.position = -self.entity.forward * self.cameraDistance + self.target
end
