require('globals')

-- base vim setting
require('vimrc')

-- key mapping
require('keymaps')

-- colorscheme
require('colors/tokyonight')
require('colors/kanagawa')
vim.cmd([[colorscheme kanagawa]])
-- vim.cmd([[colorscheme tokyonight]])

-- load plugins
require('plugins')
-- plugins setting
require('plugins/bufferline')
require('plugins/treesitter')
require('plugins/gitsigns')
require('plugins/which-key')
require('plugins/telescope')
require('plugins/trouble')
require('plugins/hop')
require('plugins/comment')
require('plugins/nvim-tree')
require('plugins/indent-blankline')
require('plugins/symbols-outline')
require('plugins/auto-session')
require('plugins/auto-pairs')
require('plugins/neoscroll')
require('plugins/colorizer')
require('plugins/fidget')
require('plugins/null-ls')
require('plugins/lualine')
-- lsp plugin setting
require('plugins/lsp-cmp')
require('plugins/lsp-config')
require('plugins/lsp-color')
require('plugins/lsp-signature')

-- LSP server
require('lsp/go')
require('lsp/typescript')
require('lsp/lua')
require('lsp/cssls')
require('lsp/navigator')
require('lsp/tailwindcss')
