Creature = class()

local CreatureMaxTime = 300

function Creature:init(entity, x, z, behaviors)
    self.entity = entity
    self.behaviors = behaviors or {self.walk}
    self.angle = 0
    self.time = 0
    self.move = vec2(0,1)
    entity.x = x
    entity.z = z
    entity.y = 2 -- just above the ground
    entity.model = craft.model("Blocky Characters:Orc")
    entity.scale = vec3(1,1,1)/8
end

function Creature:update(dt)
    local dt = dt or DeltaTime
    for _,b in pairs(self.behaviors) do
        b(self)
    end
end

function Creature:walk()
    self.time = self.time + 1
    local speed = 100
    if self.time == 200 then
        self.time = 0
        if math.random() < 0.5 then
            self.angle = 45
        else
            self.angle = -45
        end
        local rotor = quat.eulerAngles(0,-self.angle,0)
        self.entity.rotation = self.entity.rotation*rotor
        self.move = self.move:rotate(math.rad(self.angle))
    end
    self.entity.x = self.entity.x + self.move.x/speed
    self.entity.z = self.entity.z + self.move.y/speed
end


