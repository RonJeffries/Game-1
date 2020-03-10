Creature = class()

local CreatureMaxTime = 300

function Creature:init(entity, x, z, behaviors)
    self.entity = entity
    self.behaviors = behaviors or {self.walk}
    self.time = 0
    entity.x = x
    entity.z = z
    entity.y = 2 -- just above the ground
    entity.model = craft.model("Blocky Characters:Orc")
    entity.scale = vec3(1,1,1)/8
end

function Creature:update(dt)
    local divisor = 100
    local speed = 0
    local turn = 0
    for _,b in pairs(self.behaviors) do
        local tab = b(self)
        speed = speed + (tab.speed or 0)
        turn = turn + (tab.turn or 0)
    end
    local rotor = quat.eulerAngles(0,turn,0)
    self.entity.rotation = self.entity.rotation*rotor
    local move = self.entity.forward
    self.entity.position = self.entity.position + move*speed/divisor
end

function Creature:walk()
    local tab = {speed=1}
    self.time = self.time + 1
    local speed = 200
    if self.time == 100 then
        self.time = 0
        if math.random() < 0.5 then
            tab.turn = 45
        else
            tab.turn = -45
        end
    end
    return tab
end
