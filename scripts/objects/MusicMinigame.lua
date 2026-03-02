---@class MusicMinigame : Object
---@diagnostic disable-next-line: lowercase-global
MusicMinigame, super = Class(Object)

function MusicMinigame:init()
    super.init(self)
    --print("INIT LOADED")
    self.state = "NOTHING"
end

function MusicMinigame:update()
    super.update(self)
    --print("UPDATE LOADED")
    local playback = self:getTime()
    print(playback)
end

function MusicMinigame:set(audio, inst, song, chart)
    if type(audio) == "string" then audio = Music(audio, 1) end
    if type(inst) == "string" then inst = Music(inst, 1) end
    if type(song) == "string" then song = Music(song, 1) end
    if type(chart) == "string" then chart = JSON.decode(chart) end
    self.audio = audio
    self.inst = inst
    self.song = song
    self.chart = chart
    print(self.chart)
end

function MusicMinigame:getState()
    return self.state
end

function MusicMinigame:getTime()
    return self.audio:tell() or -1
end

function MusicMinigame:_play(callback)
    if self.audio then
        self.audio:setVolume(0.7)
    end
    if self.inst then
        self.inst:setVolume(0.6)
        self.inst:play()
        self.inst:seek(self:getTime())
    end
    if self.song then
        self.song:play()
        self.song:seek(self:getTime())
    end
    self.state = "PLAYING"
    self.callback = callback
end

function MusicMinigame:play(callback)
    self:_play(callback)
    Game.world.timer:after(self.audio:getLenght(), function() self:finish() end)
end

function MusicMinigame:playShort(time, callback)
    self:_play(callback)
    Game.world.timer:after(time, function() self:finish() end)
end

function MusicMinigame:finish()
    if self.callback then
        self:callback()
    end
    if self.audio then
        self.audio:setVolume(1)
    end
    if self.inst then
        self.inst:remove()
    end
    if self.song then
        self.song:remove()
    end
    self.state = "REMOVED"
    self:remove()
end

return MusicMinigame