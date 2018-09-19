return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.1.6",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 11,
  height = 13,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 49,
  properties = {
    ["caminhavel"] = false
  },
  tilesets = {
    {
      name = "parede",
      firstgid = 1,
      filename = "parede.json",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../../../../Pictures/Artes Piskel/Exports/parede.png",
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
      properties = {
        ["parede"] = true
      },
      terrains = {
        {
          name = "Parede",
          tile = 0,
          properties = {}
        }
      },
      tilecount = 1,
      tiles = {
        {
          id = 0,
          properties = {
            ["parede"] = true
          },
          objectGroup = {
            type = "objectgroup",
            name = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            draworder = "index",
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "rectangle",
                x = -0.181818,
                y = -0.0909091,
                width = 31.8182,
                height = 31.6364,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        }
      }
    },
    {
      name = "caminho",
      firstgid = 2,
      filename = "caminhavel.json",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../../../../../Pictures/Artes Piskel/Exports/caminhavel.png",
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
            ["parede"] = false
          }
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Camada de Tiles 1",
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
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1,
        1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
        1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1,
        1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
        1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1,
        1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
        1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1,
        1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
        1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1,
        1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1,
        1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
      }
    },
    {
      type = "objectgroup",
      name = "Camada de Objetos 1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {}
    }
  }
}
