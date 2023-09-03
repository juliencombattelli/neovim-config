vim.g.gitblame_highlight_group = "NonText"

-- Must be higher than colorizer priority (not implemented upstream for now)
vim.g.gitblame_set_extmark_options = { priority = 100 }

return {
  "f-person/git-blame.nvim",
  lazy = true,
  event = "VeryLazy",
}
