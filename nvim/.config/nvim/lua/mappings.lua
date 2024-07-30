local map = vim.keymap.set

map('n', 'j', [[v:count ? (v:count >= 3 ? "m'" . v:count : '') . 'j' : 'gj']], { noremap = true, expr = true })
map('n', 'k', [[v:count ? (v:count >= 3 ? "m'" . v:count : '') . 'k' : 'gk']], { noremap = true, expr = true })

map('n', 'H', '^')
map('v', 'H', '^')
map('n', 'L', '$')
map('v', 'L', '$')

map('i', '<C-h>', '<left>')
map('i', '<C-j>', '<down>')
map('i', '<C-k>', '<up>')
map('i', '<C-l>', '<right>')

map('v', '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
map('x', '<leader>p', '"_dP', { desc = 'Paste but do not replace register' })
map('n', 'c', '"_c', { desc = 'Pure key c' })
map('n', '<leader><leader>', '<C-^>', { desc = 'Toggle last jumppath' })

map('n', '<leader>bb', '<cmd>bd<cr>', { desc = ':bdelete' })
map('n', '<leader>bB', '<cmd>bd!<cr>', { desc = ':bdelete!' })
-- Close other buffers except the current
map('n', '<leader>bo', '<cmd>%bd|e#|bd#<cr>', { desc = 'bdelete other buffers' })
map('n', '<leader>qq', '<cmd>q<cr>', { desc = ':quit' })
map('n', '<leader>qQ', '<cmd>q!<cr>', { desc = ':quit!' })
map('n', '<leader>qa', '<cmd>qa<cr>', { desc = ':qall' })
map('n', '<leader>qA', '<cmd>qa!<cr>', { desc = ':qall!' })
map('n', '<leader>w', '<cmd>w<cr>', { desc = ':write' })

map('n', '[b', '<cmd>bprevious<cr>')
map('n', ']b', '<cmd>bnext<cr>')
map('n', '[t', '<cmd>tabprevious<cr>')
map('n', ']t', '<cmd>tabnext<cr>')

map('i', '<C-a>', '<Esc>^i')
map('i', '<C-e>', '<Esc>$a')

-- Move lines
map('n', '<A-j>', '<cmd>move+1<cr>==')
map('n', '<A-k>', '<cmd>move-2<cr>==')
map('i', '<A-j>', '<Esc><cmd>move+1<cr>==gi')
map('i', '<A-k>', '<Esc><cmd>move-2<cr>==gi')
map('v', '<A-j>', "<Esc><cmd>'<,'>move'>+1<cr>gv=gv")
map('v', '<A-k>', "<Esc><cmd>'<,'>move'<-2<cr>gv=gv")

map('n', ']<Space>', 'o<Esc>k', { desc = 'Add a blank line above' })
map('n', '[<Space>', 'O<Esc>j', { desc = 'Add a blank line below' })

map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

map('n', '<A-right>', '<cmd>vertical resize+5<cr>')
map('n', '<A-left>', '<cmd>vertical resize-5<cr>')
map('n', '<A-up>', '<cmd>resize+5<cr>')
map('n', '<A-down>', '<cmd>resize-5<cr>')

-- Cmdline shortcuts
map('c', '<C-a>', '<Home>')
map('c', '<C-e>', '<End>')

-- Quickfix
map('n', '[q', '<cmd>cprevious<cr>zz')
map('n', ']q', '<cmd>cnext<cr>zz')

-- Floaterm
map('n', '<leader>t', '<cmd>FloatermToggle<cr>')
map('t', '<leader>t', '<C-\\><C-n>:FloatermToggle<cr>')

map('n', '<Space>lg', '<cmd>FloatermNew --title=lazygit --autoclose=2 lazygit<cr>')
map('n', '<Space>lf', '<cmd>FloatermNew --title=fl --autoclose=2 lf<cr>')
