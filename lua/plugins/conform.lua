return {
  "stevearc/conform.nvim",
  opts = {
    default_format = {
      timeout_ms = 3000,
      async = false, -- not recommended to change
      quiet = false, -- not recommended to change
    },
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      python = { "isort", "ruff_format" },
      sql = { "sql_formatter" } ,
      html = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true  },
      htmldjango = { "prettierd", "prettier", "djlint" },
      -- Use a sub-list to run only the first available formatter
      javascript = { "prettierd", "prettier", stop_after_first = true},
      typescript = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
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
