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

local hour = tonumber(os.date('%H'))

if hour >= 18 or hour < 8 then
  vim.opt.background = 'dark'
  vim.cmd.colorscheme('gruvbox-material')
else
  vim.opt.background = 'light'
  vim.cmd.colorscheme('rose-pine-dawn')

  vim.opt.guicursor = {
    'n-v-c-sm:block-Cursor',
    'i-ci-ve:ver25-Cursor',
    'r-cr-o:hor20',
    't:block-blinkon500-blinkoff500-TermCursor',
  }
  vim.api.nvim_set_hl(0, 'Cursor', { fg = '#000000', bg = '#EAA041' })

  -- vim.cmd.colorscheme('edge')
end

Z.set_auto_cursorline_highlight()
