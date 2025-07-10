local Basic, super = Class(Wave)

function Basic:onStart()
    self.time = 12
    -- Every 0.33 seconds...
    self.timer:every(1/2, function()
        -- Our X position is offscreen, to the right
        local x = SCREEN_WIDTH + 80
        -- Get a random Y position between the top and the bottom of the arena
        local spawnLocs = {135,205}
        local y = spawnLocs[love.math.random( #spawnLocs )]

        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("big-bullet", x, y, math.rad(180), 11)

        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = false
    end)
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic