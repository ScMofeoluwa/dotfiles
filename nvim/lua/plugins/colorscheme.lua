return {
  -- add onedark
  { "ellisonleao/gruvbox.nvim" },

  { "dracula/vim" },
  { "shaunsingh/nord.nvim" },
  { "olimorris/onedarkpro.nvim" },

  -- Configure LazyVim to load onedark
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
