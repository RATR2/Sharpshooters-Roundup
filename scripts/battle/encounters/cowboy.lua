local Cowboy, super = Class(Encounter)

function Cowboy:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* The Sharpshooter breaks trough!"

    -- Battle music ("battle" is rude buster)
    self.music = "sharpshooter_fight"
    -- Enables the purple grid battle background
    self.background = false

    -- Add the dummy enemy to the encounter
    self:addEnemy("friend", 494, 260)

    --- Uncomment this line to add another!
    self:addEnemy("tv", 578, 333)
end

function Cowboy:getPartyPosition(i)
    if i == 1 then
        return 80, 232
    elseif i == 2 then
        return 138, 278
    else
        return 90, 314
    end
end

return Cowboy