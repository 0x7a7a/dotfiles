-- Cookbook: https://www.naseraleisa.com/posts/diff
return {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewOpen' },
  config = function()
    vim.keymap.set('n', '<leader>hh', '<cmd>DiffviewFileHistory<cr>', { desc = 'Repo history' })
    vim.keymap.set('n', '<leader>hf', '<cmd>DiffviewFileHistory --follow %<cr>', { desc = 'File history' })
    vim.keymap.set('n', '<leader>hl', '<Cmd>.DiffviewFileHistory --follow<CR>', { desc = 'Line history' })
  end,
}
