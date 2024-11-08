-- Cookbook: https://www.naseraleisa.com/posts/diff
return {
  'sindrets/diffview.nvim',
  evet = 'VeryLazy',
  config = function()
    vim.keymap.set('n', '<Space>dh', '<Cmd>DiffviewFileHistory<cr>', { desc = 'Diffview repo history' })
    vim.keymap.set('n', '<Space>df', '<Cmd>DiffviewFileHistory --follow %<cr>', { desc = 'Diffview file history' })
    vim.keymap.set('n', '<Space>dl', '<Cmd>DiffviewFileHistory --follow<cr>', { desc = 'Diffview line history' })
    vim.keymap.set('n', '<Space>dc', '<Cmd>DiffviewClose<cr>', { desc = 'Diffview Close' })
    vim.keymap.set('n', '<Space>dg', require('gitsigns').preview_hunk, { desc = 'Preview hunk' })
  end,
}
