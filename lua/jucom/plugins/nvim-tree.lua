-- disable netrw to avoid conflicts
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Main Shortcuts:
-- <leader><C-e> - toggle tree with current file selected
-- a - create a file or directory
-- d - remove a file or directory
-- r - rename a file or directory

-- <CR> - expand dir / open file
-- W - collapse
-- E - expand recursively
--
-- <C-v> - split
-- <C-x> - vsplit

local opts = {
  sort_by = "case_sensitive",
  view = {
    width = 40,
  },
  filters = {
    dotfiles = false
  },
  renderer = {
    add_trailing = true,
    -- highlight_git = true,
    highlight_opened_files = "name",
    highlight_modified = "name",
    indent_markers = {
      enable = true,
      icons = {
        corner = "│",
        edge = "│",
        item = "│",
        bottom = "│",
        none = " ",
      },
    },
    icons = {
      git_placement = "signcolumn",
      glyphs = {
        folder = {
          arrow_closed = "",
          arrow_open = "",
        },
      },
    },
  },
  git = {
    enable = true,
    ignore = false
  }
}

local keys = {
  { "<C-b>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree sidebar" },
}

-- Open file explorer on Nvim startup
local function open_nvim_tree(data)
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
  if no_name then
    return
  end
  local directory = vim.fn.isdirectory(data.file) == 1
  if directory then
    vim.cmd.cd(data.file)
  end
  require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
  if directory then
    require("alpha").start()
    require("nvim-tree.api").tree.focus()
  end
end

return {
  "nvim-tree/nvim-tree.lua",
  lazy = false, -- Must be loaded before "VimEnter" event
  keys = keys,
  opts = opts,
  config = function(_, opts)
    require("nvim-tree").setup(opts)
    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
  end,
  dependencies = "nvim-tree/nvim-web-devicons",
}
