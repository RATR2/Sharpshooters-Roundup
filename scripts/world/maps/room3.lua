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
  nextlayerid = 6,
  nextobjectid = 9,
  properties = {
    ["music"] = "",
    ["name"] = ""
  },
  tilesets = {},
  layers = {
    {
      type = "imagelayer",
      image = "../../../assets/sprites/afterbattle.png",
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
          id = 1,
          name = "",
          type = "",
          shape = "polyline",
          x = 37,
          y = 272,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 152, y = 2 },
            { x = 250, y = -57 },
            { x = 735, y = -54 },
            { x = 736, y = -12 },
            { x = 878, y = 112 },
            { x = 878, y = 237 },
            { x = 200, y = 240 },
            { x = 188, y = 170 },
            { x = 149, y = 128 },
            { x = -2, y = 127 }
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
          id = 3,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 280,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "room2",
            ["marker"] = "entry2"
          }
        },
        {
          id = 5,
          name = "door",
          type = "",
          shape = "polygon",
          x = 775,
          y = 265,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 11, y = -60 },
            { x = -71, y = 10 },
            { x = 76, y = 158 },
            { x = 199, y = 71 }
          },
          properties = {}
        },
        {
          id = 6,
          name = "npc",
          type = "",
          shape = "point",
          x = 840,
          y = 356,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "door"
          }
        },
        {
          id = 7,
          name = "transition",
          type = "",
          shape = "polygon",
          x = 777,
          y = 286,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 5, y = -19 },
            { x = 106, y = 58 },
            { x = 92, y = 74 }
          },
          properties = {
            ["map"] = "elevator",
            ["marker"] = "entry"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
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
          id = 2,
          name = "spawn",
          type = "",
          shape = "point",
          x = 538,
          y = 337,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "entry",
          type = "",
          shape = "point",
          x = 80,
          y = 360,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "entry2",
          type = "",
          shape = "point",
          x = 770,
          y = 337,
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
