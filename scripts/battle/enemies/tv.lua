local Tv, super = Class(EnemyBattler)

-- This is hyperboid code taken... doubtfully, future me! remebember to credit correctly!
function Tv:onRegistered()
    self.charts = {}

    print("LOADING CHARTS")
    for _,path,data in Registry.iterScripts("data/charts") do
        print("!! " .. path)
        local split_path = StringUtils.split(path, "/", true)
        if isClass(data) then
            print("CLASS")
            -- if split_path[#split_path] == "song" then
            --     self.charts[table.concat(split_path, "/", 1, #split_path-1)] = data
            -- else
            --     self.charts[path] = data
            -- end
        else
            if split_path[#split_path] == "chart" then
                data.id = table.concat(split_path, "/", 1, #split_path-1)
                self.charts[data.id] = data
            else
                data.id = path
                self.charts[path] = data
            end
            print("DATAID: " .. data.id)
        end
    end
end

function Tv:init()
    super.init(self)
    self.static = Static()
    Game.stage:addChild(self.static)

    self:onRegistered()

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
    self.chart = self.charts["charts/minigame_banjo"]
end

function Tv:hideEnemies(hide)
    if hide == nil then hide = true end
    print("if", (hide ~= nil) and hide or true)
    print("hide", hide)
    for i,enemy in pairs(Game.battle.enemies) do
        enemy.visible = not hide
    end
end

function Tv:update()
    super.update(self)

    -- print(Game.battle:getState())
    if Game.battle:getState() == "ENEMYDIALOGUE" and self.play then
        self.play = false
        local msmobject = MusicMinigame()
        Game.battle:addChild(msmobject)
        Game.battle:setState("NONE")
        self.static:trigger(0.2, true)
        self:hideEnemies()
        msmobject:set(Game.battle.music, "minigame_banjo_inst", "minigame_banjo_banjo", love.filesystem.read("chart.json"), Game.battle.party)
        local tv = self
        msmobject:playShort(12, function()
            Game.battle:setState("ACTIONSELECT")
            tv.static:trigger(nil, false)
            print("a", nil, false)
            tv:hideEnemies(false)
            print("b", false)
        end)

        local attackers = Game.battle.enemies
        -- Loop through all attackers
        for _, attacker in ipairs(attackers) do
            attacker.canChoose = true
        end
    end
end

function Tv:defeat(reason, violent)
    super.defeat(self, reason, violent)
end

function Tv:onAct(battler, name)
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

return Tv