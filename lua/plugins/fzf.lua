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
    end,
  },
}
