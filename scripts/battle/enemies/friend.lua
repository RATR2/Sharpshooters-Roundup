local Cowboy, super = Class(EnemyBattler)

function Cowboy:init()
    super.init(self)

    self.name = "Friend"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("friend")

    self.flowers = Game.world.map:getImageLayer("Flowers")
    self.factive = true

    -- Enemy health
    self.max_health = 4450
    self.health = self.max_health
    -- Enemy attack (determines bullet damage)
    self.attack = 4
    -- Enemy defense (usually 0)
    self.defense = 1
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 20

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "cowshooter",
        "lasso",
        "rebound",
        "flyingcorks",
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        {
            "They say to always shoot at stars",
            "But i'll shoot YOU instead!"
        },
        {
            "Lasso this, lasso that...",
            "why don't you knot it?"
        },
        {
            "Everyone's fan of re-shows",
            "lets see about rebounds!"
        },
        {
            "Cockroaches, corkraches",
            "What's the difference?"
        }
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 40 DF 12\n* Friend inside of Old Asgore's TV\n* Looking for a good show."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* The dummy gives you a soft\nsmile.",
        "* The power of fluffy boys is\nin the air.",
        "* Smells like cardboard.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* The TV looks like like it's\nabout to break."

    -- Register act called "Smile"
    -- self:registerAct("Play", "Get ready\nto play!", nil, 24, Game.battle.party[1])
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    -- self:registerAct("Sing Along", "Plays a familiar tune", {"ralsei"})
end

function Cowboy:getDialogue()
    -- print("canChoose: " .. tostring(self.canChoose or "nil"))
    if self.canChoose == false then return end
    self.dialogue_override, self.wave_override = self:getInBattle()
end

function Cowboy:onTurnStart()
    self:getDialogue()
end

function Cowboy:getInBattle()
    return self.dialogue[Game.battle.turn_count] or "Its TV time!", self.waves[Game.battle.turn_count] or nil
end

function Cowboy:update()
    super.update(self)
    
    if self.factive then
        self.flowers:setPosition(self.flowers.x - 480*DT, self.flowers.y)
    end

    -- print(Game.battle:getState())
    if Game.battle:getState() == "ENEMYDIALOGUE" and self.play then
        self.play = false
        Game.battle:setState("NONE")
        local msmobject = MusicMinigame()
        Game.battle:addChild(msmobject)
        msmobject:set(Game.battle.music, "minigame_banjo_inst", "minigame_banjo_banjo")
        msmobject:playShort(12, function() Game.battle:setState("ACTIONSELECT") end)
    end
end

function Cowboy:defeat(reason, violent)
    super.defeat(self, reason, violent)

    self.factive = false
    Game.world.timer:tween(1,self.flowers, {x = self.flowers.x - 200 },"out-cubic")
end

function Cowboy:onAct(battler, name)
    print(name)
    if name == "Standard" then --X-Action
        -- Give the enemy 50% mercy
        self:addMercy(50)
        if battler.chara.id == "ralsei" then
            -- R-Action text
            return "* Ralsei bowed politely.\n* The dummy spiritually bowed\nin return."
        elseif battler.chara.id == "susie" then
            -- S-Action: start a cutscene (see scripts/battle/cutscenes/dummy.lua)
            Game.battle:startActCutscene("dummy", "susie_punch")
            return
        else
            -- Text for any other character (like Noelle)
            return "* "..battler.chara:getName().." straightened the\ndummy's hat."
        end
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

return Cowboy