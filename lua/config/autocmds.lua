-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("BufNewFile", {
  -- Expand ~ to an absolute path AND also match regardless of cwd
  pattern = {
    vim.fn.expand("~") .. "/vimwiki/diary/*.md",
    "**/vimwiki/diary/*.md",
  },
  desc = "Insert diary template for new vimwiki diary entries",
  callback = function(args)
    -- Quick debug so you can see it fired and what matched
    -- Use fnamemodify to get "basename without extension"
    local title = vim.fn.fnamemodify(args.match, ":t:r")

    -- Only insert if buffer is empty
    local line_count = vim.api.nvim_buf_line_count(0)
    local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] or ""
    if line_count == 1 and first_line == "" then
      vim.api.nvim_buf_set_lines(0, 0, -1, false, {
        "# " .. title,
        "",
        "## Daily checklist",
        "",
        "- [ ] Geekbot",
        "",
        "## Todo",
        "",
        "## Unplanned",
        "",
        "## Near Future",
        "",
        "## Push",
        "",
        "## Notes",
      })
    end
  end,
})
