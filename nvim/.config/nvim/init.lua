-- some utils function
require('globals')

-- base vim setting
require('vimrc')
require('keymaps')
require('autocmds')

require('plugins')

-- lsp config
require('lsp.go')
require('lsp.rust')
require('lsp.eslint')
require('lsp.lua')
require('lsp.cssls')
require('lsp.tailwindcss')
require('lsp.typescript')
require('lsp.html')
