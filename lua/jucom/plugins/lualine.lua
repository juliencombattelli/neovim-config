return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
      options = {
        theme = jucom.lualine or "auto",
      }
    },
    dependencies = "vim-gitgutter" -- For the git status highlight groups
  }
}
