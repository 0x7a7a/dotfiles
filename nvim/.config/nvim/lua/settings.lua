local opt = vim.opt
-- stylua: ignore start
-- Leader
vim.g.mapleader = ','

-- General
opt.backup      = false
opt.writebackup = false
opt.mouse       = 'a'
opt.undofile    = true
opt.undodir     = '/tmp/.undodir'
opt.updatetime  = 250
opt.timeoutlen  = 500
opt.jumpoptions = 'stack'

-- UI
opt.wrap           = true
opt.breakindent    = true
opt.linebreak      = true
opt.number         = true
opt.relativenumber = true
opt.scrolloff      = 5
opt.pumblend       = 10
opt.showmode       = false
opt.signcolumn     = 'yes'
opt.splitbelow     = true
opt.splitright     = true
opt.termguicolors  = true
opt.cursorline     = true
opt.cursorlineopt  = 'both'
opt.wildmode       = 'longest:full,full'
opt.numberwidth    = 3

opt.fillchars = {
  horiz     = '━',
  horizup   = '┻',
  horizdown = '┳',
  vert      = '┃',
  vertleft  = '┨',
  vertright = '┣',
  verthoriz = '╋',
  fold      = " ",
}
opt.list = false
opt.listchars = table.concat({ 'extends:…', 'nbsp:+', 'precedes:…', 'tab:> ' }, ',')

-- Edit
opt.autoindent    = true
opt.smartindent   = true
opt.expandtab     = true
opt.formatoptions = 'qnl1j'
opt.ignorecase    = true
opt.infercase     = true
opt.shiftwidth    = 2
opt.smartcase     = true
opt.tabstop       = 2
opt.virtualedit   = 'block'
opt.iskeyword:append('-')

-- Fold (use nvim-origami plugin)
-- vim.o.foldenable     = true
-- vim.o.foldlevel      = 99
-- vim.o.foldlevelstart = 99
-- vim.o.foldmethod     = "expr"
-- vim.o.foldexpr       = "v:lua.vim.treesitter.foldexpr()"
-- vim.o.foldtext       = ""
-- vim.o.foldcolumn     = "0"

-- Customer filetype
vim.filetype.add({
  extension = {
    http = 'http',
    api  = 'api',
    wxss = 'css',
    wxml = 'html',
  },
})
