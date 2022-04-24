require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      'node_modules',
      'vendor',
      'dist',
      '.git',
      '.idea',
      '.DS_Store',
    },
    layout_strategy = 'vertical',
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
})

Keymap('n', 'sf', ':Telescope find_files hidden=true<CR>')
Keymap('n', '<leader>fg', ':Telescope live_grep<CR>')
Keymap('n', '<leader>fb', ':Telescope buffers<CR>')
Keymap('n', '<leader>fh', ':Telescope help_tags<CR>')
Keymap('n', '<leader>fi', ':Telescope lsp_implementations<CR>')
Keymap('n', '<leader>ft', ':TodoTelescope<CR>')
Keymap('n', '<leader>fd', ':Telescope diagnostics<CR>')
