-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "th", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "tl", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "nl", "i<CR><ESC>", { desc = "Break current line where the cursor is" })
vim.keymap.set("n", "<leader>a", ":w<CR>", { desc = "Save file" })
