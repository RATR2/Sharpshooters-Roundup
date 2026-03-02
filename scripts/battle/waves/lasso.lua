local Basic, super = Class(Wave)

function Basic:onStart()
    self.rightSide = false
    -- Every 0.33 seconds...
    self.timer:every(1/1.3, function()
        local side = (self.rightSide and 1) or 0 --MathUtils.randomInt(1, 3)
        self.rightSide = not self.rightSide
        -- print(side)

        local x = 0
        local angle = 0

        if side == 1 then
            x = Game.battle.arena:getLeft() - 20
            angle = math.rad(0)
        else
            x = Game.battle.arena:getRight() + 20
            angle = math.rad(180)
        end
        -- Get a random Y position between the top and the bottom of the arena
        local y = Game.battle.soul.y

        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("lasso", x, y, angle, 8, 1.6)
        Assets.playSound("whip_throw_only")

        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = true
    end)
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic