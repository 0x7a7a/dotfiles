require('core')
require('utils')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({ {
  import = 'plugins',
}, {
  import = 'colorschemes',
} }, {
  checker = {
    enabled = true,
  },
  change_detection = {
    enabled = false,
  },
})

Keymap('n', '<leader>ps', '<Cmd>Lazy sync<CR>')
Keymap('n', '<leader>pu', '<Cmd>Lazy update<CR>')
Keymap('n', '<leader>pi', '<Cmd>Lazy install<CR>')
Keymap('n', '<leader>pc', '<Cmd>Lazy clean<CR>')
