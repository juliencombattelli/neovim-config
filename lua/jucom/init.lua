jucom = {
  -- Codedark color scheme definition with some adaptation to make it closer to Modern Dark VSCode theme
  colorscheme = "codedark",
  -- Force lualine theme
  lualine = require("jucom.lualine.jucom-codedark"),
}

lazy_bootstrap = require("common.lazy-bootstrap")
require("lazy").setup("jucom.plugins", lazy_bootstrap.opt)

require("common.remap")
require("common.set")
require("common.colors")
