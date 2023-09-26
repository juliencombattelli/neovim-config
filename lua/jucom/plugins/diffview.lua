local opts = {
  enhanced_diff_hl = true,
  view = {
    default = {
      layout = "diff2_horizontal",
      winbar_info = true,
    },
    file_history = {
      layout = "diff2_horizontal",
      winbar_info = true,
    },
  },
  hooks = {
    view_post_layout = function(view)
      config = require("diffview.config")
      if config.get_config().enhanced_diff_hl then
        -- Align rendering of `changed` lines with VSCode:
        --   - in win a (old): changed lines appears as deleted
        --   - in win b (new): changed lines appears as added
        -- Original code is kept as reference
        view.winopts.diff2.a.winhl = {
          "DiffAdd:DiffviewDiffAddAsDelete",
          "DiffDelete:DiffviewDiffDeleteDim",
          -- "DiffChange:DiffviewDiffChange",
          "DiffChange:DiffviewDiffAddAsDelete",
          -- "DiffText:DiffviewDiffText",
          "DiffText:DiffviewDiffAddAsDeleteText",
        }
        view.winopts.diff2.b.winhl = {
          "DiffDelete:DiffviewDiffDeleteDim",
          "DiffAdd:DiffviewDiffAdd",
          -- "DiffChange:DiffviewDiffChange",
          "DiffChange:DiffviewDiffAdd",
          -- "DiffText:DiffviewDiffText",
          "DiffText:DiffviewDiffAddText",
        }
      end
    end
  },
}

local keys = {
--  { "<C-b>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree sidebar" },
}

return {
  "sindrets/diffview.nvim",
  lazy = true, -- Must be loaded before "VimEnter" event
  event = "VeryLazy",
  keys = keys,
  opts = opts,
  --config = function(_, opts)
  --  require("nvim-tree").setup(opts)
  --  vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
  --end,
  dependencies = "nvim-tree/nvim-web-devicons",
}
