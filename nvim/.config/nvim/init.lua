-- some utils function
require 'globals'

-- base vim setting
require 'vimrc'
require 'keymaps'
require 'autocmds'

-- colorscheme
require 'colors/kanagawa'
-- require 'colors/tokyonight'

-- vim.cmd([[colorscheme tokyonight]])

require 'plugins'

-- lsp config
require 'lsp/eslint'
require 'lsp/lua'
require 'lsp/cssls'
require 'lsp/tailwindcss'
require 'lsp/typescript'
require 'lsp/html'
