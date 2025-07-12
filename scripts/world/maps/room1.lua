return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 20,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 7,
  nextobjectid = 60,
  properties = {
    ["name"] = "??? - Cancelled Chapter"
  },
  tilesets = {
    {
      name = "castle",
      firstgid = 1,
      filename = "../tilesets/castle.tsx",
      exportfilename = "../tilesets/castle.lua"
    },
    {
      name = "tilesetfight",
      firstgid = 41,
      filename = "../tilesets/tilesetfight.tsx",
      exportfilename = "../tilesets/tilesetfight.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 12,
      id = 1,
      name = "tiles",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 0,
        0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 0,
        0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 0,
        0, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 0, 0, 0, 0, 0, 0,
        0, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 12, 0, 0, 0, 0, 0, 0,
        0, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 7, 7, 7, 7, 7, 7,
        0, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 15, 15, 15, 15, 15, 15,
        0, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 0, 0, 0, 0, 0, 0, 0,
        0, 14, 15, 15, 11, 11, 11, 11, 11, 11, 11, 15, 15, 16, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 5, 25, 25, 25, 25, 25, 25, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
        0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0, 5, 5, 5, 5, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 12,
      id = 6,
      name = "tiles2",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 57, 0, 0, 0, 0, 0, 0, 2147483705, 0, 0, 0, 0, 0, 0,
        0, 64, 62, 2147483712, 0, 62, 63, 2147483710, 64, 0, 64, 2147483710, 0, 2147483711, 0, 0, 0, 0, 0, 0,
        0, 70, 68, 2147483718, 0, 68, 69, 2147483716, 70, 0, 70, 2147483716, 0, 2147483717, 0, 0, 57, 0, 0, 0,
        0, 41, 42, 42, 76, 75, 74, 76, 74, 42, 74, 74, 75, 43, 62, 0, 63, 2147483712, 0, 62,
        0, 47, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 49, 68, 0, 69, 2147483718, 0, 68,
        0, 47, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 75, 74, 75, 76, 75, 75,
        0, 47, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48,
        0, 47, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48,
        0, 47, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 48, 49, 54, 54, 54, 54, 54, 54,
        0, 54, 54, 54, 59, 60, 60, 60, 60, 60, 61, 54, 54, 55, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 65, 66, 66, 66, 66, 66, 67, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 71, 72, 72, 72, 72, 72, 73, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "collision",
      class = "",
      visible = true,
      opacity = 0.5,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 80,
          width = 520,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 120,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 600,
          y = 160,
          width = 200,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 320,
          width = 240,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 39.9583,
          y = 360,
          width = 120.042,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 120,
          width = 40,
          height = 240,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 56,
          name = "",
          type = "",
          shape = "rectangle",
          x = 440,
          y = 360,
          width = 120.042,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 57,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 440,
          width = 280,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 58,
          name = "",
          type = "",
          shape = "rectangle",
          x = 440,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 59,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "objects",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 27,
          name = "savepoint",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 210,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* The scent of flowers\nis stronger here...",
            ["text2"] = "* You feel like your final\nchapter is about to broadcast."
          }
        },
        {
          id = 29,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 800,
          y = 200,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "room2",
            ["marker"] = "entry"
          }
        },
        {
          id = 37,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 440,
          width = 280,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* There's no going back now..."
          }
        },
        {
          id = 40,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 80,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cactusID"] = 1,
            ["cutscene"] = "room1.cactus"
          }
        },
        {
          id = 42,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 80,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cactusID"] = 2,
            ["cutscene"] = "room1.cactus"
          }
        },
        {
          id = 43,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 80,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cactusID"] = 3,
            ["cutscene"] = "room1.cactus"
          }
        },
        {
          id = 44,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 80,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cactusID"] = 5,
            ["cutscene"] = "room1.cactus"
          }
        },
        {
          id = 46,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 80,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cactusID"] = 4,
            ["cutscene"] = "room1.cactus"
          }
        },
        {
          id = 47,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 80,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cactusID"] = 6,
            ["cutscene"] = "room1.cactus"
          }
        },
        {
          id = 48,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 80,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cactusID"] = 7,
            ["cutscene"] = "room1.cactus"
          }
        },
        {
          id = 49,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 80,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cactusID"] = 8,
            ["cutscene"] = "room1.cactus"
          }
        },
        {
          id = 50,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 440,
          y = 80,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cactusID"] = 9,
            ["cutscene"] = "room1.cactus"
          }
        },
        {
          id = 51,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 520,
          y = 80,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cactusID"] = 10,
            ["cutscene"] = "room1.cactus"
          }
        },
        {
          id = 52,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 160,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cactusID"] = 11,
            ["cutscene"] = "room1.cactus"
          }
        },
        {
          id = 53,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 680,
          y = 160,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cactusID"] = 13,
            ["cutscene"] = "room1.cactus"
          }
        },
        {
          id = 54,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 160,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cactusID"] = 12,
            ["cutscene"] = "room1.cactus"
          }
        },
        {
          id = 55,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 760,
          y = 160,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cactusID"] = 14,
            ["cutscene"] = "room1.cactus"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "markers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 20,
          name = "spawn",
          type = "",
          shape = "point",
          x = 141,
          y = 240.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "entry",
          type = "",
          shape = "point",
          x = 760,
          y = 280,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
