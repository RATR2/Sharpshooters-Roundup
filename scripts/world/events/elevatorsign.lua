local ElevatorSign, super = Class(Event)

function ElevatorSign:init(data)
    super.init(self, data)
end

function ElevatorSign:onInteract(player, dir)
    ---@diagnostic disable-next-line: param-type-mismatch
    Game.world:startCutscene(function(cutscene)
        local read = Game:getFlag("elevatorsignread") or false
        if not read then
            cutscene:text("* There is a paper here:")
        end
        cutscene:text("\"To use the elevator just press\n one of these buttons")
        cutscene:text("Simple right?[wait:5]\nWell apparently someone kept using it wrong...")
        cutscene:text("Im looking at you Asgore")
        cutscene:text("Don't tell my boss but half of these buttons don't even work")
        if not read then
            cutscene:text("Also there's something weird about the new guy...")
            cutscene:text("Yeah,[wait:5] the new guy, [wait:5]The K...\"[next:true]")
            Game:setFlag("elevatorsignread", true)
        end
        cutscene:text("* ...[wait:5]\n* The rest is irreadable.")
    end)
end

return ElevatorSign