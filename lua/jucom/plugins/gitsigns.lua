local opts = {
  signcolumn = true,
  numhl      = false,
  linehl     = false,
  word_diff  = false,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 100,
    ignore_whitespace = false,
  },
}

return {
  "lewis6991/gitsigns.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = opts,
}
