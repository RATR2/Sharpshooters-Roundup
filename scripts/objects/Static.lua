---@class Static : Object
---@diagnostic disable-next-line: lowercase-global
Static, super = Class(Object)

function Static:init()
    super.init(self)
    self.sprite = Sprite("objects/static")
    self.sprite:play(1/30, true)
    self.playback = 0
    self.timeleft = 0
    self.lenght = 0
    self:setState("NOTHING")
end

function Static:getState()
    return self.state
end

function Static:setState(state)
    self.state = state
end

function Static:update()
    super.update(self)

    local state = self:getState()
    if state == "PLAYING" then
        if self.playback >= self.lenght then
            local sound = self.sound
            local stopSound = self.stopSound
            
            if sound and stopSound then
                sound:stop()
            end

            self.sprite:remove()
            self:setState("NOTHING")
        end
        self.playback = self.playback + DT
    end
end

function Static:trigger(lenght, stopSound)
    lenght = lenght or 0.3
    if stopSound == nil then stopSound = true end
    print("important!!", sound, stopSound)
    self.lenght = lenght
    self.stopSound = stopSound
    self.playback = 0
    -- self.sprite:setLayer(self:getLayer() - 2)
    Game.stage:addChild(self.sprite)
    self:setState("PLAYING")
    self.sound = Assets.playSound("static")
end

return Static