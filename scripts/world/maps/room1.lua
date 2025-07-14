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
  nextobjectid = 100,
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
      image = "../../../assets/sprites/bg3.png",
      id = 9,
      name = "bg3",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = -1589.26,
      offsety = -855.597,
      parallaxx = 1,
      parallaxy = 1,
      repeatx = false,
      repeaty = false,
      properties = {}
    },
    {
      type = "imagelayer",
      image = "../../../assets/sprites/bg.png",
      id = 10,
      name = "bg",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 61,
      offsety = -113,
      parallaxx = 1,
      parallaxy = 1,
      repeatx = false,
      repeaty = false,
      properties = {}
    },
    {
      type = "imagelayer",
      image = "../../../assets/sprites/bg2.png",
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
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 800,
          y = 240,
          width = 247.424,
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
          x = 807.424,
          y = 401.86,
          width = 240,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 61,
          name = "",
          type = "",
          shape = "rectangle",
          x = 253.055,
          y = 25.6494,
          width = 78,
          height = 245,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 65,
          name = "",
          type = "",
          shape = "rectangle",
          x = 291,
          y = 157,
          width = 666,
          height = 66,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 67,
          name = "",
          type = "",
          shape = "rectangle",
          x = 760.25,
          y = 222.5,
          width = 63.1891,
          height = 27.0489,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 68,
          name = "",
          type = "",
          shape = "rectangle",
          x = 777.906,
          y = 441.18,
          width = 28.125,
          height = 75.125,
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
          width = 661.75,
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
          y = 17.3445,
          width = 8,
          height = 487.375,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 72,
          name = "",
          type = "",
          shape = "rectangle",
          x = 114.38,
          y = 19.7819,
          width = 126.909,
          height = 21.8182,
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
          id = 96,
          name = "",
          type = "",
          shape = "polygon",
          x = 920,
          y = 240,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = -17 },
            { x = -104, y = -17 },
            { x = -103.625, y = 0.25 }
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
      objects = {
        {
          id = 27,
          name = "savepoint",
          type = "",
          shape = "rectangle",
          x = 478.066,
          y = 322.546,
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
          x = 1000,
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
          id = 98,
          name = "Interactable",
          type = "door",
          shape = "polygon",
          x = 143.302,
          y = 359.866,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 111.586, y = -94.8484 },
            { x = 109.727, y = -319.881 },
            { x = -19.5276, y = -318.951 }
          },
          properties = {}
        },
        {
          id = 99,
          name = "Interactable",
          type = "door",
          shape = "polygon",
          x = 143.302,
          y = 361.726,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 65.0921, y = 9.29887 },
            { x = 129.254, y = -89.2691 },
            { x = 111.586, y = -94.8484 },
            { x = 108.797, y = -95.7783 }
          },
          properties = {}
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
          x = 545.575,
          y = 354.739,
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
          x = 960,
          y = 360,
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
