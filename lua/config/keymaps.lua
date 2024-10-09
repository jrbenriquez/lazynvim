-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "th", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "tl", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "nl", "i<CR><ESC>", { desc = "Break current line where the cursor is" })
vim.keymap.set("n", "<leader>a", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>bt", ":ToggleTerm direction=float <CR>", { desc = "Open terminal" })
vim.keymap.set("n", "<leader>bT", ":ToggleTerm direction=horizontal <CR>", { desc = "Open horizontal terminal split" })
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")
vim.keymap.set("n", "<leader>gtbl", ":Gitsigns toggle_current_line_blame <CR>", { desc = "Toggle Current Line Blame" })
