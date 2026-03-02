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
    self:addEnemy("friend")

    --- Uncomment this line to add another!
    self:addEnemy("tv")
end

return Cowboy