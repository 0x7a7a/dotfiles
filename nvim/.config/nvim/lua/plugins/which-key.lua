return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  enabled = false,
  config = function()
    local wk = require('which-key')
    wk.setup({
      delay = 500,
      icons = {
        rules = false,
      },
      defer = function(ctx)
        return ctx.mode == 'V' or ctx.mode == '<C-V>'
      end,
    })

    wk.add({
      { '<leader>b', group = 'Prefix for bdelete' },
      { '<leader>g', group = 'Prefix for git/fugtive' },
      { '<leader>p', group = 'Prefix for lazy' },

      { '<Space>d', group = 'Preifx for diffview' },
      { '<Space>l', group = 'Open the tui application' },
      { '<Space>s', group = 'Fuzzy Search' },
      { '<Space>c', group = 'Copilot Chat' },

      { 'gJ', desc = 'Joining the block of codes' },
      { 'gS', desc = 'Splitting the block of codes' },
    })
  end,
}
