local Lasso, super = Class(Bullet)

function Lasso:init(x, y, dir, speed, duration)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/lasso")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
    self.drawLine = true
    self.timer = Game.world.timer:after(duration, function()
        self.drawLine = false
    end)
    self.destroy_on_hit = false
end

function Lasso:update()
    -- For more complicated bullet behaviours, code here gets called every update
    self.physics.speed = self.physics.speed - 0.3 * DTMULT

    super.update(self)
end

function Lasso:draw()
    super.draw(self)
    if not self.drawLine then return end
    local x, y = self:screenToLocalPos(self.init_x, self.init_y)
    love.graphics.setLineWidth(1.3)
    local move = 17
    -- print(self.physics.direction)
    if self.physics.direction > 0 then
        move = move * -1
    end
    love.graphics.line(x, y, 0 + self:getScaledWidth() / 4 - move, 0 + self:getScaledHeight() / 4)
end

function Lasso:onRemove()
    Game.world.timer:cancel(self.timer)
end

return Lasso