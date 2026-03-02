return {
    ---@param cutscene WorldCutscene
    encounter = function(cutscene, event)
        local function afterAttack(kris, susie, ralsei, tweentype, choice)
            local newkris_x, _ = cutscene:getMarker("krisknockloc")
            local newsusie_x, _ = cutscene:getMarker("susieknockloc")
            local newralsei_x, _ = cutscene:getMarker("ralseiknockloc")
            local hittext_x, hittext_y = cutscene:getMarker("hittextloc")
            Game.world.timer:tween(0.7,kris, {x = newkris_x},tweentype)
            Game.world.timer:tween(0.8,ralsei, {x = newralsei_x},tweentype)
            if choice == 3 or 1 then
                Game.world.timer:tween(0.6,susie, {x = newsusie_x},tweentype)
            end
            local percent = DamageNumber("damage",999,hittext_x,hittext_y, {1,0,0})
            percent.layer = WORLD_LAYERS["top"]
            kris.world:addChild(percent)
        end

        local function susieDown(susie, tweentype)
            Game:removePartyMember("susie")
            cutscene:wait(0.4)
            --cutscene:wait(0.6)
            susie:shake(5)
            cutscene:wait(0.4)
            Assets.playSound("damage")
            susie:setSprite("fell")
            cutscene:wait(0.8)
            local _, susierockzy = cutscene:getMarker("susierockz")
            Game.world.timer:tween(5,susie, {y = susierockzy },tweentype)
            cutscene:wait(0.8)
        end

        local function ralseiDown(ralsei, tweentype)
            Game:removePartyMember("ralsei")
            cutscene:wait(0.4)
            local newralsei_x2, _ = cutscene:getMarker("ralseicrawlloc")
            Game.world.timer:tween(0.6,ralsei, {x = newralsei_x2},tweentype)
            cutscene:wait(0.6)
            ralsei:shake(5)
            cutscene:wait(0.4)
            Assets.playSound("damage")
            ralsei:setSprite("battle/defeat_1")
            cutscene:wait(0.8)
            local _, ralseihappyplacey = cutscene:getMarker("ralseihappyplace")
            Game.world.timer:tween(5,ralsei, {y = ralseihappyplacey },tweentype)
            cutscene:wait(0.8)
        end

        local function skillissue(data)
            afterAttack(data.kris, data.susie, data.ralsei, data.tweentype, data.choice)
            data.kris:setSprite("sit")
            data.ralsei:setSprite("down")
            cutscene:wait(1.2)
            data.kris:shake(3)
            data.susie:setSprite("walk/right_1")
            data.kris:setSprite("walk/right_1")
            if data.aurafarming then
                data.kris:setSprite("pose")
            end
            cutscene:setSpeaker(data.susie)
            cutscene:text("* Ralsei!", "surprise_frown")
            cutscene:setSpeaker(data.ralsei)
            cutscene:text("* I-its okay Susie...", "no_glasses_closed")
            cutscene:text("* I'll be back in a\nmoment.", "pleased")
            ralseiDown(data.ralsei, data.tweentype)
            cutscene:setSpeaker(data.susie)
            if data.aurafarming then
                cutscene:text("* Alright, [wait:1]asshole...","bangs_teeth")
                cutscene:text("* [wait:2].[wait:2].[wait:2]. [wait:1]Kris... [wait:1]\n* Kris, can you stop that?","nervous_side")
                cutscene:wait(0.6)
                data.kris:setSprite("walk/right_1")
                Assets.playSound("bump")
                cutscene:wait(0.3)
            end
            cutscene:text("* Alright, [wait:1]asshole.[wait:1]\n* Good luck.","bangs_teeth")
        end

        local function selfcare(data)
            data.kris:setSprite("battle/defend_6")
            afterAttack(data.kris, data.susie, data.ralsei, data.tweentype, data.choice)
            data.ralsei:setSprite("down")
            data.susie:setSprite("kneel_right")
            cutscene:wait(1.2)
            data.susie:shake(3)
            cutscene:setSpeaker(data.susie)
            if data.aurafarming then
                data.kris:setSprite("pose")
            end
                cutscene:text("* ...", "bangs_neutral")
            if data.aurafarming then
                data.susie:setSprite("angry_down")
                Assets.playSound("wing")
                cutscene:text("* KRIS WHAT THE FU-[next:true]", "teeth_b")
                data.susie:setSprite("kneel_right")
                Assets.playSound("sussurprise")
            end
            susieDown(data.susie, data.tweentype)
            cutscene:setSpeaker(data.ralsei)
            if data.aurafarming then
                cutscene:text("* ...", "pensive")
            end
            cutscene:text("* I-its okay Kris...[wait:8]\n* We'll be fine...[wait:8]\n* We'll be back in a mo-[next:true]", "no_glasses_closed")
            ralseiDown(data.ralsei, data.tweentype)
        end

        local function afterFirstChoice(data)
            local protectedChoice = data.choice
            local flowers = Game.world.map:getImageLayer("Flowers")
            cutscene:wait(0.1)
            Assets.playSound("criticalswing",2,1)
            Game.music:setLooping(false)
            Game.music:play("renewal")
            local msobject = MusicWaiter()
            Game.world:addChild(msobject)
            msobject:setLenght(40)
            if protectedChoice == 4 then
                skillissue(data)
            elseif protectedChoice == 3 then
                selfcare(data)
            end
            --cutscene:wait(msobject:getTime()/2) im impatient lmao
            cutscene:wait(cutscene:fadeOut(0.2))
            local _, tennadownlocy = cutscene:getMarker("tennadownloc")
            data.tenna.y = tennadownlocy
            data.tenna:setSprite("death")
            cutscene:wait(cutscene:fadeIn(0.2))
            cutscene:wait(0.3)
            data.tenna:shake(2)
            cutscene:wait(0.2)
            --print(msobject:getTime() or "not how this works") 
            --cutscene:wait(msobject:getTime()) lmao
            msobject:remove()
            local _, tennahappyplacey = cutscene:getMarker("ITSTVTIMEOUT")
            Game.world.timer:tween(2,data.tenna, {y = tennahappyplacey },tweentype)
            Game.world.timer:tween(1,flowers, {x = flowers.x - 200 },"in-cubic")
            cutscene:wait(0.5)
            Game.music:stop()
            cutscene:startEncounter("cowboy", true, {data.tenna})
            if protectedChoice == 4 then 
                Game:addPartyMember("ralsei")
            elseif protectedChoice == 3 then
                Game:addPartyMember("susie")
                Game:addPartyMember("ralsei")
            end
        end

        local aurafarming = false -- real
        local tweentype = "out-cubic"
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        local ralsei = cutscene:getCharacter("ralsei")
        local tenna = cutscene:getCharacter("tenna")
        local cam_x, cam_y = cutscene:getMarker("cam")

        cutscene:detachCamera()
        cutscene:detachFollowers()
        cutscene:panTo(cam_x, cam_y)
        cutscene:walkTo("kris", "krisloc", 1)
        cutscene:walkTo("susie", "susieloc", 1)
        if ralsei then
            cutscene:wait(cutscene:walkTo("ralsei", "ralseiloc", 1))
        end
        cutscene:setSpeaker(susie)
        cutscene:text("* Finally.[wait:2]\n* Took long enough to get in here", "nervous_side")
        cutscene:setSpeaker(ralsei)
        cutscene:text("* Odd...[wait:2]\n* All that's inside is...", "smile_side")
        cutscene:setSpeaker(susie)
        cutscene:text("* Tenna...?", "surprise")
        Assets.playSound("grab")
        tenna:setSprite("denial_2")
        tenna:shake(5)
        cutscene:wait(1)
        cutscene:setSpeaker(tenna)
        cutscene:text("* YOU MUST LEAVE.")
        cutscene:setSpeaker(susie)
        cutscene:text("* What? [wait:1]\n* Tenna come on, lets get you out of here...", "nervous")
        cutscene:setSpeaker(ralsei)
        cutscene:text("* Susie... i dont think that's-[next:true]", "pensive")
        cutscene:setSpeaker(tenna)
        if ralsei then
            ralsei:setSprite("battle/hurt_1")
        end
        Assets.playSound("impact")
        tenna:setSprite("handsup")
        cutscene:text("* NO.[wait:2]\n* IT IS TOO LATE.")
        if ralsei then
            ralsei:setSprite("walk/right_1")
        end
        tenna:setAnimation("up")
        cutscene:text("* IT FEEDS ON ATTENTION.[wait:1]\n* AND IT HAS BEEN STARVING.")
        Assets.playSound("hurt")
        tenna:shake(5)
        tenna:setAnimation("plead")
        cutscene:text("* FOR A LONG.[wait:10]\n* [sound:hurt]LONG.[wait:10]\n* TI[sound:hurt][next:true]")
        Assets.playSound("grab")
        tenna:setSprite("plead_1")
        susie:setSprite("shock_right")
        local tennaknockx, _ = cutscene:getMarker("tennaknockloc")
        Game.world.timer:tween(1,tenna, {x = tennaknockx },tweentype)
        Game.world.music:stop()
        cutscene:wait(1)
        local waittmr = 0.35
        local detune = 1.2

        for i = 1,3 do
            Assets.playSound("stardrop",1,detune)
            cutscene:wait(waittmr)
        end

        cutscene:wait(1)
        Assets.playSound("bigcut",1,1.1)
        cutscene:wait(0.6)
        local choosed = false
        local waitCutscene = 0
        local triggered = false
        cutscene:during(function()
            if choosed == true then
                return true
            end

            waitCutscene = waitCutscene + 0.1 * DTMULT
            if waitCutscene >= 3 and not triggered then
                triggered = true
                -- cutscene:closeText() <- this crashes the game for some reason
                return true
            end
        end)
        local protectedChoice = cutscene:choicer({"Protect Susie", "Protect Ralsei", "Protect Kris"})
        choosed = true
        -- print("triggered: " .. ((triggered and "true") or "false"))
        local data = {
            event = event,
            kris = kris,
            ralsei = ralsei,
            susie = susie,
            tenna = tenna,
            aurafarming = aurafarming,
            tweentype = tweentype,
        }
        if triggered then
            local camX, camY = Game.world.camera:getPosition()
            local notime = Text("TOO SLOW!", camX, camY)
            local textX, textY = notime:getPosition()
            textX, textY = textX, textY - notime:getSize() / 2
            notime:setPosition(textX, textY)
            notime:setTextColor(1, 0, 0, 1)
            notime.layer = WORLD_LAYERS["top"]
            kris.world:addChild(notime)
            Assets.playSound("error")
            cutscene:wait(1)
            kris.world:removeChild(notime)
            data.choice = 4
        else
            data.choice = protectedChoice
        end
        afterFirstChoice(data)
    end
}