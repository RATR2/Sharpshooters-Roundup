---@class MusicWaiter : Object
---@diagnostic disable-next-line: lowercase-global
MusicWaiter, super = Class(Object)
local playback = 0

function MusicWaiter:init()
    super.init(self)
    --print("INIT LOADED")
    self.timeleft = 0
    self.lenght = 0
end

function MusicWaiter:update()
    super.update(self)
    --print("UPDATE LOADED")
    playback = playback + (1 * DT)
    --print(playback)
end

function MusicWaiter:setLenght(lenght)
    self.lenght = lenght - 1
    playback = 0
end

function MusicWaiter:getTime()
    local timeleft = self.lenght - playback
    if timeleft <= 0 then
        print("no time left")
        timeleft = 0
        playback = 0
    end
    return timeleft
end

return MusicWaiter