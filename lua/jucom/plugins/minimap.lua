return {
  "echasnovski/mini.map",
  version = "*",
  lazy = true,
  event = "VeryLazy",
  opts = {},
  config = function(_, opts)
    minimap = require("mini.map")
    opts = {
      integrations = {
        minimap.gen_integration.builtin_search(),
        minimap.gen_integration.gitsigns(),
        minimap.gen_integration.diagnostic(),
      },
      symbols = {
        encode = minimap.gen_encode_symbols.dot("4x2"),
      },
    }
    minimap.setup(opts)
  end,
}
