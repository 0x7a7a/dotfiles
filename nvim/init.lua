-- 基础配置
require("vimrc")
-- 载入插件
require("plugins")

-- 按键映射
require("keybindings")

-- 主题
require("colors/tokyonight")
require("colors/github-nvim-theme")
require("colors/onenord")
require("colors/kanagawa")
vim.cmd([[colorscheme tokyonight]])

-- 插件配置
require("plugin-config/bufferline")
require("plugin-config/rnvimr")
require("plugin-config/treesitter")
require("plugin-config/gitsigns")
require("plugin-config/lualine")
require("plugin-config/which-key")
require("plugin-config/toggleterm")
require("plugin-config/telescope")
require("plugin-config/trouble")
require("plugin-config/hop")
require("plugin-config/comment")
require("plugin-config/nvim-tree")
require("plugin-config/indent-blankline")

require("plugin-config/auto-session")
require("plugin-config/auto-pairs")

-- 语法补全
require("plugin-config/lsp-cmp")
require("plugin-config/lsp-config")
require("plugin-config/lsp-saga")
require("plugin-config/lsp-kind")
require("plugin-config/lsp-color")
require("plugin-config/lsp-signature")
-- 暂时不可用
-- require("plugin-config/vsnip")
require("plugin-config/lua-snip")
-- 代码格式化
require("plugin-config/formatter")

-- LSP server
require("lsp/go")
require("lsp/typescript")
