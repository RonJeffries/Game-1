-- GameCamera
-- RJ 20200226
-- RJ 20200227 move camera rotation inside; cleanup

GameCamera = class()

function GameCamera:init(entity)
    self.entity = entity
    self.camera = entity:get(craft.camera)
    self.rx = 0
    self.ry = 0
    self.rz = 0
    self.distance = 20
    self.target = vec3(8,0,8)
    self.camera.ortho = false
    self.camera.orthoSize = 5
    self.camera.fieldOfView = 60
end

function GameCamera:update(dt)
    if CurrentTouch.state == MOVING then 
        self.rx = self.rx - CurrentTouch.deltaY * 0.25 -- note XY inversion
        self.ry = self.ry - CurrentTouch.deltaX * 0.25
    end
    local rotation = quat.eulerAngles(self.rx, self.ry, self.rz)
    self.entity.rotation = rotation
    self.entity.position = -self.entity.forward * self.distance + self.target
end