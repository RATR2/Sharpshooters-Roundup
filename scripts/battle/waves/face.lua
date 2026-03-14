local Basic, super = Class(Wave)

function Basic:onStart()
    local arena = Game.battle.arena
    local soul = Game.battle.soul
    local transTime = 0.4
    local tY = arena:getBottom() - Game.battle.soul:getScaledHeight()
    self.timer:tween(transTime, soul, {y = tY}, "out-cubic")

    local ax, ay = arena:getPosition()
    local width, height = arena:getSize()

    self.timer:after(transTime / 3, function() 
        local face = self:spawnBullet("face", ax, ay, 0, 0)
        face.alpha = 0
        self.timer:tween(transTime / 3, face, {alpha = 1})
    end)
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic