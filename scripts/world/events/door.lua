local Door, super = Class(Event)

function Door:init(data)
    self.open = false
    super.init(self, data)
end

function Door:onLoad()
    Game.world:getCharacter("door"):setScale(1,1)
end

function Door:onEnter(player)
    if not self.open then
        Assets.playSound("elecdoor_open")
        self.open = true
        Game.world:getCharacter("door"):setAnimation("opening")
    end
end

function Door:onExit(player)
    if self.open then
        self.open = false
        Game.world:getCharacter("door"):setAnimation("close")
    end
end

return Door