local opt = vim.opt

vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- command menu
opt.pumheight = 20
opt.pumblend = 15
opt.wildmode = 'longest:full,full'
opt.wildoptions = 'pum'

-- long line wrap
opt.wrap = true
opt.breakindent = true
opt.showbreak = string.rep(' ', 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.scrolloff = 5
opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.signcolumn = 'yes'
opt.mouse = 'a'
opt.writebackup = false
opt.swapfile = false
opt.updatetime = 500
opt.timeoutlen = 500
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.completeopt = 'menu,menuone,noselect,noinsert'
opt.formatoptions = opt.formatoptions
  - 'a' -- Auto formatting is BAD.
  - 't' -- Don't auto format my code. I got linters for that.
  + 'c' -- In general, I like it when comments respect textwidth
  + 'q' -- Allow formatting comments w/ gq
  - 'o' -- O and o, don't continue comments
  + 'r' -- But do continue when pressing enter.
  + 'n' -- Indent past the formatlistpat, not underneath it.
  + 'j' -- Auto-remove comments if possible.

opt.fillchars:append {
  horiz = '━',
  horizup = '┻',
  horizdown = '┳',
  vert = '┃',
  vertleft = '┨',
  vertright = '┣',
  verthoriz = '╋',
}

opt.list = true
opt.listchars:append 'eol:↴'
opt.termguicolors = true

-- system clipboard
-- opt.clipboard = 'unnamedplus'

-- colorschme
opt.showmode = false
opt.background = 'dark'
opt.termguicolors = true

-- fold
opt.foldenable = false

-- disabled illuminate
vim.g.Illuminate_ftblacklist = { 'NvimTree' }
