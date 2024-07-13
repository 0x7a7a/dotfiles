return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local wk = require('which-key')
    wk.setup({
      icons = {
        rules = false,
      },
      disable = {
        trigger = function(ctx)
          if ctx.keys == '`' and ctx.mode == 'n' then
            return true
          end
          return false
        end,
      },
    })

    wk.add({
      { '<leader>b', group = 'Prefix for bdelete' },
      { '<leader>g', group = 'Prefix for git/fugtive' },
      { '<leader>t', group = 'Prefix for neotest' },
      { '<leader>p', group = 'Prefix for lazy' },
      { '<leader>q', group = 'Prefix for quicikfix and quit' },

      { '<Space>l', group = 'Open the tui application' },
      { '<Space>s', group = 'Search with telescope' },
      { '<Space>q', group = 'Quickfix window' },

      { 'gJ', desc = 'Joining the block of codes' },
      { 'gS', desc = 'Splitting the block of codes' },
    })
  end,
}
