return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.1.6",
  orientation = "orthogonal",
  renderorder = "left-up",
  width = 11,
  height = 13,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "chao",
      firstgid = 1,
      filename = "chao.json",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "imagens/chao.png",
      imagewidth = 32,
      imageheight = 32,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 1,
      tiles = {
        {
          id = 0,
          properties = {
            ["fisica"] = false
          }
        }
      }
    },
    {
      name = "parede",
      firstgid = 2,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "imagens/parede.png",
      imagewidth = 32,
      imageheight = 32,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 1,
      tiles = {
        {
          id = 0,
          properties = {
            ["fisica"] = true
          }
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "cenario",
      x = 0,
      y = 0,
      width = 11,
      height = 13,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
        2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,
        2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
        2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,
        2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
        2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,
        2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
        2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,
        2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
        2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,
        2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
        2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2,
        2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
      }
    }
  }
}
