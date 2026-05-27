function Mod:init()
    print("Loaded "..self.info.name.."!")

    -- HookSystem.hook(love, "keypressed", function(orig, key)
    --     orig(key)
    --     self:keypressed(key)
    -- end)
end

function Mod:onTextSound(sound, node)
    if sound == "tenna" then
        local rng = MathUtils.randomInt(1,11)
        Assets.playSound(
            "voice/tenna" .. rng
        )
        
        self.voice_timer = 6
    end
end