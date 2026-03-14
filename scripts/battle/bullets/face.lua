local Face, super = Class(Bullet)

function Face:init(x, y, dir, speed, bDir)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/face")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
    self.destroy_on_hit = false
    self.inv_timer = 0.1
    self.bRotation = bDir or 0
    self.bSpeed = 5.5

    self.timer = Game.world.timer:every(1/8, function()
        local smallbullet = self.wave:spawnBullet("mini-skull", self.x, self.y, math.rad(self.bRotation), 4)
        smallbullet:setLayer(self.layer - 1)
        smallbullet:setScale(1.7)
        smallbullet.tp = 0.1
        smallbullet.timer = Game.world.timer:after(1.4, function()
            smallbullet:remove()
        end)

        function smallbullet:onRemove()
            Game.world.timer:cancel(self.timer)
        end
    end)
end

function Face:onRemove()
    Game.world.timer:cancel(self.timer)
end

function Face:update()
    -- For more complicated bullet behaviours, code here gets called every update
    self.bRotation = self.bRotation + self.bSpeed * DTMULT

    super.update(self)
end

return Face