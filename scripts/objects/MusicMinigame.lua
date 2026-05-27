---@class MusicMinigame : Object
---@diagnostic disable-next-line: lowercase-global
MusicMinigame, super = Class(Object)

-- State stuff n shit
local state = {}
local self = state

-- Editor settings
self.chart = {}                -- { {track=1, beat=1}, ... }
self.beatSpacing = 70
self.numTracks = 2
self.selectedTrack = 1
self.currentBeat = 1
self.currentSection = 0        -- 0-based
self.beatsPerSection = 4
self.playing = false
self.totalSections = 1         -- number of sections (auto-extended)
self.message = nil             -- temporary UI message
self.messageTimer = 0
self.bpm = 140
self.combo = 0
self.downscroll = true

self.songInstPath = nil
self.instrInstPath = nil
self.instrumentPath = nil

self.strumColors = {
    {97/255, 226/255, 203/255},
    {95/255, 205/255, 228/255},
}

self.extraStrumColors = {
    {
        {321/255, 100/255, 58/255},
        {215/255, 123/255, 186/255},
    },
    {
        {55/255, 148/255, 10/255},
        {251/255, 242/255, 54/255},
    },
}

local hitWindowBeats = 0.8  -- beats around currentBeat

-- Source - https://stackoverflow.com/a/641993
-- Posted by Doub, modified by community. See post 'Timeline' for change history
-- Retrieved 2026-04-11, License - CC BY-SA 3.0

function table.shallow_copy(t)
  local t2 = {}
  for k,v in pairs(t) do
    t2[k] = v
  end
  return t2
end

-- End of atribution lol

local function testPlaySound(sound, play)
    if not sound then return end
    if play then
        if play == "stop" then
            sound:stop()
            return
        end
        local seconds = (self.currentBeat - 1) * (60 / self.bpm)
        sound:seek(seconds)
        sound:play()
    else
        sound:pause()
    end
end

local function playSongMusic(play)
    local goTo = 0
    testPlaySound(self.songInst, play)
    testPlaySound(self.instrumentInst, play)
    testPlaySound(self.instrument, play)
    -- self.songInst:seek(goTo)
    -- self.instrumentInst:seek(goTo)
    -- self.instrument:seek(goTo)
end

-- helper: clamp currentSection into valid range
local function clampSection()
    if self.totalSections < 1 then self.totalSections = 1 end
    if self.currentSection < 0 then self.currentSection = 0 end
    if self.currentSection > self.totalSections - 1 then
        self.currentSection = self.totalSections - 1
    end
end

-- helper: recompute totalSections from chart (useful after import/delete)
function self:recomputeTotalSections()
    local maxBeat = 0
    for _, n in ipairs(self.chart) do
        if n.beat and n.beat > maxBeat then maxBeat = n.beat end
    end
    local needed = math.ceil(maxBeat / self.beatsPerSection)
    self.totalSections = math.max(1, needed)
    clampSection()
end

function self:load()
    self.font = love.graphics.newFont(18)
    self.trackWidth = 100
    self.startX = 200
    self.startY = (self.downscroll and 700) or 250

    self.notesImg = Assets.getTexture("notes/default/note")
    self.notesStrumImg = Assets.getTexture("notes/default/strum")
    self.strumCircleImg = Assets.getTexture("notes/default/circle")
    self.strumRectangleImg = self:createGradient(64, {1, 1, 1})
    self:importJSON(MusicMinigame.chart)

    self.songInst = MusicMinigame.inst -- or love.audio.newSource(self.songInstPath, "stream")
    -- self.instrumentInst = love.audio.newSource(self.instrInstPath, "stream")
    self.instrument = MusicMinigame.instrument -- or love.audio.newSource(self.instrumentPath, "stream")
    playSongMusic(true)
    self.playing = true
    -- self.characterPath = Utils:getPath("characters") .. self.characterPath

    self.player = MusicMinigame.party[1]
    -- sprm:makeLuaSprite(self.player, self.characterPath .. "/banjo")
    -- sprm:centerObject(self.player)
    -- sprm:moveObject(self.player, nil, 160)
    -- sprm:loadFrame(self.player,"hitchord_1")
    -- sprm:loadFrame(self.player,"hitchordright_1")
    -- sprm:setObjectSize(self.player, 3, 3)

    self.bg = Sprite("backgrounds/rodeo")
    self.bg:setLayer(self.player.layer - 2)
    self.bg:setPosition(0, 0)
    Game.battle:addChild(self.bg)
    -- sprm:makeLuaSprite("bg", Assets.getTexture())
    -- sprm:setObjectOrder("bg", 0)
    -- sprm:centerObject("bg")
end

function self:createSections(chart)
    self.sections = {}

    -- Left Side
    --[[ local section1 = self:createSection(chart)
    local colors = self.extraStrumColors[1]
    section1.strums[1].color = colors[1]
    section1.strums[2].color = colors[2]
    section1.outline.color = section1.strums[2].color
    table.insert(self.sections, section1) ]]
    
    -- Middle side
    local section2 = self:createSection(chart, SCREEN_WIDTH / 2 - 40, SCREEN_HEIGHT + SCREEN_HEIGHT / 3 - 35)
    table.insert(self.sections, section2)

    -- Right side
    --[[ local section3 = self:createSection(chart, 520, nil, {tracks = 3})
    local strums = section3.strums
    local singStrumImage = love.graphics.newImage("assets/images/notes/vertical/strum.png")
    for _,strum in pairs(strums) do
        strum.image = singStrumImage
    end

    strums[3].x = strums[2].x
    local distance = math.abs(strums[1].x - strums[3].x)
    strums[2].x = strums[2].x - distance / 2

    local colors = self.extraStrumColors[2]
    section3.strums[1].color = colors[1]
    section3.strums[2].color = colors[2]
    section3.strums[3].color = colors[1]
    section3.outline.color = section3.strums[2].color

    table.insert(self.sections, section3) ]]
end

function self:createSection(chart, startX, startY, extra)
    extra = extra or {}
    local section = {
        strums = self:createStrums(chart, startX, startY, extra),
        chart = table.shallow_copy(chart.chart),
        combo = 0,
        bgColor = {0, 0, 0, 0.5},
        outline = {
            color = self.strumColors[2],
            w = 4,
        },
        linesColor = {1, 1, 1, 0.4},
        downscroll = true,
    }

    -- Set extra note values
    for _,note in pairs(section.chart) do
        note.section = section
    end
    -- print("note " .. tostring((section.chart and section.chart[1].section) or "no notes"))

    return section
end

function self:createStrums(chart, startX, startY, extra)
    startX = startX or self.startX
    startY = startY or self.startY
    extra = extra or {}

    local tracks = extra.tracks or self.numTracks or chart.numTracks

    self.playheadY = startY / 2
    self.tracksXs = {}
    -- love.graphics.line(self.startX, playheadY, self.startX + self.numTracks*self.trackWidth, playheadY)
    for track = 1, tracks do
        local x = startX + (track - 1) * (self.trackWidth / 1.45)
        print(x)
        table.insert(self.tracksXs, x)
    end

    local strums = {}
    for i = 1, tracks do
        local scale = 2
        local strum = {
            image = self.notesStrumImg,
            x = self.tracksXs[i],
            y = self.playheadY,
            rotation = 0,
            scaleX = scale,
            scaleY = scale,
            visible = true,
            color = self.strumColors[i],
            perfectWindow = 0.18,
            flash = {
                active = false,
                timer = 0,
                defaultTimer = 0.1,
                colors = {
                    perfect = {1,1,0},
                    hit = {1,1,1},
                },
            },
            circles = {},
            rectangles = {},
        }

        local flash = strum.flash
        flash.color = flash.colors.hit

        -- W.I.P
        function strum:checkHit()
        end

        function strum:hit()
        end

        function strum:miss()
        end

        table.insert(strums, strum)
    end

    return strums
end

function self:createStrumCircle(strum)
    local circle = {
        strum = strum,
        image = self.strumCircleImg,
        x = strum.x,
        y = strum.y,
        r = 0,
        sx = 3,
        sy = 2.5,
        color = {1, 1, 1, 1},
        timer = 0.2,
    }

    circle.startSX = circle.sx
    circle.startSY = circle.sy

    table.insert(strum.circles, circle)
end

function self:createGradient(height, colors)
    local colors = colors or {}
    local r, g, b = colors[1], colors[2], colors[3]
    local data = love.image.newImageData(1, height)

    for y = 0, height - 1 do
        -- invert so 0 = bottom, 1 = top
        local t = 1 - (y / (height - 1))

        local cr, cg, cb, ca

        local split = 0.1

        if t < split then
            -- bottom half: white → color
            local tt = t / split
            cr = 1 + (r - 1) * tt
            cg = 1 + (g - 1) * tt
            cb = 1 + (b - 1) * tt
            ca = 1
        else
            -- top half: color → transparent
            local tt = (t - split) / (1 - split)
            cr = r
            cg = g
            cb = b
            ca = 1 - tt
        end

        data:setPixel(0, y, cr, cg, cb, ca)
    end

    return love.graphics.newImage(data)
end

function self:createStrumRectangle(strum, extra)
    extra = extra or {}
    local rectangle = {
        strum = extra.strum or strum,
        image = self.strumRectangleImg,
        x = extra.x or strum.x,
        y = extra.y or strum.y,
        r = extra.r or 0,
        sx = extra.sx or 3,
        sy = extra.sy or 2.5,
        color = extra.color or {1, 1, 1, 1},
        timer = extra.timer or 0.2,
        target = extra.target or 2,
    }

    rectangle.startSX = rectangle.sx
    rectangle.startSY = rectangle.sy
    rectangle.w = strum.image:getWidth() * strum.scaleX
    rectangle.h = (strum.image:getHeight() * strum.scaleY) * 6
    rectangle.startW = rectangle.w
    rectangle.startH = rectangle.h

    table.insert(strum.rectangles, rectangle)
end

function self:update(dt)
    if self.playing then
        -- Input
        self:keypressed()

        -- Update strums
        for _,section in pairs(self.sections) do
            local strums = section.strums
            local chart = section.chart

            if strums then
                for _,strum in pairs(strums) do
                    local flash = strum.flash
                    if flash.timer > 0 then
                        flash.timer = flash.timer - dt
                    end

                    if flash.timer <= 0 then
                        flash.active = false
                        -- print("NO FLASH!")
                    end

                    -- Update strum circles
                    local removeCircles = {}
                    local circles = strum.circles
                    for i,circle in ipairs(circles) do
                        local strum = circle.strum
                        circle.timer = circle.timer - dt

                        circle.sx = circle.startSX - circle.timer * 4
                        circle.sy = circle.startSY - circle.timer * 5

                        local sx = circle.image:getWidth() * circle.sx
                        local sy = circle.image:getHeight() * circle.sy

                        circle.x = (strum.x + strum.image:getWidth()) - sx / 2
                        circle.y = (strum.y + strum.image:getHeight()) - sy / 2
                        circle.color[4] = circle.timer * 6

                        if circle.timer <= 0 then
                            table.insert(removeCircles, i)
                        end
                    end

                    local i = 0
                    for _,circle in pairs(removeCircles) do
                        table.remove(circles, circle - i)
                        i = i + 1
                    end

                    -- Update strum rectangles
                    local removeRectangles = {}
                    local rectangles = strum.rectangles
                    for i,rectangle in ipairs(rectangles) do
                        local strum = rectangle.strum
                        
                        rectangle.timer = rectangle.timer - dt
                        local timer = rectangle.timer

                        rectangle.sx = rectangle.startSX - timer * 4
                        rectangle.sy = rectangle.startSY - timer * 5

                        local image = strum.image
                        local sx = image:getWidth() * strum.scaleX
                        local sy = image:getHeight() * strum.scaleY
                        local timerMult = timer * 6

                        if self.sweptNotes then
                            rectangle.x = strum.x + rectangle.w * timerMult
                            rectangle.y = strum.y
                            rectangle.w = rectangle.startW * timerMult
                            rectangle.color[4] = timer * 6
                        elseif self.sweptNotesSimple then
                            rectangle.x = strum.x + rectangle.w / 2
                            rectangle.y = strum.y
                            rectangle.w = rectangle.startW * timerMult
                            rectangle.color[4] = timer * 6
                        else
                            -- new width (and height)
                            rectangle.w = rectangle.startW * timerMult
                            rectangle.h = rectangle.startH - rectangle.target * timerMult

                            -- center of the strum
                            local strumCenterX = strum.x + (strum.image:getWidth() * strum.scaleX) / 2
                            local strumCenterY = strum.y + (strum.image:getHeight() * strum.scaleY) / 2

                            -- keep rectangle centered
                            rectangle.x = strumCenterX - rectangle.w / 2
                            rectangle.y = strumCenterY - rectangle.h

                            -- alpha
                            rectangle.color[4] = timer * 5
                        end

                        if timer <= 0 then
                            table.insert(removeRectangles, i)
                        end
                    end

                    local i = 0
                    for _,rectangle in pairs(removeRectangles) do
                        table.remove(rectangles, rectangle - i)
                        i = i + 1
                    end
                end
            end

            local songInst = self.songInst
            if songInst then
                local seconds = songInst:tell()
                self.currentBeat = seconds * (self.bpm / 60) + 1
                self.currentSection = math.floor((self.currentBeat - 1) / self.beatsPerSection)
                for i = #chart, 1, -1 do
                    local note = chart[i]
                    if note.beat < self.currentBeat - hitWindowBeats then
                        self:miss(note)
                        table.remove(chart, i)
                    end
                end
            end
        end
    end
end

function self:draw()
    love.graphics.setFont(self.font)
    love.graphics.setColor(1,1,1)

    for _,section in pairs(self.sections) do
        local scissors
        local strums = section.strums
        local downscroll = section.downscroll
        if strums then
            -- Draw black strums bg and outline
            local firstStrum = strums[1]
            local lastStrum = strums[#strums]
            local distanceX = math.abs(firstStrum.x - lastStrum.x)
            local abs = (downscroll and 0) or love.graphics.getHeight()
            local distanceY = (downscroll and math.abs(abs - lastStrum.y)) or abs - lastStrum.y

            local offset = 4
            local offsetY = 40

            local dwMult = (downscroll and -1) or 1
            local x = firstStrum.x - offset
            local y = ((downscroll and 0) or firstStrum.y) - offsetY * dwMult
            local w = distanceX + lastStrum.image:getWidth() * lastStrum.scaleX + offset * 2
            local h = distanceY + lastStrum.image:getHeight() * lastStrum.scaleY
            local outline = section.outline

            love.graphics.setColor(section.bgColor)
            love.graphics.rectangle("fill", x, y, w, h)

            love.graphics.setColor(outline.color)
            love.graphics.setLineWidth(outline.w)

            love.graphics.rectangle("line", x, y, w, h)

            scissors = {x + outline.w / 2, y + outline.w / 2, w - outline.w, h - outline.w}

            -- Debug code
            --[[ love.graphics.setColor(1, 0, 0)
            love.graphics.rectangle("fill", scissors[1], scissors[2], scissors[3], scissors[4])
            love.graphics.setColor(1, 1, 1) ]]

            love.graphics.setScissor(scissors[1], scissors[2], scissors[3], scissors[4])

            -- Draw lines
            local x2 = x + w
            local spacing = self.beatSpacing
            local dir = (downscroll and -1) or 1

            love.graphics.setColor(section.linesColor)

            local subdivision = 4
            local step = 1 / subdivision

            -- smooth, non-snapping start
            local offset = self.currentBeat % step
            local startBeat = self.currentBeat - offset - 16
            local endBeat = self.currentBeat + 16

            for beat = startBeat, endBeat, step do
                -- same formula as notes
                local beatOffset = (beat - self.currentBeat) * dir
                local lineY = self.playheadY + beatOffset * spacing

                -- detect line types
                local isMainBeat = math.abs(beat - math.floor(beat)) < 0.0001
                local isMeasure = isMainBeat and (math.floor(beat) % 4 == 0)

                if isMeasure then
                    love.graphics.setLineWidth(6)
                elseif isMainBeat then
                    love.graphics.setLineWidth(6)
                else
                    love.graphics.setLineWidth(1)
                end

                if lineY >= y - spacing and lineY <= y + h + spacing then
                    love.graphics.line(x, lineY, x2, lineY)
                end
            end

            love.graphics.setColor(1,1,1)
            love.graphics.setScissor()

            for _,strum in pairs(strums) do
                if strum.visible then
                    -- Draw strum circles
                    local circles = strum.circles
                    local batchSize = #circles
                    if batchSize > 0 then
                        local circlesSpriteBatch = love.graphics.newSpriteBatch(self.strumCircleImg, batchSize)

                        for _,circle in pairs(circles) do
                            circlesSpriteBatch:setColor(circle.color)
                            circlesSpriteBatch:add(circle.x, circle.y, circle.r, circle.sx, circle.sy)
                        end

                        love.graphics.setColor(1,1,1)
                        love.graphics.draw(circlesSpriteBatch)
                        circlesSpriteBatch:clear()
                    end

                    -- Draw strum rectangles
                    local rectangles = strum.rectangles
                    local batchSize = #rectangles
                    if batchSize > 0 then
                        local rectanglesSpriteBatch = love.graphics.newSpriteBatch(self.strumRectangleImg, batchSize)
                        for _,rectangle in pairs(rectangles) do
                            rectanglesSpriteBatch:setColor(rectangle.color)
                            rectanglesSpriteBatch:add(rectangle.x, rectangle.y, rectangle.r, rectangle.w, rectangle.h / 64)
                        end

                        love.graphics.setColor(1,1,1)
                        love.graphics.draw(rectanglesSpriteBatch)
                        rectanglesSpriteBatch:clear()
                    end

                    -- Draw strums
                    love.graphics.setColor(strum.color)
                    local flash = strum.flash
                    if flash.active then
                        love.graphics.setColor(flash.color)
                    end

                    love.graphics.draw(strum.image, strum.x, strum.y, strum.rotations, strum.scaleX, strum.scaleY)
                end
            end

            love.graphics.setColor(1,1,1)
        end

        -- Draw notes
        local visibleBeat = self.currentBeat - (self.currentSection * self.beatsPerSection)
        local chart = section.chart
        local downscroll = section.downscroll
        if chart then
            local batchSize = #chart
            if batchSize > 0 then
                love.graphics.setScissor(scissors[1], scissors[2], scissors[3], scissors[4])

                local notesSpriteBatch = love.graphics.newSpriteBatch(self.notesImg, batchSize)
                for _, note in ipairs(chart) do
                    local x = section.strums[note.track].x
                    local beatOffset = (note.beat - self.currentBeat) * ((downscroll and -1) or 1)
                    local y = self.playheadY + beatOffset * self.beatSpacing

                    -- Only draw notes inside visible area
                    local h = love.graphics:getHeight()
                    local noteH = self.notesImg:getHeight()
                    if y >= 0 - noteH and y <= h + noteH then
                        -- print("Hit note at beat", note.beat)
                        notesSpriteBatch:setColor(1,1,1)
                        
                        local track = note.track
                        if strums then
                            local strum = strums[track]
                            -- print(track)
                            notesSpriteBatch:setColor(strum.color)
                        end

                        notesSpriteBatch:add(x + 0, y, 0, 2, 2)
                        --love.graphics.rectangle("fill", x, y, 20, 20)
                    end
                end

                love.graphics.draw(notesSpriteBatch)
                notesSpriteBatch:clear()

                love.graphics.setScissor()
            end
        end

        -- Draw combo
        love.graphics.setColor(1,0,0)
        local combo = section.combo

        if combo and combo > 0 then
            love.graphics.setColor(1,1,1)
            local comboScale = 3 * (combo / 600) + 1
            love.graphics.print("Combo\nx" .. combo, SCREEN_WIDTH / 2 + 50, SCREEN_HEIGHT / 2, 0, comboScale, comboScale)
        end

        love.graphics.setColor(1,1,1)
    end
end

function self:onHitNote(note, perfect)
    local tp = Game:getTension()
    local mult = 0.2
    local points = 1 * mult
    if perfect then points = 2 * mult end

    Game:setTension(tp + points)
end

function self:hit(note, abs)
    local track = note.track
    -- print("Hit note at beat", note.beat)
    local section = note.section
    if section then
        local strums = section.strums
        if strums then
            local strum = strums[track]
            if strum then
                -- print(strum.x, tostring(section))
                local flash = strum.flash
                local rProps = {
                    color = flash.colors.hit
                }
                if abs < strum.perfectWindow then
                    flash.color = flash.colors.perfect
                    rProps.color = flash.colors.perfect
                    self:onHitNote(note, true)
                else
                    flash.color = flash.colors.hit
                    self:onHitNote(note, false)
                end

                flash.active = true
                flash.timer = flash.defaultTimer

                self:createStrumCircle(strum)
                self:createStrumRectangle(strum, rProps)
            end
        end

        local combo = section.combo
        if combo then
            combo = combo + 1
            section.combo = combo
        end

        local player = self.player
        if track == 1 and player then
            player:setAnimation("hitchord")
        else
            player:setAnimation("hitchordright")
        end

        self.instrument:setVolume(1)
        -- self.instrumentInst:setVolume(1)
    end
end

function self:miss(note)
    if note and note.disabled then return end

    if note then
        -- print("Missed note", note.beat)
        local section = note.section
        local combo = section.combo
        if section and combo and not note.disabled then
            combo = 0
            section.combo = 0
        end
    else
        -- print("Missed")
    end

    self.instrument:setVolume(0)
    -- self.instrumentInst:setVolume(0)
end

function self:checkHit(section, track)
    if type(section) == "number" then
        section = self.sections[section]
    end
    track = track or self.selectedTrack

    if section then
        local chart = section.chart
        if chart then
            for i, note in ipairs(chart) do
                if note.track == track and not note.disabled then
                    local diff = note.beat - self.currentBeat
                    local abs = math.abs(diff)
                    if abs <= hitWindowBeats then
                        -- Hit!
                        -- print(abs)
                        note.section = section
                        self:hit(note, abs)
                        table.remove(chart, i) -- remove note if you want
                        return
                    end
                end
            end

            self:miss(
                {
                    section = section
                }
            )
        end
    end
end

function self:keypressed(key)
    if Input.keyPressed("z") or Input.keyPressed("left") then
        self:checkHit(1, 1)
    elseif Input.keyPressed("x") or Input.keyPressed("right") then
        self:checkHit(1, 2)
    end

    if key then
        if key == "a" then
            self:checkHit(2, 1)
        elseif key == "s" then
            self:checkHit(2, 2)
        elseif key == "d" then
            self:checkHit(3, 1)
        elseif key == "f" then
            self:checkHit(3, 2)
        elseif key == "escape" then
            playSongMusic("stop")
            stateManager:loadState("menu")
        end
    end

    clampSection()
end

-- importJSON(filename) reads file and parses values produced by exportJSON
function self:importJSON(filename)
    local contents
    local err
    local newChart
    filename = filename or "chart.json"
    if type(filename) == "string" then
        if not love.filesystem.getInfo(filename) then
            return
        end

        contents, err = love.filesystem.read(filename)
        if not contents then
            return
        end

        newChart = JSON.decode(contents)
    else
        if type(newChart) == "string" then
            newChart = JSON.decode(filename)
        else
            newChart = filename
        end
    end

    self.bpm = newChart.bpm
    self.beatsPerSections = newChart.beatPerSections
    self.numTracks = newChart.numTracks
    self.songInstPath = newChart.songInst
    self.instrInstPath = newChart.instrInst
    self.instrumentPath = newChart.instrument
    self.characterPath = newChart.charPath

    self.chart = newChart.chart
    self:recomputeTotalSections()
    self:createSections(newChart)
end

-- The actual object code

function MusicMinigame:init()
    super.init(self)
    --print("INIT LOADED")
    self.tv = Tv(SCREEN_WIDTH / 1.4, 40)
    self.state = "NOTHING"
end

function MusicMinigame:getTv()
    return self.tv
end

function MusicMinigame:update()
    super.update(self)
    --print("UPDATE LOADED")
    local playback = self:getTime()
    -- print(playback)
    self.elapsed = self.elapsed + 1 * DT

    if self.state == "PLAYING" then
        local tv = self:getTv()
        if tv then
            if self.audio and self.time then
                local displayTime = math.ceil(self.time - self.elapsed)
                if displayTime < 0 then
                    displayTime = 0
                end

                tv.text:setText(displayTime)
            end
        end
        state:update(DT)
    end
end

---@param party PartyBattler[]
function MusicMinigame:set(audio, inst, song, chart, party)
    if type(audio) == "string" then audio = Music(audio, 1) end
    if type(inst) == "string" then inst = Music(inst, 1) end
    if type(song) == "string" then song = Music(song, 1) end
    if type(chart) == "string" then chart = JSON.decode(chart) end
    self.audio = audio
    self.inst = inst
    self.song = song
    self.chart = chart
    print(self.chart)

    MusicMinigame.chart = chart
    MusicMinigame.party = party
    MusicMinigame.inst = inst
    MusicMinigame.instrument = song
    
    state:load()
end

function MusicMinigame:getState(expected)
    local state = self.state
    if expected ~= nil then
        if state == expected then
            return true
        else
            return false
        end
    end

    return self.state
end

function MusicMinigame:getTime()
    return self.audio:tell() or -1
end

function MusicMinigame:setToPartyPosition()
end

function MusicMinigame:_play(callback)
    local player = self.party[1]
    local px, py = player:getPosition()
    self.startPosition = {
        x = px,
        y = py,
    }

    player:setPosition(SCREEN_WIDTH / 1.5, SCREEN_HEIGHT / 2)
    player:move(0, 20)
    player:setActor("kris_banjo")

    self.player = player
    
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
    self.elapsed = 0
    self.tv:setLayer(self.player.layer - 3)
    Game.battle:addChild(self.tv)

    self.bushes = {}
    Game.world.timer:doWhile(function() return self:getState("PLAYING") end, function()
        local rng = MathUtils.randomInt(1,20)
        if rng == 1 then
            local offsetY = MathUtils.random(-20, 90)
            local bush = DesertBush(SCREEN_WIDTH, SCREEN_HEIGHT / 2 - 30 + offsetY, 2.5, -13, 0)
            bush:setLayer(self.player.layer - 2)
            Game.battle:addChild(bush)
            table.insert(self.bushes, bush)
        end
    end)
end

function MusicMinigame:play(callback)
    self:_play(callback)
    Game.world.timer:after(self.audio.source:getDuration(), function() self:finish() end)
end

function MusicMinigame:playShort(time, callback)
    self:_play(callback)
    self.time = time
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

    for _,partyMember in pairs(self.party) do
        partyMember:setAnimation("battle/idle")
    end

    local player = self.party[1]
    local startPosition = self.startPosition
    player:setPosition(startPosition.x, startPosition.y)
    player:setActor("kris")
    player:setAnimation("battle/idle")

    state.bg:remove()
    self.tv:remove()

    for _,bush in pairs(self.bushes) do
        local rng = MathUtils.randomInt(1,12)
        if rng == 1 then
            bush.alpha = MathUtils.random(0.1, 0.3)
        else
            bush:remove()
        end
    end

    self:remove()
end

function MusicMinigame:draw()
    if self.state == "PLAYING" then
        if self.audio and self.time then
            state:draw()
        end
    end
end

return MusicMinigame