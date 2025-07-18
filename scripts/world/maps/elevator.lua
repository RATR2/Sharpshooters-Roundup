return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 5,
  nextobjectid = 20,
  properties = {},
  tilesets = {
    {
      name = "height",
      firstgid = 1,
      filename = "../tilesets/height.tsx"
    },
    {
      name = "elevator",
      firstgid = 3,
      filename = "../tilesets/elevator.tsx",
      exportfilename = "../tilesets/elevator.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0,
        0, 0, 0, 3, 3, 3, 3, 3, 5, 6, 3, 3, 3, 3, 0, 0,
        0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0,
        3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 3, 3, 0, 0,
        3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 3, 3, 0, 0,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 0, 0,
        3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 3, 3, 0, 0,
        3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 3, 3, 0, 0,
        0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0,
        0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
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
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 200,
          width = 200,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 280,
          width = 200,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 320,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 360,
          width = 320,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 120,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 120,
          width = 320,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 480,
          y = 160,
          width = 40,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
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
          id = 2,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = -40,
          y = 200,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "room3",
            ["marker"] = "entry2"
          }
        },
        {
          id = 18,
          name = "elevatorsign",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 120,
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
      id = 2,
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
          id = 1,
          name = "entry",
          type = "",
          shape = "point",
          x = 39,
          y = 268,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "spawn",
          type = "",
          shape = "point",
          x = 351,
          y = 265,
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
