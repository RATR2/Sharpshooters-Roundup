local FakeCactus, super = Class(Event)

function FakeCactus:init(data)
    super.init(self, data)
end

function FakeCactus:onInteract(player, dir)
    ---@diagnostic disable-next-line: param-type-mismatch
    Game.world:startCutscene(function(cutscene)
        local cactusinspects = Game:getFlag("cactusinspects") or 0
        if cactusinspects == 0 then
            cutscene:text("* A cactus.")
        elseif cactusinspects == 1 then
            cutscene:text("* Something feels weird about this one...")
            cutscene:text("* You just don't quite know what is it...")
        elseif cactusinspects == 2 then
            cutscene:text("* ...?")
            cutscene:text("* This is actually a cardboard\nreplica of a cactus...[wait:1]\n* What is this?!")
        elseif cactusinspects >= 3 then
            cutscene:text("* A cardboard replica of a cactus.")
        end
    end)
end

return FakeCactus