return {
  "nvim-lualine/lualine.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = {
    options = {
      theme = jucom.lualine or "auto",
    }
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim", -- For the git status highlight groups
  },
}
