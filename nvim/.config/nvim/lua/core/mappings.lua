Keymap = function(mode, key, cmd, opts)
  opts = opts or {
    noremap = true,
    silent = true,
  }
  vim.keymap.set(mode, key, cmd, opts)
end

Keymap('n', 'j', [[v:count ? (v:count >= 3 ? "m'" . v:count : '') . 'j' : 'gj']], { noremap = true, expr = true })
Keymap('n', 'k', [[v:count ? (v:count >= 3 ? "m'" . v:count : '') . 'k' : 'gk']], { noremap = true, expr = true })

Keymap('n', 'H', '^')
Keymap('v', 'H', '^')
Keymap('n', 'L', '$')
Keymap('v', 'L', '$')

Keymap('v', '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
Keymap('x', '<leader>p', '"_dP', { desc = 'Paste but do not replace register' })
Keymap('n', '<leader><leader>', '<C-^>', { desc = 'Toggle last jumppath' })

Keymap('n', '<leader>bb', '<cmd>bd<cr>', { desc = ':bdelete' })
Keymap('n', '<leader>bB', '<cmd>bd!<cr>', { desc = ':bdelete!' })
-- close other buffers except the current
Keymap('n', '<leader>bo', '<cmd>%bd|e#|bd#<cr>', { desc = 'bdelete other buffers' })
-- Keymap('n', '<leader>qq', '<cmd>q<cr>', { desc = ':quit' })
Keymap('n', '<leader>qq', '<cmd>q<cr>', { desc = ':quit' })
Keymap('n', '<leader>qQ', '<cmd>q!<cr>', { desc = ':quit!' })
Keymap('n', '<leader>qa', '<cmd>qa<cr>', { desc = ':qall' })
Keymap('n', '<leader>qA', '<cmd>qa!<cr>', { desc = ':qall!' })
Keymap('n', '<leader>w', '<cmd>w<cr>', { desc = ':write' })

Keymap('n', '[b', '<cmd>bprevious<cr>')
Keymap('n', ']b', '<cmd>bnext<cr>')
Keymap('n', '[B', '<cmd>bfirst<cr>')
Keymap('n', ']B', '<cmd>blast<cr>')

Keymap('i', '<C-a>', '<Esc>^i')
Keymap('i', '<C-e>', '<Esc>$a')

-- Move lines
Keymap('n', '<A-j>', '<cmd>move+1<cr>==')
Keymap('n', '<A-k>', '<cmd>move-2<cr>==')
Keymap('i', '<A-j>', '<Esc><cmd>move+1<cr>==gi')
Keymap('i', '<A-k>', '<Esc><cmd>move-2<cr>==gi')
Keymap('v', '<A-j>', "<Esc><cmd>'<,'>move'>+1<cr>gv=gv")
Keymap('v', '<A-k>', "<Esc><cmd>'<,'>move'<-2<cr>gv=gv")

Keymap('n', ']<Space>', 'o<Esc>k', { desc = 'Add a blank line above' })
Keymap('n', '[<Space>', 'O<Esc>j', { desc = 'Add a blank line below' })

-- Keymap('n', 'sv', '<cmd>vsp<cr>')
-- Keymap('n', 'ss', '<cmd>sp<cr>')
-- Keymap('n', 'sc', '<C-w>c')
-- Keymap('n', 'so', '<C-w>o')
Keymap('n', '<C-h>', '<C-w>h')
Keymap('n', '<C-j>', '<C-w>j')
Keymap('n', '<C-k>', '<C-w>k')
Keymap('n', '<C-l>', '<C-w>l')

Keymap('n', '<A-right>', '<cmd>vertical resize+5<cr>')
Keymap('n', '<A-left>', '<cmd>vertical resize-5<cr>')
Keymap('n', '<A-up>', '<cmd>resize+5<cr>')
Keymap('n', '<A-down>', '<cmd>resize-5<cr>')

-- Cmdline shortcuts
Keymap('c', '<C-a>', '<Home>')
Keymap('c', '<C-e>', '<End>')
Keymap('c', '<C-b>', '<C-Left>')
Keymap('c', '<C-f>', '<C-Right>')

-- quickfix
Keymap('n', '[q', '<cmd>cprevious<cr>zz')
Keymap('n', ']q', '<cmd>cnext<cr>zz')
Keymap('n', '[Q', '<cmd>cfirst<cr>zz')
Keymap('n', ']Q', '<cmd>clast<cr>zz')
Keymap('n', '<Space>qo', '<cmd>copen<cr>')
Keymap('n', '<Space>qc', '<cmd>cclose<cr>')

-- Floaterm
-- Keymap('n', '<Space>t', '<cmd>FloatermToggle<cr>')
-- Keymap('t', '<Space>t', '<C-\\><C-n>:FloatermToggle<cr>')
-- Keymap('t', '<A-n>', '<C-\\><C-n>:FloatermNew<cr>')
-- Keymap('t', '<A-k>', '<C-\\><C-n>:FloatermKill<cr>')
-- Keymap('t', '<A-h>', '<C-\\><C-n>:FloatermPrev<cr>')
-- Keymap('t', '<A-l>', '<C-\\><C-n>:FloatermNext<cr>')
-- Keymap('t', '<A-q>', '<C-\\><C-n>')
Keymap('n', '<Space>lg', '<cmd>FloatermNew --title=lazygit --autoclose=2 lazygit<cr>')
Keymap('n', '<Space>lf', '<cmd>FloatermNew --title=fl --autoclose=2 lf<cr>')
