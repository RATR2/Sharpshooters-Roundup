local SmallBullet, super = Class(Bullet)

function SmallBullet:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/corcho")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
    self.destroy_on_hit = false
    self.speedRandom = MathUtils.random(0.1, 0.4)
    self.rotRandom = MathUtils.random(-1, 3)
end

function SmallBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update
    self.physics.speed = self.physics.speed - self.speedRandom * DTMULT
    self.rotation = self.rotation + math.rad(self.rotRandom) * DTMULT

    super.update(self)
end

return SmallBullet