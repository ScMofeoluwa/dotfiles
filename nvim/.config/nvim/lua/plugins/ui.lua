return {
  {
    "LazyVim/LazyVim",
    opts = {
      icons = {
        diagnostics = {
          Error = " ",
          Warn = " ",
          Hint = " ",
          Info = " ",
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        float = {
          source = "if_many",
          style = "minimal",
          border = "rounded",
          header = "",
          prefix = "",
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰠠 ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
      },
      servers = {
        vtsls = {
          root_dir = function(bufnr, on_dir)
            local root = vim.fs.root(bufnr, { "tsconfig.json", "jsconfig.json", "package.json" })
              or vim.fs.root(bufnr, { "pnpm-lock.yaml", "yarn.lock", "package-lock.json", "bun.lock", ".git" })
              or vim.fn.getcwd()

            if on_dir then
              on_dir(root)
            else
              return root
            end
          end,
          settings = {
            typescript = {
              tsserver = {
                maxTsServerMemory = 4096,
              },
              preferences = {
                disableAutomaticTypingAcquisition = true,
              },
              inlayHints = {
                parameterNames = { enabled = "all" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
              implementationsCodeLens = { enabled = false },
              referencesCodeLens = { enabled = false },
            },
            javascript = {
              inlayHints = {
                parameterNames = { enabled = "all" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
              implementationsCodeLens = { enabled = false },
              referencesCodeLens = { enabled = false },
            },
          },
        },
        ts_ls = { enabled = false },
        ruff = {},
      },
      inlay_hints = {
        enabled = false,
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        -- separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  {
    "michaeldyrynda/carbon",
    config = function()
      -- vim.cmd("colorscheme carbon")
    end,
  },

  {
    "sainnhe/gruvbox-material",
    enabled = true,
    config = function()
      vim.api.nvim_set_var("gruvbox_material_foreground", "mix")
      vim.api.nvim_set_var("gruvbox_material_background", "hard")
      vim.api.nvim_set_var("gruvbox_material_ui_contrast", "high")
      vim.api.nvim_set_var("gruvbox_material_float_style", "bright")
      vim.api.nvim_set_var("gruvbox_material_statusline_style", "material")
      -- vim.api.nvim_set_var("gruvbox_material_transparent_background", 1)
      vim.cmd.colorscheme("gruvbox-material")
    end,
    priority = 1000,
  },
  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "meuter/lualine-so-fancy.nvim",
    },
    enabled = true,
    lazy = false,
    event = { "BufReadPost", "BufNewFile", "VeryLazy" },
    config = function()
      local icons = require("config.icons")
      require("lualine").setup({
        options = {
          theme = "gruvbox-material",
          globalstatus = true,
          icons_enabled = true,
          -- component_separators = { left = "│", right = "│" },
          component_separators = { left = icons.ui.DividerRight, right = icons.ui.DividerLeft },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {
              "alfa-nvim",
              "help",
              "neo-tree",
              "Trouble",
              "spectre_panel",
              "toggleterm",
            },
            winbar = {},
          },
        },
        sections = {
          lualine_a = {},
          lualine_b = {
            "fancy_branch",
          },
          lualine_c = {
            {
              "filename",
              path = 1, -- 2 for full path
              symbols = {
                modified = "  ",
                -- readonly = "  ",
                -- unnamed = "  ",
              },
            },
            {
              "fancy_diagnostics",
              sources = { "nvim_lsp" },
              symbols = { error = " ", warn = " ", info = " " },
            },
            { "fancy_searchcount" },
          },
          lualine_x = {
            "fancy_lsp_servers",
            "fancy_diff",
            "progress",
          },
          lualine_y = {},
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          -- lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = { "neo-tree", "lazy" },
      })
    end,
  },
  {
    "goolord/alpha-nvim",
    enabled = true,
    event = "VimEnter",
    lazy = true,
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      -- local logo = [[
      -- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
      -- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
      -- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
      -- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
      -- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
      -- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
      -- ]]
      --
      local logo = [[

       ███╗   ███╗  ██████╗  ███████╗ ███████╗  ██████╗  ██╗      ██╗   ██╗ ██╗    ██╗  █████╗
       ████╗ ████║ ██╔═══██╗ ██╔════╝ ██╔════╝ ██╔═══██╗ ██║      ██║   ██║ ██║    ██║ ██╔══██╗
       ██╔████╔██║ ██║   ██║ ██████╗  ██████╗  ██║   ██║ ██║      ██║   ██║ ██║ █╗ ██║ ███████║
       ██║╚██╔╝██║ ██║   ██║ ██╔═══╝  ██╔═══╝  ██║   ██║ ██║      ██║   ██║ ██║███╗██║ ██╔══██║
       ██║ ╚═╝ ██║ ╚██████╔╝ ██║      ███████╗ ╚██████╔╝ ███████╗ ╚██████╔╝ ╚███╔███╔╝ ██║  ██║
       ╚═╝     ╚═╝  ╚═════╝  ╚═╝      ╚══════╝  ╚═════╝  ╚══════╝  ╚═════╝   ╚══╝╚══╝  ╚═╝  ╚═╝
    ]]

      dashboard.section.header.val = vim.split(logo, "\n")
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("s", " " .. "Restore Session", '<cmd>lua require("persistence").load()<cr>'),
        dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/ <CR>"),
        dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,
    config = function(_, dashboard)
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
}
