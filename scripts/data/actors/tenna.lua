local actor, super = Class(Actor, "tenna")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Tenna"

    -- Width and height for this actor, used to determine its center
    self.width = 81
    self.height = 106

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {2, 26, 27, 10}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {1, 1, 0}

    -- Whether this actor flips horizontally (optional, values are "right" or "left", indicating the flip direction)
    self.flip = nil

    -- Path to this actor's sprites (defaults to "")
    self.path = "npcs/tenna"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "denial_1"

    -- Sound to play when this actor speaks (optional)
    self.voice = "tenna"
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = nil
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = nil

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false

    -- Table of talk sprites and their talk speeds (default 0.25)
    self.talk_sprites = {}

    -- Table of sprite animations
    self.animations = {
        ["up"] = {"up", 4/5, false},
        ["plead"] = {"plead", 4/5, false}
    }

    -- Table of sprite offsets (indexed by sprite name)
    self.offsets = {}
end

return actor