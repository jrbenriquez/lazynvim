-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local function get_python_path()
  -- Get the relative file path
  local file_path = vim.fn.expand("%:~:.")
  local python_path = file_path:gsub("/", "."):gsub("%.py$", "")

  -- Get the cursor position
  local cursor_row, _ = unpack(vim.api.nvim_win_get_cursor(0))

  -- Get all lines before the cursor
  local lines = vim.api.nvim_buf_get_lines(0, 0, cursor_row, false)

  -- Search backwards for the nearest function or class definition
  local func_name, class_name = nil, nil

  for i = #lines, 1, -1 do
    local line = lines[i]

    -- Match function definition
    local found_func = line:match("^%s*def%s+([%w_]+)")
    if found_func then
      func_name = found_func
      break
    end

    -- Match class definition
    local found_class = line:match("^%s*class%s+([%w_]+)")
    if found_class then
      class_name = found_class
      -- Continue searching in case there's a function inside the class
    end
  end

  -- Construct the final Python path
  if func_name and class_name then
    return python_path .. "." .. class_name .. "." .. func_name
  elseif func_name then
    return python_path .. "." .. func_name
  elseif class_name then
    return python_path .. "." .. class_name
  else
    return python_path
  end
end

local function copy_python_path()
  local python_path = get_python_path()
  vim.fn.setreg("+", python_path)
  vim.notify("Copied: " .. python_path, vim.log.levels.INFO)
end

vim.api.nvim_create_user_command("CopyPythonPath", function()
  copy_python_path()
end, { desc = "Copy the Python module path with the current function/class to clipboard" })

vim.opt.backspace = { "start", "eol", "indent" }
