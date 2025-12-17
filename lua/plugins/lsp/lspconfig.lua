return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  opts = {
    servers = {
      html = {},
      tsserver = {},
      cssls = {},
      tailwindcss = {},
      pyright = {},
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      },
    },
    on_attach = function(client, bufnr)
      local keymap = vim.keymap
      local opts = { noremap = true, silent = true, buffer = bufnr }

      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
      keymap.set("n", "gy", "<cmd>Telescope lsp_type_definitions<CR>", opts)
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      keymap.set("n", "K", vim.lsp.buf.hover, opts)
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end,
    setup = {
      -- Add this block if you want to override diagnostic signs once
      ["*"] = function()
        local signs = { Error = "? ", Warn = "? ", Hint = "? ", Info = "? " }
        for type, icon in pairs(signs) do
          local hl = "DiagnosticSign" .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end
      end,
    },
  },
}
