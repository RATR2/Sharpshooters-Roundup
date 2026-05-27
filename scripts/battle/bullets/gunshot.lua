local GunShot, super = Class(Bullet)

function GunShot:init(x, y, dir, speed, delay, destroyTimer, side, rotAmount)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/target")
    
    local w, h = self:getScaledSize()
    self:setOriginExact(w / 4, h / 4)

    self.marker = Sprite("bullets/redcircle", x, y)
    self.marker:setScale(2, 2)
    Game.battle:addChild(self.marker)
    self.marker:setLayer(self:getLayer() - 1)
    local cw, ch = self.marker:getScaledSize()
    self.marker:move(cw / -2, ch / -2)

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
    self.destroy_on_hit = false

    self.startMarkerRotation = self.marker.rotation

    -- Begin the bullet without collision
    self.collidable = false
    self.visible = false
    self.shot = false
    self.side = side or ((love.math.random(1,2) == 1) and 1) or -1
    self.rotAmount = rotAmount or 25
    self.fireTimer = delay or 1
    self.destroyTimer = destroyTimer or 0.3

    self.timer = 0
    self.afterImageCount = 0
    self.afterImageTarget = 3
    self.markerMoves = 0
    self.shakeIntensity = 12

    Assets.stopAndPlaySound("alert")
end

function GunShot:update()
    -- For more complicated bullet behaviours, code here gets called every update
    self.timer = self.timer + DT
    local marker = self.marker
    if self.timer >= self.fireTimer then


        if not self.shot then
            local rngX = MathUtils.random(-self.shakeIntensity, self.shakeIntensity)
            local rngY = MathUtils.random(-self.shakeIntensity, self.shakeIntensity)
            Game.battle.arena:shake(rngX, rngY)
            self.collidable = true
            self.visible = true

            local arenabreak = self.wave:spawnBullet("arenabreak", self.x, self.y)
            local nX, nY = self:getRelativePosFor(Game.battle.arena)
            arenabreak:setParent(Game.battle.arena.mask)
            arenabreak:setPosition(nX, nY)
            Assets.playSound("impact")

            if marker then
                marker.visible = true
                marker.rotation = self.startMarkerRotation
            end

            self.shot = not self.shot
        end
    else
        if marker then
            local value = self.timer / self.fireTimer
            local cond = value >= 0.3
            -- print(value, cond)

            if cond then
                if not self.noAnimateMarker then
                    if self.afterImageCount >= self.afterImageTarget then
                        self.afterImageCount = 0
                        -- Play around with these values to decide what fits your effect best!
                        local after_image = AfterImage(self.marker, 0.6, 0.04)
                        -- Parent the AfterImage to the sprite otherwise it won't appear in-game!
                        self.marker:addChild(after_image)
                        Assets.stopAndPlaySound("noise")
                    elseif self.afterImageCount % 50 >= 1 then
                        marker.visible = not marker.visible
                    end

                    marker.rotation = marker.rotation + math.rad(self.rotAmount * self.side)
                    self.markerMoves = self.markerMoves + 1
                end

                local radRot = math.rad(self.rotAmount)
                local offset = math.rad(1)
                if marker.rotation > self.startMarkerRotation - radRot and marker.rotation - offset < self.startMarkerRotation + radRot + offset and self.markerMoves > 1 then
                    self.noAnimateMarker = true
                    self.rotation = self.startMarkerRotation
                end
            end

            self.afterImageCount = self.afterImageCount + 1
        end
    end

    if self.timer >= self.fireTimer + self.destroyTimer then
        self:remove()
    end

    super.update(self)
end

function GunShot:onRemove(parent)
    self.marker.visible = false
    self.marker:remove()
end

return GunShot