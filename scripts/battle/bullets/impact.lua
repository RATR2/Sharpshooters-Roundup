local Impact, super = Class(Bullet)

function Impact:init(x, y)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/impact")
    
    self.scale_x = 2
    self.scale_y = 2
    self.lifetime = 1
end

function Impact:update()
    self.lifetime = self.lifetime - 1 * DT
    self.scale_y = self.scale_y + 1 * DT
    -- For more complicated bullet behaviours, code here gets called every update
    if self.lifetime <= 0 then
        self:remove()
    end
    super.update(self)
end

return Impact