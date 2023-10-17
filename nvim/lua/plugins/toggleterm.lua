return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      start_in_insert = true,
      shade_terminals = false,
      shell = "zsh --login",
    })
  end,
  keys = {
    { [[<C-\>]] },
    {
      "<leader>tc",
      "<cmd>ToggleTerm size=40 direction=vertical<cr>",
      desc = "Open a vertical terminal at the Desktop directory",
    },
  },
}
