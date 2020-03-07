Creature = class()

function Creature:init(entity, x, z)
    self.entity = entity
    entity.x = x
    entity.z = z
    entity.y = 2 -- just above the ground
    entity.model = craft.model("Blocky Characters:Orc")
    entity.scale = vec3(1,1,1)/8
end

function Creature:update(dt)
    
end


