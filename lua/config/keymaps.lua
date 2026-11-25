-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>ow", function()
  local file = vim.fn.expand("%:p")
  vim.ui.open(file)
  print("Opened " .. file)
end, { desc = "Open current file in Web Browser" })

-- Move forward (right) in insert mode using Ctrl+l
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move forward in insert mode", remap = false })

-- Use Ctrl + b to move cursor down in insert mode
vim.keymap.set("i", "<C-b>", "<Down>", { desc = "Move cursor down" })

-- Map Ctrl + f to move left in Insert mode
vim.keymap.set("i", "<C-f>", "<Left>", { desc = "Move left" })

-- Map Alt + e to move to end of line in Insert mode
vim.keymap.set("i", "<A-e>", "<End>", { desc = "Move to the end of line" })
