local map = vim.keymap.set

map('n', 'j', [[v:count ? (v:count >= 3 ? "m'" . v:count : '') . 'j' : 'gj']], { noremap = true, expr = true })
map('n', 'k', [[v:count ? (v:count >= 3 ? "m'" . v:count : '') . 'k' : 'gk']], { noremap = true, expr = true })

map({ '', '!' }, '<C-c>', '<Esc>')
map('i', '<S-CR>', '<Esc>o')

map('v', '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
map('x', '<leader>p', '"_dP', { desc = 'Paste but do not replace register' })
map('n', 'c', '"_c', { desc = 'Pure key c' })
map('n', '<leader><leader>', '<C-^>', { desc = 'Toggle last jumppath' })

-- Close other buffers except the current
map('n', '<leader>bo', Z.close_other_bufs, { desc = 'bdelete other buffers' })
map('n', '<leader>bb', '<cmd>bd<CR>', { desc = ':bdelete' })
map('n', '<leader>bB', '<cmd>bd!<CR>', { desc = ':bdelete!' })
map('n', '<leader>qa', '<cmd>qa<CR>', { desc = ':qall' })
map('n', '<leader>qA', '<cmd>qa!<CR>', { desc = ':qall!' })
map('n', '<leader>w', '<cmd>w<CR>', { desc = ':write' })

map('n', '[b', '<cmd>bprevious<CR>')
map('n', ']b', '<cmd>bnext<CR>')
map('n', '[t', '<cmd>tabprevious<CR>')
map('n', ']t', '<cmd>tabnext<CR>')
-- Quickfix
map('n', '[q', '<cmd>cprevious<CR>zz')
map('n', ']q', '<cmd>cnext<CR>zz')

-- Extend the default behavior
map('i', '<C-h>', '<BS>')
map('i', '<C-d>', '<Del>')
map('i', '<C-b>', '<Left>')
map('i', '<C-f>', '<Right>')
map('i', '<C-n>', [[pumvisible() ? '<C-n>' : '<down>']], {
  desc = 'Go to next line',
  noremap = true,
  expr = true,
})
map('i', '<C-p>', [[pumvisible() ? '<C-p>' : '<up>']], {
  desc = 'Go to previous line',
  noremap = true,
  expr = true,
})
map({ 'i', 'c' }, '<C-a>', '<home>')
map('i', '<C-e>', [[pumvisible() ? '<C-e>' : '<end>']], {
  desc = 'go to line end or abort completion when pum is visible',
  noremap = true,
  expr = true,
})
map('n', 'H', '^')
map('n', 'L', 'g_')

-- Move lines
map('n', '<A-j>', '<cmd>move+1<CR>==')
map('n', '<A-k>', '<cmd>move-2<CR>==')
map('i', '<A-j>', '<Esc><cmd>move+1<CR>==gi')
map('i', '<A-k>', '<Esc><cmd>move-2<CR>==gi')
map('v', '<A-j>', "<Esc><cmd>'<,'>move'>+1<CR>gv=gv")
map('v', '<A-k>', "<Esc><cmd>'<,'>move'<-2<CR>gv=gv")

map('n', ']<Space>', 'o<Esc>k', { desc = 'Add a blank line above' })
map('n', '[<Space>', 'O<Esc>j', { desc = 'Add a blank line below' })

-- Smart-splites plugin replaced
-- map('n', '<C-h>', '<C-w>h')
-- map('n', '<C-j>', '<C-w>j')
-- map('n', '<C-k>', '<C-w>k')
-- map('n', '<C-l>', '<C-w>l')

map('n', '<A-right>', '<cmd>vertical resize+5<CR>')
map('n', '<A-left>', '<cmd>vertical resize-5<CR>')
map('n', '<A-up>', '<cmd>resize+5<CR>')
map('n', '<A-down>', '<cmd>resize-5<CR>')

-- Lazy
map('n', '<Leader>ps', '<cmd>Lazy sync<CR>', { desc = 'Update plugins' })

-- LSP
map('n', '<leader>d', vim.diagnostic.setqflist, { desc = 'Open diagnostics list' })
map('n', '<C-w>gi', '<C-w>vgi', { desc = 'LSP implementation in window split', remap = true })
map('n', '<C-w>gd', '<C-w>vgd', { desc = 'LSP definition in window split', remap = true })
map('n', '[e', function()
  vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
end, { desc = 'Previous error diagnostic' })
map('n', ']e', function()
  vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
end, { desc = 'Next error diagnostic' })

-- Command
map('c', '<C-b>', '<Left>', { noremap = true })
map('c', '<C-f>', '<Right>', { noremap = true })
map('c', '<C-a>', '<Home>', { noremap = true })
map('c', '<C-e>', '<End>', { noremap = true })
map('c', '<C-h>', '<BS>', { noremap = true })
map('c', '<C-d>', '<Del>', { noremap = true })
map('c', '<C-k>', [[<C-\>e(strpart(getcmdline(), 0, getcmdpos() - 1))<CR>]], { noremap = true })
map('c', '<A-b>', '<S-Left>', { noremap = true })
map('c', '<A-f>', '<S-Right>', { noremap = true })
