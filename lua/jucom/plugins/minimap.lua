-- Open mini.map when opening a buffer
local function open_minimap(data)
  require("mini.map").open()
end

return {
  "echasnovski/mini.map",
  version = "*",
  lazy = false, -- Must be loaded before "VimEnter" event
  config = function(_, opts)
    minimap = require("mini.map")
    opts = { -- Defined inline as mini.map's API are used
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
    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_minimap })
  end,
  dependencies = "lewis6991/gitsigns.nvim",
}
