local colors = {
  black     = "#262626",
  blue      = "#0078D4",
  gray      = "#3C3C3C",
  green     = "#147554",
  inactive  = "#666666",
  pink      = "#DDB6F2",
  red       = "#D83D2C",
  white     = "#D4D4D4",
  yellow    = "#FFAF00",
}

return {
  command = {
    a = { fg = colors.black,    bg = colors.pink },
    b = { fg = colors.pink,     bg = colors.black },
    c = { fg = colors.white,    bg = colors.black },
  },
  inactive = {
    a = { fg = colors.white,    bg = colors.gray },
    b = { fg = colors.inactive, bg = colors.black },
    c = { fg = colors.inactive, bg = colors.black },
  },
  insert = {
    a = { fg = colors.white,    bg = colors.blue },
    b = { fg = colors.blue,     bg = colors.black },
    c = { fg = colors.white,    bg = colors.black },
  },
  normal = {
    a = { fg = colors.white,    bg = colors.green },
    b = { fg = colors.green,    bg = colors.black },
    c = { fg = colors.white,    bg = colors.black },
  },
  replace = {
    a = { fg = colors.white,    bg = colors.red },
    b = { fg = colors.red,      bg = colors.black },
    c = { fg = colors.white,    bg = colors.black },
  },
  terminal = {
    a = { fg = colors.white,    bg = colors.blue },
    b = { fg = colors.blue,     bg = colors.black },
    c = { fg = colors.white,    bg = colors.black },
  },
  visual = {
    a = { fg = colors.black,    bg = colors.yellow },
    b = { fg = colors.yellow,   bg = colors.black },
  },
}
