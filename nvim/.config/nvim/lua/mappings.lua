local map = vim.keymap.set

map('n', 'j', [[v:count ? (v:count >= 3 ? "m'" . v:count : '') . 'j' : 'gj']], { noremap = true, expr = true })
map('n', 'k', [[v:count ? (v:count >= 3 ? "m'" . v:count : '') . 'k' : 'gk']], { noremap = true, expr = true })

map({ '', '!' }, '<C-c>', '<Esc>')
map('i', '<S-CR>', '<Esc>o')

map('i', '<C-h>', '<left>')
-- Mapping to copolot chat
-- map('i', '<C-j>', '<down>')
map('i', '<C-k>', '<up>')
map('i', '<C-l>', '<right>')

map('v', '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
map('x', '<leader>p', '"_dP', { desc = 'Paste but do not replace register' })
map('n', 'c', '"_c', { desc = 'Pure key c' })
map('n', '<leader><leader>', '<C-^>', { desc = 'Toggle last jumppath' })

-- Close other buffers except the current
map('n', '<leader>bo', Z.close_other_bufs, { desc = 'bdelete other buffers' })
map('n', '<leader>bb', '<Cmd>bd<CR>', { desc = ':bdelete' })
map('n', '<leader>bB', '<Cmd>bd!<CR>', { desc = ':bdelete!' })
map('n', '<leader>qa', '<Cmd>qa<CR>', { desc = ':qall' })
map('n', '<leader>qA', '<Cmd>qa!<CR>', { desc = ':qall!' })
map('n', '<leader>w', '<Cmd>w<CR>', { desc = ':write' })

map('n', '[b', '<Cmd>bprevious<CR>')
map('n', ']b', '<Cmd>bnext<CR>')
map('n', '[t', '<Cmd>tabprevious<CR>')
map('n', ']t', '<Cmd>tabnext<CR>')

map('i', '<C-a>', '<Esc>^i')
map('i', '<C-e>', '<Esc>$a')
map('n', 'H', '^')
map('n', 'L', 'g_')

-- Move lines
map('n', '<A-j>', '<Cmd>move+1<CR>==')
map('n', '<A-k>', '<Cmd>move-2<CR>==')
map('i', '<A-j>', '<Esc><Cmd>move+1<CR>==gi')
map('i', '<A-k>', '<Esc><Cmd>move-2<CR>==gi')
map('v', '<A-j>', "<Esc><Cmd>'<,'>move'>+1<CR>gv=gv")
map('v', '<A-k>', "<Esc><Cmd>'<,'>move'<-2<CR>gv=gv")

map('n', ']<Space>', 'o<Esc>k', { desc = 'Add a blank line above' })
map('n', '[<Space>', 'O<Esc>j', { desc = 'Add a blank line below' })

-- Smart-splites plugin replaced
-- map('n', '<C-h>', '<C-w>h')
-- map('n', '<C-j>', '<C-w>j')
-- map('n', '<C-k>', '<C-w>k')
-- map('n', '<C-l>', '<C-w>l')

map('n', '<A-right>', '<Cmd>vertical resize+5<CR>')
map('n', '<A-left>', '<Cmd>vertical resize-5<CR>')
map('n', '<A-up>', '<Cmd>resize+5<CR>')
map('n', '<A-down>', '<Cmd>resize-5<CR>')

-- Cmdline shortcuts
map('c', '<C-a>', '<Home>')
map('c', '<C-e>', '<End>')

-- Quickfix
map('n', '[q', '<Cmd>cprevious<CR>zz')
map('n', ']q', '<Cmd>cnext<CR>zz')

-- Lazy
map('n', '<Leader>ps', '<Cmd>Lazy sync<CR>', { desc = 'Update plugins' })
