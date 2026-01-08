local function define_colors()
  vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#b91c1c" })
  vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef" })
  vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bold = true })

  vim.fn.sign_define("DapBreakpoint", {
    text = "🔴",
    numhl = "DapBreakpoint",
  })
  vim.fn.sign_define("DapBreakpointCondition", {
    text = "🔴",
    linehl = "DapBreakpoint",
    numhl = "DapBreakpoint",
  })
  vim.fn.sign_define("DapBreakpointRejected", {
    text = "🔘",
    linehl = "DapBreakpoint",
    numhl = "DapBreakpoint",
  })
  vim.fn.sign_define("DapStopped", {
    text = "🟢",
    linehl = "DapStopped",
    numhl = "DapStopped",
  })
  vim.fn.sign_define("DapLogPoint", {
    text = "🟣",
    linehl = "DapLogPoint",
    numhl = "DapLogPoint",
  })
end

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go",
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    require("dap-go").setup()

    local dap, dapui = require("dap"), require("dapui")

    dapui.setup()
    define_colors()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set("n", "<leader>dx", function()
      require("dap").terminate()
      require("dapui").close()
    end, { desc = "Kill Debugger (with UI close)" })
  end,
  keys = {
    {
      "<leader>dt",
      function()
        require("dapui").toggle()
      end,
      desc = "Toggle Debugger UI",
    },
    { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle debugger breakpoint" },
    { "<leader>dc", "<cmd>DapContinue<cr>", desc = "Continue running debugger" },
    { "<leader>dsv", "<cmd>DapStepOver<cr>", desc = "Step over Debugger" },
    { "<leader>dsi", "<cmd>DapStepInto<cr>", desc = "Step into Debugger" },
    { "<leader>dso", "<cmd>DapStepOut<cr>", desc = "Step out Debugger" },
    { "<leader>du", "<cmd>DapToggleRepl<cr>", desc = "open Debugger Repl" },
  },
}
