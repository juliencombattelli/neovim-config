local keys = {}

local opts = {
  options = {
    -- mode = "buffers", -- set to "tabs" to only show tabpages instead

    --[[ Set in lazy config callback as it requires bufferline's style_presets
    style_preset = {
      bufferline.style_preset.no_italic,
      bufferline.style_preset.no_bold
    },
    --]]

    themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
    numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = false, -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    indicator = {
      icon = "▍", -- ▏,▎,▍,▐,▕
      style = "icon", -- "icon" | "underline" | "none",
    },

    --[[ Use default icons
    -- buffer_close_icon = "󰅖",
    -- modified_icon = "●", -- ⦁●⏺⚪
    -- close_icon = "",
    -- left_trunc_marker = "",
    -- right_trunc_marker = "",
    --]]

    --[[ No name formatter defined
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
    --]]

    max_name_length = 64,
    max_prefix_length = 32, -- prefix used when a buffer is de-duplicated
    truncate_names = true, -- whether or not tab names should be truncated
    tab_size = 0,

    --[[ No specific diagnostic settings
    diagnostics = false | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    --]]

    --[[ No specific custom filters
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
    --]]

    offsets = {
      {
        filetype = "NvimTree",
        text = "Explorer",
        highlight = "NvimTreeTab",
        text_align = "left",
        separator = "▏",
      },
      {
        filetype = "DiffviewFiles",
        text = "Explorer", -- Intentionnally same as NvimTree offset
        highlight = "NvimTreeTab", -- Intentionnally same as NvimTree offset
        text_align = "left",
        separator = "▏",
      },
    },

    color_icons = true, -- whether or not to add the filetype icon highlights
    --[[
    get_element_icon = function(element)
    -- element consists of {filetype: string, path: string, extension: string, directory: string}
    -- This can be used to change how bufferline fetches the icon
    -- for an element e.g. a buffer or a tab.
    -- e.g.
    local icon, hl = require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
    return icon, hl
    -- or
    local custom_map = {my_thing_ft: {icon = "my_thing_icon", hl}}
    return custom_map[element.filetype]
    end,
    --]]
    show_buffer_icons = true, --  whether to show filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = true,

    show_tab_indicators = true,
    show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position

    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { "|", "|" }
    separator_style = { "▏", "▏" }, -- "slant" | "slope" | "thick" | "thin" | { "any", "any" },
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    hover = {
      enabled = true,
      delay = 0,
      reveal = {"close"}
    },

    --[[ Use default sort function
    sort_by = "insert_after_current" |"insert_at_end" | "id" | "extension" | "relative_directory" | "directory" | "tabs" | function(buffer_a, buffer_b)
      -- add custom logic
      return buffer_a.modified > buffer_b.modified
    end
    --]]
  },
}

-- Enable mouseevent for bufferline hover feature
vim.opt.mousemoveevent = true

return {
  "akinsho/bufferline.nvim",
  tag = "v4.6.1",
  lazy = true,
  event = "VeryLazy",
  keys = keys,
  opts = opts,
  config = function(_, opts)
    bufferline = require("bufferline")
    opts.options.style_preset = {
      bufferline.style_preset.no_italic,
      bufferline.style_preset.no_bold
    },
    bufferline.setup(opts)
  end,
  dependencies = "nvim-tree/nvim-web-devicons"
}
