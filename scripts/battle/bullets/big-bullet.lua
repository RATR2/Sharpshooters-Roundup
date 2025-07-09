local BigBullet, super = Class(Bullet)

function BigBullet:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/big-bullet")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
end

function BigBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update
    if self.x <= 125 then
        self:explode()
    end
    super.update(self)
end

return BigBullet