-- cache,prevent errors when first time run
local ok, _ = pcall(require, 'impatient')
if ok then
  require 'impatient'
end

require 'globals'

-- base vim setting
require 'vimrc'

-- key mapping
require 'keymaps'

-- colorscheme
require 'colors/tokyonight'
require 'colors/kanagawa'
vim.cmd [[colorscheme kanagawa]]
-- vim.cmd([[colorscheme tokyonight]])

-- load plugins
require 'plugins'

-- LSP server
require 'lsp/eslint'
require 'lsp/lua'
require 'lsp/cssls'
require 'lsp/tailwindcss'
