_G.Z = {}

require('functions')
require('settings')
require('mappings')
require('lsp')

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

vim.cmd.colorscheme('gruvbox-material')
-- vim.cmd.colorscheme('nordfox')

-- vim.opt.background = 'light'
-- vim.cmd.colorscheme('rose-pine-dawn')
-- vim.cmd.colorscheme('edge')
