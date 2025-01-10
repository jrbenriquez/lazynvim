-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local function get_python_path()
  -- Get the relative file path
  local file_path = vim.fn.expand("%:~:.")

  -- Replace slashes with dots
  local python_path = file_path:gsub("/", ".")

  -- Remove the file extension
  python_path = python_path:gsub("%.py$", "")

  -- Check if the cursor is on a function or class definition
  local line = vim.api.nvim_get_current_line()

  -- Match function definition
  if line:match("^%s*def%s+%w+") then
    local func_name = line:match("^%s*def%s+(%w+)")
    return python_path .. "." .. func_name

  -- Match class definition
  elseif line:match("^%s*class%s+%w+") then
    local class_name = line:match("^%s*class%s+(%w+)")
    return python_path .. "." .. class_name
  else
    -- Return the path without function or class if none is found
    return python_path
  end
end

local function copy_python_path()
  local python_path = get_python_path()
  -- Copy the result to the clipboard
  vim.fn.setreg("+", python_path)
  -- Notify the user
  vim.notify("Copied: " .. python_path, vim.log.levels.INFO)
end

vim.api.nvim_create_user_command("CopyPythonPath", function()
  copy_python_path()
end, { desc = "Copy the Python module path with the current function/class to clipboard" })
