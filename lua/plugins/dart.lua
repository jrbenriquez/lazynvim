return {
  "iofq/dart.nvim",
  opts = {
    -- List of characters to use to mark 'pinned' buffers
    -- The characters will be chosen for new pins in order
    marklist = { "a", "s", "d", "f", "q", "w", "e", "r" },

    -- List of characters to use to mark recent buffers, which are displayed first (left) in the tabline
    -- Buffers that are 'marked' are not included in this list
    -- The length of this list determines how many recent buffers are tracked
    buflist = { "q", "w", "e" },

    -- If true, Dart.next and Dart.prev will wrap around the tabline
    cycle_wraps_around = true,

    -- State persistence. Use Dart.read_session and Dart.write_session manually
    persist = {
      -- Path to persist session data in
      path = vim.fs.joinpath(vim.fn.stdpath("data"), "dart"),
    },

    -- Default mappings
    mappings = {
      mark = "<leader>;;", -- Mark current buffer
      jump = "<leader>;", -- Jump to buffer marked by next character i.e `;a`
      pick = "<leader>;p", -- Open Dart.pick
      next = "<S-l>", -- Cycle right through the tabline
      prev = "<S-h>", -- Cycle left through the tabline
    },
  },
}
