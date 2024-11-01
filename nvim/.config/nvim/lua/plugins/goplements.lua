return {
  'maxandron/goplements.nvim',
  config = function()
    local gl = require('goplements')
    gl.setup({})
    vim.keymap.set('n', '<leader>gi', gl.toggle, { desc = 'GoplementToggle' })
  end,
}
