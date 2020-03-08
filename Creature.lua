Creature = class()

local CreatureMaxTime = 300

function Creature:init(entity, x, z, behaviors)
    self.entity = entity
    self.behaviors = behaviors or {self.walk}
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
    local speed = 60
    self.time = self.time or CreatureMaxTime
    self.mul = self.mul or 1
    self.time = self.time - 1
    if ( self.time <= 0 ) then
        self.mul = -self.mul
        self.time = 2*CreatureMaxTime
    end
    self.entity.x = self.entity.x + self.mul*1/speed
    self.entity.z = self.entity.z + self.mul*1/speed
end


