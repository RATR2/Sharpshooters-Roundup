local DiagonalBullet, super = Class(Bullet)

function DiagonalBullet:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/bullet_diagonal")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
    self:setScale(0.8)
    self.destroy_on_hit = false
    self.timer = Game.world.timer:every(1/20, function()
        local smallbullet = self.wave:spawnBullet("smallbullet", self.x, self.y, math.rad(0), 0)
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

function DiagonalBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update
    self.physics.speed = self.physics.speed + 0.6 * DTMULT
    self.rotation = self.physics.direction + math.rad(-40)

    if self.y >= (Game.battle.arena:getBottom() + self.scale_y * 2) then
        self:remove()
        local impact = self.wave:spawnBullet("impact", self.x, self.y)
        impact.rotation = math.rad(-90)
        Assets.playSound("bomb")
    end

    super.update(self)
end

function DiagonalBullet:onRemove()
    Game.world.timer:cancel(self.timer)
end

return DiagonalBullet