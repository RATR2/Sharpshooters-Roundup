---@class DesertBush : Object
---@diagnostic disable-next-line: lowercase-global
DesertBush, super = Class(Object)

function DesertBush:init(x, y, duration, speedX, speedY, speed)
    speed = speed or 1
    super.init(self, x, y)
    
    self.elapsed = 0
    self.duration = duration or 0.6
    self.speedX = speedX
    self.speedY = speedY
    self.speed = speed or 1

    self.sprite = Sprite("objects/bush")
    self.sprite:play(1/8, true)
    self:addChild(self.sprite)
    -- print("DESERT BUSH INIT")
end

function DesertBush:update()
    super.update(self)
    self:move(self.speedX, self.speedY, self.speed)
    self.elapsed = self.elapsed + DT
    self.rotation = self.rotation - self.elapsed / 10
    self.sprite.alpha = self.sprite.alpha * self.alpha

    if self.elapsed >= self.duration then
        -- print("DESERT BUSH REMOVED")
        self:remove()
    end
end

return DesertBush