-- Creature
-- RJ 20200316

Creature = class()

local CreatureMaxTime = 300

function Creature:init(entity, x, z, behaviors)
    self.entity = entity
    self.behaviors = behaviors or {self.avoidPoint, self.avoidEdge}
    self.time = 0
    self.leftEye = vec3(-0.5, 0, 0.5)
    self.rightEye = vec3(0.5, 0, 0.5)
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

function Creature:avoidPoint(point, forceMultiplier)
    local point = point or vec3(7,0,10)
    local forceMultiplier = forceMultiplier or 5
    local tab = {}
    
    local force,direction = self:forceAndDirectionToAvoid(point, forceMultiplier, forceL, forceR)
    tab.turn = direction*force*forceMultiplier
    return tab
end

function Creature:forceAndDirectionToAvoid(point, forceMultiplier, forceL, forceR)
    local eyeL = self:eyePos(self.leftEye)
    local eyeR = self:eyePos(self.rightEye)
    local p = self.entity.position
    p.y = 0
    local d = p:dist(point)
    if d > 2 then return 0,0 end
    local dL = eyeL:dist(point)
    local dR = eyeR:dist(point)
    local forceL = 1/(dL*dL)
    local forceR = 1/(dR*dR)
    return math.max(forceL, forceR), self:sign(forceL-forceR)
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

function Creature:avoidEdge()
    local twist = 21
    local max = 15
    local min = 1
    local tab = {speed=3, turn=0}
    local eyeR = self:eyePos(self.rightEye)
    local eyeL = self:eyePos(self.leftEye)
    tab.turn = tab.turn + self:twistForMax(eyeR.x, eyeL.x, max)*twist
    tab.turn = tab.turn + self:twistForMax(eyeR.z, eyeL.z, max)*twist
    tab.turn = tab.turn + self:twistForMin(eyeR.x, eyeL.x, min)*twist
    tab.turn = tab.turn + self:twistForMin(eyeR.z, eyeL.z, min)*twist
    return tab
end

function Creature:twistForMin(eyeR, eyeL, min)
    if eyeR < min or eyeL < min then
        return self:sign(eyeR-eyeL)
    else
        return 0
    end
end

function Creature:twistForMax(eyeR, eyeL, max)
    if eyeR > max or eyeL > max then
        return self:sign(eyeL-eyeR)
    else
        return 0
    end
end

function Creature:eyePos(eyeRel)
    return self.entity:transformPoint(eyeRel)
end

function Creature:sign(aNumber)
    if aNumber >= 0 then
        return 1
    else 
        return -1
    end
end
