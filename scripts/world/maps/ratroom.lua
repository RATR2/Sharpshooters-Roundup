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
  nextlayerid = 11,
  nextobjectid = 106,
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
      type = "imagelayer",
      image = "../../../assets/sprites/beforebattle.png",
      id = 8,
      name = "bg2",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 34.7388,
      offsety = -115.597,
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
      opacity = 0.5,
      offsetx = -81,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 65,
          name = "",
          type = "",
          shape = "rectangle",
          x = 291,
          y = 218.5,
          width = 466.5,
          height = 4.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 70,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120.555,
          y = 503.11,
          width = 677.25,
          height = 14.25,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 71,
          name = "",
          type = "",
          shape = "rectangle",
          x = 111.256,
          y = 393.344,
          width = 8,
          height = 111.375,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 95,
          name = "",
          type = "",
          shape = "polygon",
          x = 117.369,
          y = 388.237,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 138.276, y = -124.097 },
            { x = 146.836, y = -123.426 },
            { x = 0, y = 7.37875 }
          },
          properties = {}
        },
        {
          id = 100,
          name = "",
          type = "",
          shape = "polyline",
          x = 264.5,
          y = 264.75,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 0, y = -41.5 },
            { x = 26.5, y = -41.75 }
          },
          properties = {}
        },
        {
          id = 101,
          name = "",
          type = "",
          shape = "polyline",
          x = 758.5,
          y = 223.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0, y = 0 },
            { x = 82.75, y = 49.75 }
          },
          properties = {}
        },
        {
          id = 102,
          name = "",
          type = "",
          shape = "polyline",
          x = 797,
          y = 516.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polyline = {
            { x = 0.5, y = -13.75 },
            { x = 7, y = -72 },
            { x = 47.5, y = -114.75 }
          },
          properties = {}
        },
        {
          id = 104,
          name = "",
          type = "",
          shape = "polygon",
          x = 838.333,
          y = 270.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 6.66667, y = 131.333 },
            { x = -2, y = 141.333 },
            { x = -8, y = -4 }
          },
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
      offsetx = -81,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "markers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = -81,
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
          x = 489.198,
          y = 340.141,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 105,
          name = "entry",
          type = "",
          shape = "point",
          x = 489,
          y = 340,
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
