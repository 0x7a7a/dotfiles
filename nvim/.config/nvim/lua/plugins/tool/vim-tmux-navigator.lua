return {
  'christoomey/vim-tmux-navigator',
  init = function()
    -- disable vim-tmux-navigator default mappings
    vim.g.tmux_navigator_no_mappings = 1
  end,
  keys = {
    { '<C-h>', '<cmd>TmuxNavigateLeft<cr>', desc = 'tmux-navigator left' },
    { '<C-j>', '<cmd>TmuxNavigateDown<cr>', desc = 'tmux-navigator down' },
    { '<C-k>', '<cmd>TmuxNavigateUp<cr>', desc = 'tmux-navigator up' },
    { '<C-l>', '<cmd>TmuxNavigateRight<cr>', desc = 'tmux-navigator right' },
  },
}
