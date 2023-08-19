jucom = {
  -- Codedark color scheme definition with some adaptation to make it closer to Modern Dark VSCode theme
  colorscheme = "codedark",
  -- Force lualine theme
  lualine = require("jucom.lualine.jucom-codedark"),
}

require("common.lazy-bootstrap")
require("lazy").setup("jucom.plugins")

require("jucom.remap")
require("jucom.set")
require("jucom.colors")
