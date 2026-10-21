return {
  'maxandron/goplements.nvim',
  ft = 'go',
  opts = {},
  keys = {
    {
      '<leader>gi',
      function()
        require('goplements').toggle()
      end,
      desc = 'Toggle goplements',
    },
  },
}
