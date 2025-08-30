return {
  { "junegunn/fzf", build = "./install --bin" },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({
        lsp = {
          live_workspace_symbols = {
            fzf_opts = {
              ["--tiebreak"] = "length", -- sorts by index/relevance for better scoring
            },
          },
        },
      })


      -- set keymaps
      local keymap = vim.keymap -- for conciseness

      -- keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Fuzzy find files in cwd" }) --
      keymap.set("n", "<leader>fw", "<cmd>FzfLua live_grep<cr>", { desc = "Find string in cwd" })
      keymap.set(
        "n",
        "<leader>fz",
        "<cmd>FzfLua lsp_live_workspace_symbols<cr>",
        { desc = "Workspace Symbol Search" }
      )

      keymap.set("n", "<leader>fs", "<cmd>FzfLua grep_project<cr>", { desc = "Find string under cursor in cwd" })
      keymap.set("n", "<leader>fd", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "Document Symbol Search" })
      keymap.set("n", "<leader>fa", "<cmd>FzfLua tags<cr>", { desc = "Ctags Search" })
      end
  }
}
