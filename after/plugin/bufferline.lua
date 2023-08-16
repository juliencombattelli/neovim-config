-- termguicolors already set in sets.lua

local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

-- bufferline.setup {
--     options = {
--         -- themable = true,
--         -- style_preset = {
--         --     bufferline.style_preset.no_italic,
--         --     bufferline.style_preset.no_bold
--         -- },
--         -- numbers = "none", -- ordinal
--         -- diagnostics = "nvim_lsp",
--         -- separator_style = "thin",
--         -- indicator = {
--         --     style = "underline",
--         --     -- icon = "▎" --▎
--         -- },
--         modified_icon = "⚪", -- ⦁●⏺⚪
--         buffer_close_icon = "🞪",
--         offsets = {
--             {
--                 filetype = "NvimTree",
--                 text = "File Explorer",
--                 highlight = "Directory",
--                 separator = true -- use a "true" to enable the default, or set your own character
--             }
--         }
--     }
-- }

vim.opt.mousemoveevent = true

--[[
options = {
  mode = "buffers", -- set to "tabs" to only show tabpages instead
  style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
  themable = true | false, -- allows highlight groups to be overriden i.e. sets highlights as default
  numbers = "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
  close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
  right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
  left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
  middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
  indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'icon' | 'underline' | 'none',
  },
  buffer_close_icon = '󰅖',
  modified_icon = '●',
  close_icon = '',
  left_trunc_marker = '',
  right_trunc_marker = '', 
  --- name_formatter can be used to change the buffer's label in the bufferline.
  --- Please note some names can/will break the
  --- bufferline so use this at your discretion knowing that it has
  --- some limitations that will *NOT* be fixed.
  name_formatter = function(buf)  -- buf contains:
        -- name                | str        | the basename of the active file
        -- path                | str        | the full path of the active file
        -- bufnr (buffer only) | int        | the number of the active buffer
        -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
        -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
  end,
  max_name_length = 18,
  max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
  truncate_names = true, -- whether or not tab names should be truncated
  tab_size = 18,
  diagnostics = false | "nvim_lsp" | "coc",
  diagnostics_update_in_insert = false,
  -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
  diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
  end,
  -- NOTE: this will be called a lot so don't do any heavy processing here
  custom_filter = function(buf_number, buf_numbers)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
          return true
      end
      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
          return true
      end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
          return true
      end
      -- filter out by it's index number in list (don't show first buffer)
      if buf_numbers[1] ~= buf_number then
          return true
      end
  end,
  offsets = {
      {
          filetype = "NvimTree",
          text = "File Explorer" | function ,
          text_align = "left" | "center" | "right"
          separator = true
      }
  },
  color_icons = true | false, -- whether or not to add the filetype icon highlights
  get_element_icon = function(element)
    -- element consists of {filetype: string, path: string, extension: string, directory: string}
    -- This can be used to change how bufferline fetches the icon
    -- for an element e.g. a buffer or a tab.
    -- e.g.
    local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
    return icon, hl
    -- or
    local custom_map = {my_thing_ft: {icon = "my_thing_icon", hl}}
    return custom_map[element.filetype]
  end,
  show_buffer_icons = true | false, -- disable filetype icons for buffers
  show_buffer_close_icons = true | false,
  show_close_icon = true | false,
  show_tab_indicators = true | false,
  show_duplicate_prefix = true | false, -- whether to show duplicate buffer prefix
  persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
  move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
  -- can also be a table containing 2 custom separators
  -- [focused and unfocused]. eg: { '|', '|' }
  separator_style = "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
  enforce_regular_tabs = false | true,
  always_show_bufferline = true | false,
  hover = {
      enabled = true,
      delay = 200,
      reveal = {'close'}
  },
  sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
      -- add custom logic
      return buffer_a.modified > buffer_b.modified
  end
}
--]]

local tabline = {
  fg = { attribute = "fg", highlight = "TabLine" },
  bg = { attribute = "bg", highlight = "TabLine" },
}

local tablinesel = {
  fg = { attribute = "fg", highlight = "TabLineSel" },
  bg = { attribute = "bg", highlight = "TabLineSel" },
}

local tablinefill = {
  fg = { attribute = "fg", highlight = "TabLineFill" },
  bg = { attribute = "bg", highlight = "TabLineFill" },
}

-- Colored selected tabeline indicator
-- TODO take from TabLineIndicator if available
local tablinesepsel = {
  fg = { attribute = "fg", highlight = "Directory" },
  bg = { attribute = "bg", highlight = "TabLineSel" },
}

bufferline.setup {
  options = {
    hover = {
      enabled = true,
      delay = 0,
      reveal = {'close'}
    },
    themable = true,
    style_preset = {
      bufferline.style_preset.no_italic,
      bufferline.style_preset.no_bold
    },
    numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = false, -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    indicator = {
      icon = "▍", -- ▏,▎,▍,▐,▕
      style = "icon", -- 'icon' | 'underline' | 'none',
    },
    separator_style = { "▏", "▏" }, -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
    -- buffer_close_icon = "",
    -- buffer_close_icon = '',
    -- modified_icon = "●",
    -- close_icon = "",
    -- close_icon = '',
    -- left_trunc_marker = "",
    -- right_trunc_marker = "",
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    -- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
    --   -- remove extension from markdown files for example
    --   if buf.name:match('%.md') then
    --     return vim.fn.fnamemodify(buf.name, ':t:r')
    --   end
    -- end,
    max_name_length = 64,
    max_prefix_length = 32, -- prefix used when a buffer is de-duplicated
    tab_size = 4,
    diagnostics = false, -- | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    --   return "("..count..")"
    -- end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    -- custom_filter = function(buf_number)
    --   -- filter out filetypes you don't want to see
    --   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
    --     return true
    --   end
    --   -- filter out by buffer name
    --   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
    --     return true
    --   end
    --   -- filter out based on arbitrary rules
    --   -- e.g. filter out vim wiki buffer from tabline in your work repo
    --   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
    --     return true
    --   end
    -- end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "Explorer",
        highlight = "NvimTreeTab",
        text_align = "left",
        separator = "▏",
      },
    },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
    --   -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end
  },
}

-- Keybindings
local map = vim.keymap.set
local opts = {noremap = true, silent = true}

map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts)
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts)
map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts)
map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts)
map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts)
map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opts)
map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opts)
map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opts)
map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opts)
map("n", "<leader>$", ":BufferLineGoToBuffer -1<CR>", opts)
