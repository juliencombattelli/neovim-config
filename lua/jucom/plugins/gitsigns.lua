return {
  -- Required for mini.map git integration
  "lewis6991/gitsigns.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = {
    signcolumn = false,
    numhl      = false,
    linehl     = false,
    word_diff  = false,
  }
  -- config = function(_, opts)
  --   require('gitsigns').setup()
  -- end,
}
