return {
  'maxandron/goplements.nvim',
  config = function()
    local gl = require('goplements')
    gl.setup({})
    gl.disable()
    vim.keymap.set('n', '<leader>gi', gl.toggle, { desc = 'GoplementToggle' })
  end,
}
