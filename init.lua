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

-- Ctrl+b: open NerdTree
vim.api.nvim_set_keymap("n", "<C-b>", ":NERDTreeToggle<CR>", { noremap = true })

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
        "scrooloose/nerdtree",
        "airblade/vim-gitgutter", -- TODO use gitsigns?
        "rubberduck203/aosp-vim",
        lazy_specs.telescope,
        lazy_specs.indent_blankline,
        lazy_specs.lualine,
    },
})

--#############################################################################
--##### Color scheme
--#############################################################################

require("vscode").setup({
    transparent = true,
    underline_links = true,
    group_overrides = {
        -- Transparent mode clears the vscBack color used by the groups below
        ColorColumn = { bg = "#181818" },
        CursorColumn = { link = "ColorColumn" },
        CursorLine = { link = "ColorColumn" },
        EndOfBuffer = { link = "LineNr" },
    },
})

vim.cmd.colorscheme("vscode")

