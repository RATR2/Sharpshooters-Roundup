---@class Tv : Object
---@diagnostic disable-next-line: lowercase-global
Tv, super = Class(Object)

function Tv:init(x, y)
    super.init(self)
    self.sprite = Sprite("objects/tv", x, y)
    self.sprite:setScale(0.7)
    local w, h = self.sprite:getScaledSize()
    self.text = Text("", x + w / 2, y + h / 2)
    self:addChild(self.sprite)
    self:addChild(self.text)
end

-- function Tv:update()
--     super.update(self)
--     local w, h = self.sprite:getSize()
--     self.text:setPosition(w / 2, h / 2)
-- end

return Tv