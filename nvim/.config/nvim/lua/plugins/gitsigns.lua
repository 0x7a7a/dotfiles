return {
  'lewis6991/gitsigns.nvim',
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require('gitsigns')
      -- stylua: ignore start
      vim.keymap.set('n', ']c', function() gitsigns.nav_hunk('next') end, { buffer = bufnr, desc = 'Gitsigns: Next Hunk' })
      vim.keymap.set('n', '[c', function() gitsigns.nav_hunk('prev') end, { buffer = bufnr, desc = 'Gitsigns: Previous Hunk' })
      -- stylua: ignore end
    end,

    current_line_blame = true,
  },
}
