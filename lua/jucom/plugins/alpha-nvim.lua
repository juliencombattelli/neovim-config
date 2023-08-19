return {
  {
    "goolord/alpha-nvim",
    lazy = false, -- Must be loaded before "VimEnter" event
    config = function(_, opts)
      require("alpha").setup(require("alpha.themes.dashboard").config)
    end
  }
}
