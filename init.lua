require("config.lazy")
-- bootstrap lazy.nvim, LazyVim and your plugins

vim.opt.backspace = { "start", "eol", "indent" }

-- Treesitter-based dot path resolver

-- Find the directory containing manage.py, walking upward from file_path
local function find_project_root(file_path)
  local result = vim.fs.find("manage.py", { upward = true, path = file_path })
  return result[1] and vim.fs.dirname(result[1]) or nil
end

local function get_dot_path()
  local bufnr = vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(bufnr)
  local file_real = vim.loop.fs_realpath(file)

  local project_root = find_project_root(file)
  if not project_root then
    vim.notify("manage.py not found in parent folders.", vim.log.levels.ERROR)
    return
  end
  local project_real = vim.loop.fs_realpath(project_root)

  -- Normalize slashes
  file_real = file_real and file_real:gsub("//", "/")
  project_real = project_real and project_real:gsub("//", "/")

  -- Ensure trailing slash is present
  if not project_real:match("/$") then
    project_real = project_real .. "/"
  end

  -- Strip project path from file path to get relative Python module
  local relative_path = file_real:gsub("^" .. vim.pesc(project_real), "")
  local mod_path = relative_path:gsub("/", "."):gsub("%.py$", "")

  -- Use Treesitter to find enclosing class/function
  local parser = vim.treesitter.get_parser(bufnr, "python")
  local tree = parser:parse()[1]
  local root = tree:root()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local node = root:named_descendant_for_range(row - 1, col, row - 1, col)
  local names = {}

  while node do
    if node:type() == "function_definition" or node:type() == "class_definition" then
      local name_node = node:field("name")[1]
      local name = vim.treesitter.get_node_text(name_node, bufnr)
      table.insert(names, 1, name)
    end
    node = node:parent()
  end

  -- Construct final dot path
  local full_path = mod_path .. "." .. table.concat(names, ".")

  -- Copy to clipboard and notify
  vim.fn.setreg("+", full_path)
  vim.notify("Copied: " .. full_path, vim.log.levels.INFO)
end

vim.api.nvim_create_user_command("TestDotPath", get_dot_path, {
  desc = "Copy Django-compatible test dot path to clipboard",
})
