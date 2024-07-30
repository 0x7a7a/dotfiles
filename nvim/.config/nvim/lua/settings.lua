local opt = vim.opt
-- stylua: ignore start
-- Leader
vim.g.mapleader = ','

-- General
opt.backup      = false
opt.writebackup = false
opt.mouse       = 'a'
opt.mousescroll = 'ver:25,hor:6'
opt.switchbuf   = 'usetab'
opt.undofile    = true
opt.undodir     = '/tmp/.undodir'

-- UI
opt.wrap           = false
opt.list           = true
opt.breakindent    = true
opt.linebreak      = true
opt.number         = true
opt.relativenumber = true
opt.pumblend       = 10
opt.showmode       = false
opt.signcolumn     = 'yes'
opt.splitbelow     = true
opt.splitright     = true
opt.termguicolors  = true
opt.winblend       = 10
opt.cursorline     = true
opt.cursorlineopt  = 'number'

vim.o.fillchars = table.concat(
  { 'eob: ', 'fold:╌', 'horiz:═', 'horizdown:╦', 'horizup:╩', 'vert:║', 'verthoriz:╬', 'vertleft:╣', 'vertright:╠' },
  ','
)
vim.o.listchars = table.concat({ 'extends:…', 'nbsp:␣', 'precedes:…', 'tab:> ' }, ',')

-- Edit
opt.autoindent    = true
opt.smartindent   = true
opt.expandtab     = true
opt.formatoptions = 'rqnl1j'
opt.ignorecase    = true
opt.infercase     = true
opt.shiftwidth    = 2
opt.smartcase     = true
opt.tabstop       = 2
opt.virtualedit   = 'block'
opt.iskeyword:append('-')

-- Fold
-- opt.foldmethod  = 'indent'
-- opt.foldlevel   = 1
-- opt.foldnestmax = 10

-- Command Menu
opt.wildmode = 'longest:full,full'

-- Performance
opt.updatetime = 100
opt.timeoutlen = 300
-- stylua: ignore end

-- Automatic switching of relative and absolute line numbers
local autocmd = Z.autocmd
autocmd({ 'InsertEnter', 'InsertLeave' }, function(arg)
  local ft = vim.bo.filetype
  if ft == 'help' then
    return
  end

  if ft == 'qf' then
    vim.opt.relativenumber = false
    return
  end

  vim.opt.relativenumber = arg.event == 'InsertLeave'
end)

-- Flash yanked lines
autocmd('TextYankPost', function()
  vim.highlight.on_yank({
    higroup = 'IncSearch',
    on_visual = false,
    timeout = 150,
  })
end)

autocmd('TextYankPost', function()
  vim.highlight.on_yank({
    higroup = 'IncSearch',
    on_visual = false,
    timeout = 150,
  })
end)
