return {
  'stevearc/quicker.nvim',
  ft = { 'qf' },
  keys = {
    {
      'qf',
      function()
        require('quicker').toggle()
      end,
      desc = 'Toggle quickfix',
    },
    {
      'ql',
      function()
        require('quicker').toggle({ loclist = true })
      end,
      desc = 'Toggle loclist',
    },
  },
  config = function()
    require('quicker').setup({
      keys = {
        {
          '>',
          function()
            require('quicker').expand({ before = 2, after = 2, add_to_existing = true })
          end,
          desc = 'Expand quickfix context',
        },
        {
          '<',
          function()
            require('quicker').collapse()
          end,
          desc = 'Collapse quickfix context',
        },
      },
    })
  end,
}
