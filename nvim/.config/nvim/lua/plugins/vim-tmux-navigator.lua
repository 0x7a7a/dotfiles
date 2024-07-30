return {
  'christoomey/vim-tmux-navigator',
  enabled = false,
  init = function()
    -- disable vim-tmux-navigator default mappings
    vim.g.tmux_navigator_no_mappings = 1
  end,
  keys = {
    { '<C-h>', '<Cmd>TmuxNavigateLeft<CR>', desc = 'tmux-navigator left' },
    { '<C-j>', '<Cmd>TmuxNavigateDown<CR>', desc = 'tmux-navigator down' },
    { '<C-k>', '<Cmd>TmuxNavigateUp<CR>', desc = 'tmux-navigator up' },
    { '<C-l>', '<Cmd>TmuxNavigateRight<CR>', desc = 'tmux-navigator right' },
  },
}
