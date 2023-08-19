vim.g.gitblame_highlight_group = "NonText"

return {
  {
    "f-person/git-blame.nvim",
    lazy = true,
    event = "VeryLazy",
  }
}
