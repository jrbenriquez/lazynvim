return {
  "stevearc/conform.nvim",
  opts = {
    format = {
      timeout_ms = 3000,
      async = false, -- not recommended to change
      quiet = false, -- not recommended to change
    },
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      python = { "ruff_format" },
      html = { { "prettierd", "prettier" } },
      json = { { "prettierd", "prettier" } },
      htmldjango = { { "prettierd", "prettier" }, "djlint" },
      -- Use a sub-list to run only the first available formatter
      javascript = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      typescriptreact = { { "prettierd", "prettier" } },
      xml = { "xmlformatter" },
    },
  },
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      -- Disable with a global or buffer-local variable
      return
    end
    return { timeout_ms = 500, lsp_fallback = true }
  end,
}
