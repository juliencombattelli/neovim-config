-- Cursor settings
-- All: blinking
-- Normal/Visual: █
-- Insert: |
-- Replace: _
vim.opt.guicursor =
  "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"..
  ",a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"..
  ",sm:block-blinkwait175-blinkoff150-blinkon175"

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = false

-- Enable cursor line
vim.opt.cursorline = true

-- Spacing
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- vim.opt.smartindent = true

-- Reduce the swap update time
-- Mainly for the gitgutter (replaced by gitsigns)
-- vim.opt.updatetime = 20

-- Undoing
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undodir"

-- Bracket matching
vim.opt.showmatch = true

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Colors
vim.opt.termguicolors = true

-- Editor whitespaces
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "tab:›"
-- vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "nbsp:⣿"

-- Window whitespaces
vim.opt.fillchars:append "vert:▏" -- █

-- Diff deleted lines whitespaces
vim.opt.fillchars:append "diff:╱"

-- Keep 8 lines above and below cursor when scrolling
vim.opt.scrolloff = 8

-- Always show the sign column for git statues and other symbols
vim.opt.signcolumn = "yes"

-- Vertical rulers
vim.opt.colorcolumn = "80,100,120"

-- Enable system clipboard on WSL
-- Refer to https://neovim.io/doc/user/provider.html#clipboard-wsl
if vim.fn.has("wsl") == "0" then
  vim.cmd[[ let g:clipboard = {
    \   'name': 'WslClipboard',
    \   'copy': {
    \      '+': 'clip.exe',
    \      '*': 'clip.exe',
    \    },
    \   'paste': {
    \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    \   },
    \   'cache_enabled': 0,
    \ } ]]
end

-- Autocommand to switch to relative line number in Visual mode
-- From https://neovim.io/doc/user/autocmd.html#autocommand
vim.cmd[[
  au ModeChanged [vV\x16]*:* let &l:rnu = mode() =~# '^[vV\x16]'
  au ModeChanged *:[vV\x16]* let &l:rnu = mode() =~# '^[vV\x16]'
  au WinEnter,WinLeave * let &l:rnu = mode() =~# '^[vV\x16]'
]]
