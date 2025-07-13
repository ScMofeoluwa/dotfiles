return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvimtools/none-ls-extras.nvim",
    },
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      local null_ls = require("null-ls")
      local eslint = require("none-ls.diagnostics.eslint_d")
      local eslint_fmt = require("none-ls.formatting.eslint_d")

      null_ls.setup({
        on_attach = function(client)
          if client.name == "null-ls" then
            vim.api.nvim_create_autocmd("BufWritePre", {
              pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
              callback = function()
                vim.lsp.buf.format({
                  async = false,
                  filter = function(c)
                    return c.name == "null-ls"
                  end,
                })
              end,
            })
          end
        end,
        sources = {
          null_ls.builtins.formatting.prettier.with({
            condition = function(utils)
              return utils.root_has_file({ ".prettierrc", ".prettierrc.json", ".prettierrc.js" })
            end,
          }),
          eslint,
          eslint_fmt.with({
            command = "eslint_d",
            args = { "--fix-to-stdout", "--stdin", "--stdin-filename", "$FILENAME" },
          }),
        },
      })
    end,
  },
}
