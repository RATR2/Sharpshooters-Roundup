local Cowboy, super = Class(EnemyBattler)

function Cowboy:init()
    super.init(self)

    self.name = "TV"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("tenna")
    self:setSprite("death")

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

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 5 DF 12\n* Old Asgore's TV\n* Looking for a good rest."

    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* The TV looks like like it's\nabout to break."

    -- Register act called "Smile"
    self:registerAct("Play", "Get ready\nto play!", nil, 24, Game.battle.party[1])
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    -- self:registerAct("Sing Along", "Plays a familiar tune", {"ralsei"})
end

function Cowboy:update()
    super.update(self)

    -- print(Game.battle:getState())
    if Game.battle:getState() == "ENEMYDIALOGUE" and self.play then
        self.play = false
        Game.battle:setState("NONE")
        local msmobject = MusicMinigame()
        Game.battle:addChild(msmobject)
        msmobject:set(Game.battle.music, "minigame_banjo_inst", "minigame_banjo_banjo")
        msmobject:playShort(12, function() Game.battle:setState("ACTIONSELECT") end)

        local attackers = Game.battle.enemies
        -- Loop through all attackers
        for _, attacker in ipairs(attackers) do
            attacker.canChoose = true
        end
    end
end

function Cowboy:defeat(reason, violent)
    super.defeat(self, reason, violent)
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
    elseif name == "Play" then
        battler:flash()
        Assets.playSound("boost", 2, 1)
        self.play = true

        local attackers = Game.battle.enemies
        -- Loop through all attackers
        -- print(#attackers)
        local i = 1
        for _, attacker in pairs(attackers) do
            -- print(i)
            attacker.dialogue_override = ""
            attacker.canChoose = false
            -- attacker:flash()
            i = i + 1
        end
        
        return "* You get ready to play!"
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

return Cowboy