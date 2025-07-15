function Mod:init()
    print("Loaded "..self.info.name.."!")
end

function Mod:onTextSound(sound, node)
    if sound == "tenna" then
        Assets.playSound(Utils.pick{
            "voice/tenna1",
            "voice/tenna2",
            "voice/tenna3",
            "voice/tenna4",
            "voice/tenna5",
            "voice/tenna6",
            "voice/tenna7",
            "voice/tenna8",
            "voice/tenna9",
            "voice/tenna10"
        })
        self.voice_timer = 6
    end
end