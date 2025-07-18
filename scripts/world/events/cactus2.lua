local Cactus2, super = Class(Event)

function Cactus2:init(data)
    super.init(self, data)
end

function Cactus2:onInteract(player, dir)
    ---@diagnostic disable-next-line: param-type-mismatch
    Game.world:startCutscene(function(cutscene)
        local cactusinspects = Game:getFlag("cactusinspects") or 0
        if cactusinspects >= 2 then
            local warned = Game:getFlag("cactuswarned") or false
            if not warned then
                cutscene:text("* We are[wait:5] NOT[wait:8] doing this again.")
                Game:setFlag("cactuswarned",true)
            else
                cutscene:text("* A cactus.")
            end
        else
            cutscene:text("* A cactus.")
        end
    end)
end

return Cactus2