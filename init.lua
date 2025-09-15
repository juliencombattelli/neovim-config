vim.cmd([[

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle settings
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'itchyny/lightline.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tomasiser/vim-code-dark'
Plugin 'scrooloose/nerdtree'
"Plugin 'chrisbra/Colorizer'
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'
Plugin 'rubberduck203/aosp-vim'

call vundle#end()
"filetype plugin indent on

]])

-------------------------------------------------------------------------------
--- General settings
-------------------------------------------------------------------------------

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

-------------------------------------------------------------------------------
--- Indentation settings
-------------------------------------------------------------------------------

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.list = true
vim.opt.listchars = {
    tab = "› ",
    trail = "·",
    extends = "»",
    precedes = "«",
    nbsp = "⣿",
}

-------------------------------------------------------------------------------
--- Scrolling settings
-------------------------------------------------------------------------------

vim.opt.scrolloff = 8
vim.opt.mouse = "a"
-- Scroll one line at a time for a smoother experience
vim.api.nvim_set_keymap("n", "<ScrollWheelUp>", "<C-Y>", { noremap = true })
vim.api.nvim_set_keymap("n", "<ScrollWheelDown>", "<C-E>", { noremap = true })

-------------------------------------------------------------------------------
--- Shortcuts
-------------------------------------------------------------------------------

-- Ctrl+a: select all buffer
vim.api.nvim_set_keymap("n", "<C-a>", "<Esc>ggVG<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-a>", "<Esc>ggVG<CR>", { noremap = true })

-- Ctrl+b: open NerdTree
vim.api.nvim_set_keymap("n", "<C-b>", ":NERDTreeToggle<CR>", { noremap = true })

-------------------------------------------------------------------------------
--- IndentLine
-------------------------------------------------------------------------------

vim.g.indentLine_leadingSpaceChar = "·"
vim.g.indentLine_leadingSpaceEnabled = true
vim.g.vim_json_syntax_conceal = 0

-------------------------------------------------------------------------------
--- Lightline
-------------------------------------------------------------------------------

vim.opt.laststatus = 2
vim.opt.showmode = false
vim.g.lightline = {
    colorscheme = "codedark",
    separator = {
        left = "",
        right = "",
    },
    subseparator = {
        left = "",
        right = "",
    },
}

-------------------------------------------------------------------------------
--- Color scheme
-------------------------------------------------------------------------------

-- If you don"t like many colors and prefer the conservative style of the standard Visual Studio
vim.g.codedark_conservative = 0
-- If you like the new dark modern colors (Needs feedback!)
vim.g.codedark_modern = 1
-- Activates italicized comments (make sure your terminal supports italics)
vim.g.codedark_italics = 0
-- Make the background transparent
vim.g.codedark_transparent = 1
-- If you have vim-airline, you can also enable the provided theme
vim.g.airline_theme = "codedark"
-- Might be necessary on some systems
-- set t_Co=256
-- set t_ut=
vim.cmd.colorscheme("codedark")

-------------------------------------------------------------------------------
--- Autocommands
-------------------------------------------------------------------------------

-- Switch to relative line number in Visual mode
-- From https://neovim.io/doc/user/autocmd.html#autocommand
--vim.cmd[[
--    au ModeChanged [vV\x16]*:* let &l:rnu = mode() =~# '^[vV\x16]'
--    au ModeChanged *:[vV\x16]* let &l:rnu = mode() =~# '^[vV\x16]'
--    au WinEnter,WinLeave * let &l:rnu = mode() =~# '^[vV\x16]'
--]]

