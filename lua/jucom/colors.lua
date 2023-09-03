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

--[[##########################################################################]]
-- Builtin highlights
--[[##########################################################################]]

vim.api.nvim_set_hl(0, "NonText", { fg = foreground_darkest })
vim.api.nvim_set_hl(0, "LineNr", { fg = foreground_linenr, bg = background })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = foreground, bg = background })
vim.api.nvim_set_hl(0, "TabLine", { fg = foreground_darker, bg = background_darker })
vim.api.nvim_set_hl(0, "TabLineFill", { fg = foreground_darkest, bg = background_darker })
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = foreground_linenr })

--[[##########################################################################]]
-- NvimTree highlights
--[[##########################################################################]]

vim.api.nvim_set_hl(0, "NvimTreeNormal", { fg = foreground, bg = background_darker })
vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { fg = foreground_linenr, bg = background_darker })
vim.api.nvim_set_hl(0, "NvimTreeTab", { fg = foreground, bg = background_darker, bold = true })

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

