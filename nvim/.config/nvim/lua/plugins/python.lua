return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoImportCompletions = true,
                -- typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
              },
            },
          },
        },
      },
      setup = {
        pyright = function(_, opts)
          local venv = vim.fn.finddir(".venv", vim.fn.getcwd() .. ";")
          if venv ~= "" then
            opts.settings.python.pythonPath = venv .. "/bin/python"
          end
        end,
      },
    },
  },
}
