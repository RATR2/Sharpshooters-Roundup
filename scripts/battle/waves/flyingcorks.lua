local Basic, super = Class(Wave)

function Basic:onStart()
    self.time = 8
    self.timer:everyInstant(1/1.2, function()
        -- Our X position is offscreen, to the right
        local x, _ = Game.battle.soul:getPosition()
        x = x + MathUtils.random(Game.battle.arena:getLeft() * -2, Game.battle.arena:getRight() / 2) / 8
        -- Get a random Y position between the top and the bottom of the arena
        local y = Game.battle.arena:getBottom() + 40

        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local spacing = 60
        local scaleRandomMin = 0.3
        local scaleRandom = 0.6
        local bullet = self:spawnBullet("cork", x, y, math.rad(-90), 8)
        Assets.playSound("wing")
        bullet:setScale(MathUtils.random(scaleRandomMin * 4, scaleRandom * 4))
        local smallBullet1 = self:spawnBullet("cork", x + MathUtils.random(spacing * -1, spacing), y, math.rad(-90), 8)
        smallBullet1:setScale(MathUtils.random(scaleRandomMin, scaleRandom))
        local smallBullet2 = self:spawnBullet("cork", x + MathUtils.random(spacing * -1, spacing), y, math.rad(-90), 8)
        smallBullet2:setScale(MathUtils.random(scaleRandomMin, scaleRandom))

        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = true
    end)
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic