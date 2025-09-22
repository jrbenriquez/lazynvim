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
-- vim.keymap.del("n", "<S-h>")
-- vim.keymap.del("n", "<S-l>")
vim.keymap.set("n", "<leader>gtbl", ":Gitsigns toggle_current_line_blame <CR>", { desc = "Toggle Current Line Blame" })
vim.keymap.set("n", "0", "^", { desc = "Go to the first non-blank character of a line" })
vim.keymap.set("n", "^", "0", { desc = "Just in case you need to go to the very beginning of a line" })
vim.keymap.set(
  "n",
  "<leader>jsonf",
  ":%!python -m json.tool<CR>",
  { desc = "Format current buffer using Python's JSON formatter" }
)
-- vim.keymap.set("n", "<leader>fz", "<cmd>FzfLua lsp_workspace_symbols<cr>", { desc = "Workspace Symbol Search" })
vim.keymap.set("n", "<leader>we", "<Plug>VimwikiToggleListItem", { desc = "Toggles VimWiki List Item" })

-- FzfLua
vim.keymap.set("n", "<leader>fa", "<cmd>FzfLua tags<cr>", { desc = "Ctags Search FzfLua" })
vim.keymap.set("n", "<leader>fw", "<cmd>FzfLua live_grep<cr>", { desc = "Find string in cwd FzfLua" })
vim.keymap.set("n", "<leader>fz", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", { desc = "Workspace Symbol Search FzfLua" })
vim.keymap.set("n", "<leader>fd", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "Document Symbol Search FzfLua" })

vim.keymap.set("n", "<leader>fx", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd Tele" })

vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Fuzzy find files in cwd FzfLua" }) --

-- vim.keymap.set("n", "<leader>fs", "<cmd>FzfLua grep_project<cr>", { desc = "Find string under cursor in cwd" })
