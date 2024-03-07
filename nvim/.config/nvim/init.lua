require('core')

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

require('lazy').setup({
  { import = 'plugins' },
  { import = 'colorschemes' },
}, {
  checker = {
    enabled = true,
  },
  change_detection = {
    enabled = false,
  },
})

Keymap('n', '<leader>ps', '<cmd>Lazy sync<cr>')
Keymap('n', '<leader>pp', '<cmd>Lazy profile<cr>')

vim.cmd.colorscheme('gruvbox-material')
-- vim.cmd.colorscheme('kanagawa')
-- vim.cmd.colorscheme('melange')
-- vim.cmd.colorscheme('nordfox')
