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
opt.timeoutlen  = 300
-- opt.jumpoptions = 'stack'

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
opt.cursorlineopt  = 'number'
opt.wildmode       = 'longest:full,full'
opt.numberwidth    = 3

vim.o.fillchars = table.concat({
  horiz = '━',
  horizup = '┻',
  horizdown = '┳',
  vert = '┃',
  vertleft = '┨',
  vertright = '┣',
  verthoriz = '╋',
})
opt.list = false
opt.listchars = table.concat({ 'extends:…', 'nbsp:+', 'precedes:…', 'tab:> ' }, ',')

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

-- Fold(nvim-ufo)
vim.o.foldcolumn = '0'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Automatic switching of relative and absolute line numbers
local autocmd = Z.autocmd
autocmd({ 'InsertEnter', 'InsertLeave' }, function(arg)
  local ft = vim.bo.filetype
  if ft == 'help' or ft == 'copilot-chat' then
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
    timeout = 150,
  })
end)

autocmd({ 'BufEnter', 'WinEnter' }, function()
  vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = 'orange' })
end)

-- Kitty auto padding
-- autocmd({'VimEnter'},function ()
--   os.execute('kitty @ set-spacing padding=0 margin=0')
-- end)
-- autocmd({'VimLeave'},function ()
--   os.execute('kitty @ set-spacing padding=10 margin=0')
-- end)

-- User command
local usercmd = vim.api.nvim_create_user_command
usercmd('CopyRelPath', function()
  local path = vim.fn.expand('%')
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

usercmd('CopyPath', function()
  local path = vim.fn.expand('%:p')
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
