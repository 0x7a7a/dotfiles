return {
  'Wansmer/treesj',
  opts = { use_default_keymaps = false },
  keys = {
    {
      'gJ',
      function()
        require('treesj').join()
      end,
      desc = 'Join syntax node',
    },
    {
      'gS',
      function()
        require('treesj').split()
      end,
      desc = 'Split syntax node',
    },
  },
}
