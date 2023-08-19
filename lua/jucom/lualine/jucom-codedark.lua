local colors = {
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

return {
  command = {
    a = { fg = colors.black,    bg = colors.pink },
    b = { fg = colors.pink,     bg = colors.gray },
    c = { fg = colors.white,    bg = colors.black },
  },
  inactive = {
    a = { fg = colors.white,    bg = colors.gray },
    b = { fg = colors.inactive, bg = colors.darkgray },
    c = { fg = colors.inactive, bg = colors.black },
  },
  insert = {
    a = { fg = colors.white,    bg = colors.blue },
    b = { fg = colors.blue,     bg = colors.darkgray },
    c = { fg = colors.white,    bg = colors.black },
  },
  normal = {
    a = { fg = colors.white,    bg = colors.green },
    b = { fg = colors.green,    bg = colors.darkgray },
    c = { fg = colors.white,    bg = colors.black },
  },
  replace = {
    a = { fg = colors.white,    bg = colors.red },
    b = { fg = colors.red,      bg = colors.darkgray },
    c = { fg = colors.white,    bg = colors.black },
  },
  terminal = {
    a = { fg = colors.white,    bg = colors.blue },
    b = { fg = colors.blue,     bg = colors.darkgray },
    c = { fg = colors.white,    bg = colors.black },
  },
  visual = {
    a = { fg = colors.black,    bg = colors.yellow },
    b = { fg = colors.yellow,   bg = colors.darkgray },
  },
}
