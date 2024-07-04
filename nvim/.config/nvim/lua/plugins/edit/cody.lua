return {
  {
    'sourcegraph/sg.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('sg').setup()

      Keymap('n', '<Space>c', '<cmd>CodyToggle<cr>', { desc = 'Cody Toggle' })
    end,
  },
}
