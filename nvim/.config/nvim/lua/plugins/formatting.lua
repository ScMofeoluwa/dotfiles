return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.javascript = { "prettierd", "prettier", stop_after_first = true }
      opts.formatters_by_ft.typescript = { "prettierd", "prettier", stop_after_first = true }
      opts.formatters_by_ft.javascriptreact = { "prettierd", "prettier", stop_after_first = true }
      opts.formatters_by_ft.typescriptreact = { "prettierd", "prettier", stop_after_first = true }
      opts.formatters_by_ft.json = { "prettierd", "prettier", stop_after_first = true }
      opts.formatters_by_ft.css = { "prettierd", "prettier", stop_after_first = true }
      opts.formatters_by_ft.html = { "prettierd", "prettier", stop_after_first = true }
      opts.formatters_by_ft.markdown = { "prettierd", "prettier", stop_after_first = true }
    end,
  },
}
