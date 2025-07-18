local Cactus, super = Class(Event)

-- note to devs, this is not finished don't remove code on "room1" yet
-- disregard top comment.

function Cactus:init(data)
    super.init(self, data)
end

function Cactus:onInteract(player, dir)
    ---@diagnostic disable-next-line: param-type-mismatch
    Game.world:startCutscene(function(cutscene)
    local inspectedCactuses = Game:getFlag("cactuses") or {}
    local cactusFound = false
    local cactusid = Cactus.object_id
    for _,cactus in ipairs(inspectedCactuses) do
        if cactusid == cactus then
            cactusFound = true
        end
    end
    if not cactusFound then
        table.insert(inspectedCactuses,cactusid)
    end
    local cactusinspects = Game:getFlag("cactusinspects") or 0
    local inspects = #inspectedCactuses
    print(inspects)
    if inspects <= 2 then
        cutscene:text("* Just a cactus.")
    elseif inspects >= 3 and inspects < 6 then
        cutscene:text("* A cactus...")
    elseif inspects == 6 then
        cutscene:text("* Is it really a cactus?")
    elseif inspects >= 7 and inspects < 10 then
        cutscene:text("* Just[wait:2] a cactus...")
    elseif inspects >= 10 and inspects < 14 then
        cutscene:text("* Cactus...")
    elseif inspects == 14 then
        if cactusinspects == 0 then
            cutscene:text("* ?!![wait:5] There are $150 Dark Dollars in here...[wait:4]\n* What is this?")
            Assets.playSound("item")
            cutscene:text("(50 Dark Dollars was added to your Money Hole.)")
            Game.money = Game.money + 150
        elseif cactusinspects == 1 then
            cutscene:text("* Suprisingly,[wait:4] there was 50 Dark Dollars on this cactus...")
            Assets.playSound("item")
            cutscene:text("(50 Dark Dollars was added to your Money Hole.)")
            Game.money = Game.money + 50
        elseif cactusinspects == 2 then
            Assets.playSound("moss_fanfare")
            cutscene:text("* Congratulations![wait:20]\nyou got nothing...")
            local kris = cutscene:getCharacter("kris")
            if kris ~= nil then
            local krisparty = kris:getPartyMember() or nil
                if krisparty ~= nil then
                    krisparty.title = "Cactus Inspector\nInspects all the cactus\non the room randomly."
                end
            end
        end
        inspectedCactuses = {}
        Game:setFlag("cactusinspects", cactusinspects + 1)
    else
        cutscene:text("* ...")
    end
    --cutscene:text("* Actually this seems to be\ncactus "..(event.data.properties.cactusID or -1)..".")
    Game:setFlag("cactuses", inspectedCactuses)
    end)
end

return Cactus