return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {},
  config = function()
    local wk = require('which-key')
    wk.setup()

    wk.register({
      ['<leader>'] = {
        b = { name = 'Prefix for bdelete' },
        g = { name = 'Prefix for git/fugtive' },
        t = { name = 'Prefix for neotest' },
        p = { name = 'Prefix for lazy' },
        q = { name = 'Prefix for qucikfix and quit' },
      },
      ['<Space>'] = {
        l = { name = 'Open the tui application' },
        s = { name = 'Search with telescope' },
        q = { name = 'Quickfix window' },
      },
      ['g'] = {
        J = { name = 'Joining the block of codes' },
        S = { name = 'Splitting the block of codes' },
      },
    })
  end,
}
