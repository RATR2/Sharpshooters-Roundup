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
end

function BigBullet:update()
    self.physics.speed = self.physics.speed + 1
    -- For more complicated bullet behaviours, code here gets called every update
    if self.x <= Game.battle.arena.left then
        self:explode()
    end
    super.update(self)
end

return BigBullet