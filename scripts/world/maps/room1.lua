return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 25,
  height = 14,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 7,
  nextobjectid = 12,
  properties = {
    ["music"] = "western_winds",
    ["name"] = "??? - Cancelled Chapter"
  },
  tilesets = {},
  layers = {
    {
      type = "imagelayer",
      image = "../../../assets/sprites/metalbars.png",
      id = 4,
      name = "metalbars",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 0.8,
      parallaxy = 1,
      repeatx = false,
      repeaty = false,
      properties = {}
    },
    {
      type = "imagelayer",
      image = "../../../assets/sprites/beforebattle.png",
      id = 2,
      name = "bg",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 34.74,
      offsety = -115.6,
      parallaxx = 1,
      parallaxy = 1,
      repeatx = false,
      repeaty = false,
      properties = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "collision",
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
          id = 3,
          name = "",
          type = "",
          shape = "polyline",
          x = 914,
          y = 403,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = -151, y = -2 },
            { x = -191, y = 36 },
            { x = -198, y = 105 },
            { x = -879, y = 108 },
            { x = -879, y = -23 },
            { x = -740, y = -139 },
            { x = -739, y = -182 },
            { x = -252, y = -189 },
            { x = -153, y = -131 },
            { x = 0, y = -130 }
          },
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
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
          id = 4,
          name = "fakecactus",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 440,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "cactus",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 440,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "cactus2",
          type = "",
          shape = "rectangle",
          x = 480,
          y = 440,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 920,
          y = 280,
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
          id = 11,
          name = "savepoint",
          type = "",
          shape = "rectangle",
          x = 380,
          y = 307,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* The scent of flowers\nis stronger here...",
            ["text2"] = "* You feel like your final\nchapter is about to broadcast."
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
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
          id = 8,
          name = "spawn",
          type = "",
          shape = "point",
          x = 469,
          y = 342,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "entry",
          type = "",
          shape = "point",
          x = 859,
          y = 338,
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
