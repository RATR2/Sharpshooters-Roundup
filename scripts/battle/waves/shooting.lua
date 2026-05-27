local Shooting, super = Class(Wave)

function Shooting:onStart()
    -- self.time = 12

    -- Every 0.5 seconds...
    local delay = 1.6

    self.time = 5 + 0.5 + delay

    local soul = Game.battle.soul
    local x, y = soul:getPosition()
    self:spawnBullet("gunshot", x, y, 0, 0, delay)
    self.timer:after(delay, function()
        self.timer:every(1/2, function()
            local soul = Game.battle.soul

            -- Get the attacker's center position
            local x, y = soul:getPosition()

            -- Spawn smallbullet angled towards the player with speed 8 (see scripts/battle/bullets/smallbullet.lua)
            self:spawnBullet("gunshot", x, y, 0, 0)
        end)
    end)
end

function Shooting:update()
    -- Code here gets called every frame

    super.update(self)
end

return Shooting