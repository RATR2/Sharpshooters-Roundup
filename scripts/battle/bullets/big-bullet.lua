local BigBullet, super = Class(Bullet)

function BigBullet:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/big-bullet")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.scale_x = 6
    self.scale_y = 6
    self.physics.speed = speed
    self.destroy_on_hit = false
end

function BigBullet:update()
    local arena = Game.battle.arena
    self.physics.speed = self.physics.speed + 1 * DTMULT
    -- For more complicated bullet behaviours, code here gets called every update
    if self.x <= (arena:getLeft() + self:getScaledWidth() / 2) then
        self:remove()
        self.wave.timer:tween(0.3, arena, {x = arena.x - self.physics.speed / 1.4}, "out-back")
        Assets.playSound("bomb")
    end
    super.update(self)
end

function BigBullet:onRemove()
    local arena = Game.battle.arena
    if not arena then return end

    self.wave:spawnBullet("impact", arena:getLeft(), self.y)
    local amount = MathUtils.randomInt(1,4)
    local angles = {
        0,
        12,
        -8,
    }
    local rngAngle = MathUtils.random(-5,5)

    for i = 1,amount do
        local angle = angles[i] + rngAngle
        local rngY = MathUtils.random(-4,4)
        self.wave:spawnBullet("smallbullet", arena:getLeft(), self.y + rngY, math.rad(angle), 9)
    end
end

return BigBullet