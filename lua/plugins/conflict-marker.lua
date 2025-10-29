return {
  'rhysd/conflict-marker.vim',
  config = function()
    -- Disable default highlight group
    vim.g.conflict_marker_highlight_group = ''
    -- Include text after begin and end markers
    vim.g.conflict_marker_begin = '^<<<<<<< .*$'
    vim.g.conflict_marker_end = '^>>>>>>> .*$'
    -- Set custom highlights
    vim.cmd([[
      highlight ConflictMarkerBegin guifg=#e06c75
      highlight ConflictMarkerOurs guibg=#2e5049
      highlight ConflictMarkerSeparator guifg=#e06c75
      highlight ConflictMarkerTheirs guibg=#344f69
      highlight ConflictMarkerEnd guifg=#e06c75
    ]])
  end,
}
