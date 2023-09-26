--[[##########################################################################]]
-- Use Modern Dark variant
--[[##########################################################################]]
vim.g.codedark_modern = true

--[[##########################################################################]]
-- Apply colorscheme
--[[##########################################################################]]

vim.cmd.colorscheme(jucom.colorscheme)

--[[##########################################################################]]
-- Colors closer to Dark Modern VSCode theme
--[[##########################################################################]]

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

--[[##########################################################################]]
-- Builtin highlights
--[[##########################################################################]]

vim.api.nvim_set_hl(0, "NonText", { fg = foreground_darkest })
vim.api.nvim_set_hl(0, "LineNr", { fg = foreground_linenr, bg = background })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = foreground, bg = background })
vim.api.nvim_set_hl(0, "TabLine", { fg = foreground_darker, bg = background_darker })
vim.api.nvim_set_hl(0, "TabLineFill", { fg = foreground_darkest, bg = background_darker })
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = foreground_linenr })
vim.api.nvim_set_hl(0, "WinBar", { fg = foreground_linenr })

--[[##########################################################################]]
-- NvimTree highlights
--[[##########################################################################]]

vim.api.nvim_set_hl(0, "NvimTreeNormal", { fg = foreground, bg = background_darker })
vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { fg = foreground_linenr, bg = background_darker })
vim.api.nvim_set_hl(0, "NvimTreeTab", { fg = foreground, bg = background_darker, bold = true })
vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { link = "NonText" })

-- vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { link = "GitSignsChange" })
-- vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { link = "GitSignsStagedChange" })
-- vim.api.nvim_set_hl(0, "NvimTreeGitMerge", { link = "" })
-- vim.api.nvim_set_hl(0, "NvimTreeGitRenamed", { link = "GitSignsChange" })
-- vim.api.nvim_set_hl(0, "NvimTreeGitNew", { link = "GitSignsUntracked" })
-- vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { link = "GitSignsDelete" })

--[[##########################################################################]]
-- GitSigns highlights
--[[##########################################################################]]

vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = foreground_diffadd })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = foreground_diffchange })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = foreground_diffdelete })

--[[##########################################################################]]
-- Diffview highlights
--[[##########################################################################]]

-- Diffed lines colors in main window
vim.api.nvim_set_hl(0, "DiffAdd", { bg = background_diffadd_darker })
vim.api.nvim_set_hl(0, "DiffDelete", { bg = background_diffdelete_darker })
vim.api.nvim_set_hl(0, "DiffviewDiffAddText", { bg = background_diffadd }) -- Hl defined specifically for diffview.lua view_post_layout hook
vim.api.nvim_set_hl(0, "DiffviewDiffAddAsDeleteText", { bg = background_diffdelete }) -- Hl defined specifically for diffview.lua view_post_layout hook
-- Fill chars for non existing lines in main window
vim.api.nvim_set_hl(0, "DiffviewDiffDeleteDim", { fg = foreground_darkest })
-- Insertion/Deletion count for each file in file panel
vim.api.nvim_set_hl(0, "DiffviewFilePanelInsertions", { fg = background_diffadd })
vim.api.nvim_set_hl(0, "DiffviewFilePanelDeletions", { fg = background_diffdelete })
-- File status color in file panel
vim.api.nvim_set_hl(0, "DiffviewStatusAdded", { fg = background_diffadd, bold = true })
vim.api.nvim_set_hl(0, "DiffviewStatusUntracked", { fg = background_diffadd, bold = true })
vim.api.nvim_set_hl(0, "DiffviewStatusModified", { fg = background_diffchange, bold = true })
vim.api.nvim_set_hl(0, "DiffviewStatusRenamed", { fg = background_diffchange, bold = true })
vim.api.nvim_set_hl(0, "DiffviewStatusDeleted", { fg = background_diffdelete, bold = true })
vim.api.nvim_set_hl(0, "DiffviewStatusBroken", { fg = background_diffdelete, bold = true })
vim.api.nvim_set_hl(0, "DiffviewStatusUnknown", { fg = background_diffdelete, bold = true })
-- Background for side panels
vim.api.nvim_set_hl(0, "DiffviewNormal", { link = "NvimTreeNormal" })

--[[##########################################################################]]
-- mini.map highlights
--[[##########################################################################]]

vim.api.nvim_set_hl(0, "MiniMapNormal", { fg = foreground_linenr })
vim.api.nvim_set_hl(0, "MiniMapSymbolCount", { fg = foreground_linenr })
vim.api.nvim_set_hl(0, "MiniMapSymbolLine", { fg = foreground_darkest })
vim.api.nvim_set_hl(0, "MiniMapSymbolView", { fg = foreground_darkest })

--[[##########################################################################]]
-- Bufferline highlights
--[[##########################################################################]]

vim.api.nvim_set_hl(0, "BufferLineTruncMarker", { link = "TabLine" })
--
vim.api.nvim_set_hl(0, "BufferLineFill", { link = "TabLineFill" })
--
vim.api.nvim_set_hl(0, "BufferLineGroupSeparator", { link = "TabLineFill" })
vim.api.nvim_set_hl(0, "BufferLineGroupLabel", { link = "TabLineFill" })
--
vim.api.nvim_set_hl(0, "BufferLineTab", { link = "TabLine" })
vim.api.nvim_set_hl(0, "BufferLineTabSelected", { link = "TabLineSel" })
--
vim.api.nvim_set_hl(0, "BufferLineTabClose", { link = "TabLine" })
vim.api.nvim_set_hl(0, "BufferLineCloseButton", { link = "TabLine" })
vim.api.nvim_set_hl(0, "BufferLineCloseButtonVisible", { link = "TabLine" })
vim.api.nvim_set_hl(0, "BufferLineCloseButtonSelected", { link = "TabLineSel" })
--
vim.api.nvim_set_hl(0, "BufferLineBackground", { link = "TabLine" })
vim.api.nvim_set_hl(0, "BufferLineBuffer", { link = "TabLine" })
vim.api.nvim_set_hl(0, "BufferLineBufferVisible", { link = "TabLine" })
vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { link = "TabLineSel" })
--
vim.api.nvim_set_hl(0, "BufferLineNumbers", { link = "TabLine" })
vim.api.nvim_set_hl(0, "BufferLineNumbersVisible", { link = "TabLine" })
vim.api.nvim_set_hl(0, "BufferLineNumbersSelected", { link = "TabLineSel" })
--
vim.api.nvim_set_hl(0, "BufferLineModified", { link = "TabLine" })
vim.api.nvim_set_hl(0, "BufferLineModifiedVisible", { link = "TabLine" })
vim.api.nvim_set_hl(0, "BufferLineModifiedSelected", { link = "TabLineSel" })
--
vim.api.nvim_set_hl(0, "BufferLineSeparator", { link = "TabLineFill" })
vim.api.nvim_set_hl(0, "BufferLineSeparatorVisible", { link = "TabLineFill" })
vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { link = "TabLineFill" })
--
vim.api.nvim_set_hl(0, "BufferLineTabSeparator", { link = "TabLineFill" })
vim.api.nvim_set_hl(0, "BufferLineTabSeparatorSelected", { link = "TabLineFill" })
--
vim.api.nvim_set_hl(0, "BufferLineIndicatorVisible", { link = "TabLine" })
vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { link = "TabLine" }) -- overriden dynamically by the autocmd below
--
vim.api.nvim_set_hl(0, "BufferLineOffsetSeparator", { link = "TabLineFill" })

lualine_get_mode_suffix = require("lualine.highlight").get_mode_suffix
vim.api.nvim_create_autocmd({"ModeChanged", "BufEnter"}, {
  callback = function()
    local hi = vim.api.nvim_get_hl(0, {
        name = "lualine_a" .. lualine_get_mode_suffix()
    })
    if not hi or not hi.bg then
        return
    end
    vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", {
        fg = ("#%06x"):format(hi.bg)
    })
  end,
})
