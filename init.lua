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
--- IndentLine (obsolete)
-------------------------------------------------------------------------------

vim.g.indentLine_first_char = "¦"
vim.g.indentLine_showFirstIndentLevel = true
vim.g.indentLine_leadingSpaceChar = "·"
vim.g.indentLine_leadingSpaceEnabled = true
vim.g.vim_json_syntax_conceal = 0

lazy_specs.identline = {
    "Yggdroot/indentLine"
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

lualine = {}
lualine.colors = {
    black     = "#262626",
    blue      = "#0078D4",
    darkgray  = "#303030",
    gray      = "#3C3C3C",
    green     = "#149054",
    inactive  = "#666666",
    pink      = "#DDB6F2",
    red       = "#D83D2C",
    white     = "#D4D4D4",
    yellow    = "#FFAF00",
}
lualine.theme = {
    command = {
        a = { fg = lualine.colors.black,    bg = lualine.colors.pink },
        b = { fg = lualine.colors.pink,     bg = lualine.colors.gray },
        c = { fg = lualine.colors.white,    bg = lualine.colors.black },
    },
    inactive = {
        a = { fg = lualine.colors.white,    bg = lualine.colors.gray },
        b = { fg = lualine.colors.inactive, bg = lualine.colors.darkgray },
        c = { fg = lualine.colors.inactive, bg = lualine.colors.black },
    },
    insert = {
        a = { fg = lualine.colors.white,    bg = lualine.colors.blue },
        b = { fg = lualine.colors.blue,     bg = lualine.colors.darkgray },
        c = { fg = lualine.colors.white,    bg = lualine.colors.black },
    },
    normal = {
        a = { fg = lualine.colors.white,    bg = lualine.colors.green },
        b = { fg = lualine.colors.green,    bg = lualine.colors.darkgray },
        c = { fg = lualine.colors.white,    bg = lualine.colors.black },
    },
    replace = {
        a = { fg = lualine.colors.white,    bg = lualine.colors.red },
        b = { fg = lualine.colors.red,      bg = lualine.colors.darkgray },
        c = { fg = lualine.colors.white,    bg = lualine.colors.black },
    },
    terminal = {
        a = { fg = lualine.colors.white,    bg = lualine.colors.blue },
        b = { fg = lualine.colors.blue,     bg = lualine.colors.darkgray },
        c = { fg = lualine.colors.white,    bg = lualine.colors.black },
    },
    visual = {
        a = { fg = lualine.colors.black,    bg = lualine.colors.yellow },
        b = { fg = lualine.colors.yellow,   bg = lualine.colors.darkgray },
    },
}

lazy_specs.lualine = {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            theme = lualine.theme,
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
        "tomasiser/vim-code-dark",
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

-- If you don"t like many colors and prefer the conservative style of the standard Visual Studio
vim.g.codedark_conservative = 0
-- If you like the new dark modern colors (Needs feedback!)
vim.g.codedark_modern = 1
-- Activates italicized comments (make sure your terminal supports italics)
vim.g.codedark_italics = 0
-- Make the background transparent
vim.g.codedark_transparent = 0
-- Might be necessary on some systems
-- set t_Co=256
-- set t_ut=
vim.cmd.colorscheme("codedark")

-------------------------------------------------------------------------------
-- Colors closer to Dark Modern VSCode theme
-------------------------------------------------------------------------------

local background = "#1f1f1f"
local background_darker = "#181818"

local foreground = "#CCCCCC"
local foreground_linenr = "#6E7681"
local foreground_darker = "#9D9D9D"
local foreground_darkest = "#3E3E3E"

local background_diffadd = "#4C5A2C"
local background_diffadd_darker = "#383E2A"
-- VSCode does not use a color for changed lines, but reuse Add and Delete
-- We are using them for the file statuses in file side panel
local background_diffchange = "#003951"
local background_diffchange_darker = "#002230"
local background_diffdelete = "#701414"
local background_diffdelete_darker = "#4C1919"

-- Diff colors used by Lualine (not used here for now)
local foreground_lualine_diffadd = "#149054"
local foreground_lualine_diffchange = "#FFAF00"
local foreground_lualine_diffdelete = "#D83D2C"

-- Diff colors used by GitSings
local foreground_diffadd = "#009900"
local foreground_diffchange = "#BBBB00"
local foreground_diffdelete = "#FF2222"

-------------------------------------------------------------------------------
-- Builtin highlights
-------------------------------------------------------------------------------

vim.api.nvim_set_hl(0, "NonText", { fg = foreground_darkest })
vim.api.nvim_set_hl(0, "LineNr", { fg = foreground_linenr, bg = background })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = foreground, bg = background })
vim.api.nvim_set_hl(0, "TabLine", { fg = foreground_darker, bg = background_darker })
vim.api.nvim_set_hl(0, "TabLineFill", { fg = foreground_darkest, bg = background_darker })
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = foreground_linenr })
vim.api.nvim_set_hl(0, "WinBar", { fg = foreground_linenr })

