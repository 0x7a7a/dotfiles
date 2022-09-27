-- cache,prevent errors when first time run
local ok, _ = pcall(require, 'impatient')
if ok then
  require 'impatient'
end

-- some utils function
require 'globals'

-- base vim setting
require 'vimrc'
require 'keymaps'
require 'autocmds'

-- colorscheme
require 'colors/tokyonight'
require 'colors/kanagawa'

vim.cmd [[colorscheme kanagawa]]
-- vim.cmd([[colorscheme tokyonight]])

require 'plugins'

-- lsp config
require 'lsp/eslint'
require 'lsp/lua'
require 'lsp/cssls'
require 'lsp/tailwindcss'
require 'lsp/typescript'
