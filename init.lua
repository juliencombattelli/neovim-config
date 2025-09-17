--#############################################################################
--##### Bootstrap lazy.nvim
--#############################################################################

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

--#############################################################################
--##### General settings
--#############################################################################

-- Leader keys
vim.g.mapleader = ","
vim.g.maplocalleader = ";"

-- Show line numbers
vim.opt.number = true

-- Line wrapping
vim.opt.wrap = false

-- Bracket matching
vim.opt.showmatch = true
vim.opt.cursorline = true

-- Searching
vim.opt.hlsearch = true -- Highlight searched words
vim.opt.incsearch = true -- Incremental search highlight
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Three vertical rulers
vim.opt.colorcolumn = { 80, 100, 120 }

-- Always show signcolumn for gitgutter
vim.opt.signcolumn = "yes"

-- Helps refreshing gitgutter more frequently
vim.opt.updatetime = 1000

-- Indentation settings (overridden by local editorconfig)
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Whitespace symbols
vim.opt.list = true
vim.opt.listchars = {
    tab = "› ",
    lead = "·",
    trail = "·",
    extends = "»",
    precedes = "«",
    nbsp = "⣿",
}

-- Disable concealing for some file types
vim.g.vim_json_syntax_conceal = 0 -- quote concealing make editing json files inconvenient

-- Scrolling settings
vim.opt.scrolloff = 8
vim.opt.mouse = "a"
-- Scroll one line at a time for a smoother experience
vim.api.nvim_set_keymap("n", "<ScrollWheelUp>", "<C-Y>", { noremap = true })
vim.api.nvim_set_keymap("n", "<ScrollWheelDown>", "<C-E>", { noremap = true })

-- Ctrl+a: select all buffer
vim.api.nvim_set_keymap("n", "<C-a>", "<Esc>ggVG<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-a>", "<Esc>ggVG<CR>", { noremap = true })

--#############################################################################
--##### Plugins configuration
--#############################################################################

lazy_specs = {}

-------------------------------------------------------------------------------
--- Telescope
-------------------------------------------------------------------------------

lazy_specs.telescope = {
    "nvim-telescope/telescope.nvim",
    opts = {
        defaults = {
            layout_strategy = "vertical",
        },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
}

-------------------------------------------------------------------------------
--- indent-blankline
-------------------------------------------------------------------------------

lazy_specs.indent_blankline = {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {
            char = "│", -- one of ¦, ┆, │, ⎸, or ▏
        },
        scope = {
            enabled = false,
        },
    },
}

-------------------------------------------------------------------------------
--- Lualine
-------------------------------------------------------------------------------

vim.opt.laststatus = 2
vim.opt.showmode = false

lazy_specs.lualine = {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            theme = "vscode",
        },
    },
}

-------------------------------------------------------------------------------
--- GitSigns
-------------------------------------------------------------------------------

lazy_specs.gitsigns = {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
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
    },
}

-------------------------------------------------------------------------------
--- nvim-tree.lua
-------------------------------------------------------------------------------

-- Disable vim's builtin file explorer to avoid conflicts
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
-- <C-v> - split
-- <C-x> - vsplit

lazy_specs.nvim_tree = {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    event = "VeryLazy",
    keys = {
        { "<C-b>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree sidebar" },
    },
    opts = {
        sort_by = "case_sensitive",
        view = {
            width = 40,
        },
        filters = {
            dotfiles = false
        },
        renderer = {
            add_trailing = true,
            highlight_git = true,
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
    },
    dependencies = "nvim-tree/nvim-web-devicons",
}

-------------------------------------------------------------------------------
--- dired.nvim
-------------------------------------------------------------------------------

lazy_specs.dired = {
    "X3eRo0/dired.nvim",
    keys = {
        { "<M-b>", "<cmd>Dired<cr>", desc = "Open Dired interface" },
    },
    opts = {},
    dependencies = "MunifTanjim/nui.nvim",
}

--#############################################################################
--##### Autocommands
--#############################################################################

-- Switch to relative line number in Visual mode
-- From https://neovim.io/doc/user/autocmd.html#autocommand
--vim.cmd[[
--    au ModeChanged [vV\x16]*:* let &l:rnu = mode() =~# '^[vV\x16]'
--    au ModeChanged *:[vV\x16]* let &l:rnu = mode() =~# '^[vV\x16]'
--    au WinEnter,WinLeave * let &l:rnu = mode() =~# '^[vV\x16]'
--]]

--#############################################################################
--##### Setup lazy.nvim
--#############################################################################

require("lazy").setup({
    spec = {
        "juliencombattelli/vscode.nvim",
        "edkolev/tmuxline.vim",
        "rubberduck203/aosp-vim",
        lazy_specs.telescope,
        lazy_specs.indent_blankline,
        lazy_specs.lualine,
        lazy_specs.gitsigns,
        lazy_specs.nvim_tree,
        lazy_specs.dired,
    },
})

--#############################################################################
--##### Color scheme
--#############################################################################

-- TODO ability to switch transparency at runtime with a :ToggleTransparency user command
vim.g.transparency = true

vscode_theme_config = {
    underline_links = true,
    transparent = false,
}

if vim.g.transparency then
    vscode_theme_config = vim.tbl_extend("force", vscode_theme_config, {
        transparent = true,
        group_overrides = {
            -- Transparent mode clears the vscBack color used by the groups below
            ColorColumn = { bg = "#181818" },
            CursorColumn = { link = "ColorColumn" },
            CursorLine = { link = "ColorColumn" },
            EndOfBuffer = { link = "LineNr" },
        },
    })
end

require("vscode").setup(vscode_theme_config)

vim.cmd.colorscheme("vscode")

-- Increase the GitSigns groups contrast
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = 'Green', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = 'Yellow', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = 'Red', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsAddLn', { fg = 'NONE', bg = 'Green' })
vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { fg = 'NONE', bg = 'Yellow' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { fg = 'NONE', bg = 'Red' })

