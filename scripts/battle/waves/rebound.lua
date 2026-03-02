local Aiming, super = Class(Wave)

function Aiming:onStart()
    self.rightSide = false
    -- Every 0.33 seconds...
    self.timer:everyInstant(1/1.2, function()
        local side = (self.rightSide and 1) or 0 --MathUtils.randomInt(1, 3)
        self.rightSide = not self.rightSide
        -- Get all enemies that selected this wave as their attack

        -- Loop through all attackers

        -- Get the attacker's center position
        local x, y = Game.battle.arena:getTopRight()
        if side == 1 then
            x, y = Game.battle.arena:getTopLeft()
        end

        -- Get the angle between the bullet position and the soul's position
        local angle = Utils.angle(x, y, Game.battle.soul:getPosition())

        -- Spawn smallbullet angled towards the player with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        self:spawnBullet("diagonalbullet", x, y, angle, 8)
        Assets.playSound("whip_throw_only")
    end)
end

function Aiming:update()
    -- Code here gets called every frame

    super.update(self)
end

return Aiming