local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
-- Goto next diagnostic of any severity
keymap.set("n", "]d", function()
  vim.diagnostic.goto_next({})
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous diagnostic of any severity
keymap.set("n", "[d", function()
  vim.diagnostic.goto_prev({})
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto next error diagnostic
keymap.set("n", "]e", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous error diagnostic
keymap.set("n", "[e", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto next warning diagnostic
keymap.set("n", "]w", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous warning diagnostic
keymap.set("n", "[w", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Fast saving
keymap.set("n", "<Leader>w", ":write!<CR>", opts)
keymap.set("n", "<Leader>q", ":q!<CR>", opts)

-- Exit on jj
keymap.set("i", "jj", "<ESC>", opts)

-- Move to start/end of line
keymap.set({ "n", "x", "o" }, "H", "^", opts)
keymap.set({ "n", "x", "o" }, "L", "$", opts)

-- Half-page jumping with centering
-- keymap.set("n", "<C-d>", "<C-d>zz", opts)
-- keymap.set("n", "<C-u>", "<C-u>zz", opts)
--
-- keymap.set("v", "<C-d>", "<C-d>zz", opts)
-- keymap.set("v", "<C-u>", "<C-u>zz", opts)

-- Fast searching
keymap.set("n", "<Leader>f", "<cmd>Telescope find_files<cr>", opts)

-- Remap for dealing with visual line wraps
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
