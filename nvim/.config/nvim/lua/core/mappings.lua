Keymap = function(mode, key, cmd, opts)
  opts = opts or {
    noremap = true,
    silent = true,
  }
  vim.keymap.set(mode, key, cmd, opts)
end

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

Keymap('n', '<leader>qq', '<cmd>q<cr>')
Keymap('n', '<leader>qQ', '<cmd>q!<cr>')
Keymap('n', '<leader>qa', '<cmd>qa<cr>')
Keymap('n', '<leader>qA', '<cmd>qa!<cr>')
Keymap('n', '<leader>w', '<cmd>w<cr>')

Keymap('i', '<C-a>', '<Esc>^i')
Keymap('i', '<C-e>', '<Esc>$a')
Keymap('n', 'H', '^')
Keymap('n', 'L', '$')

-- Move lines
Keymap('n', '<A-j>', '<cmd>move+1<cr>==')
Keymap('n', '<A-k>', '<cmd>move-2<cr>==')
Keymap('i', '<A-j>', '<Esc><cmd>move+1<cr>==gi')
Keymap('i', '<A-k>', '<Esc><cmd>move-2<cr>==gi')
Keymap('v', '<A-j>', "<Esc><cmd>'<,'>move'>+1<cr>gv=gv")
Keymap('v', '<A-k>', "<Esc><cmd>'<,'>move'<-2<cr>gv=gv")

Keymap('n', ']<Space>', 'o<Esc>k')
Keymap('n', '[<Space>', 'O<Esc>j')

Keymap('n', 'sv', '<cmd>vsp<cr>')
Keymap('n', 'sh', '<cmd>sp<cr>')
Keymap('n', 'sc', '<C-w>c')
Keymap('n', 'so', '<C-w>o')
Keymap('', '<C-h>', '<C-w>h')
Keymap('', '<C-j>', '<C-w>j')
Keymap('', '<C-k>', '<C-w>k')
Keymap('', '<C-l>', '<C-w>l')
Keymap('i', '<C-h>', '<Left>')
Keymap('i', '<C-l>', '<Right>')

Keymap('n', '<A-right>', '<cmd>vertical resize+5<cr>')
Keymap('n', '<A-left>', '<cmd>vertical resize-5<cr>')
Keymap('n', '<A-up>', '<cmd>resize+5<cr>')
Keymap('n', '<A-down>', '<cmd>resize-5<cr>')

-- Cmdline shortcuts
Keymap('c', '<C-a>', '<Home>', { noremap = true })
Keymap('c', '<C-e>', '<End>', { noremap = true })
Keymap('c', '<C-b>', '<C-Left>', { noremap = true })
Keymap('c', '<C-f>', '<C-Right>', { noremap = true })

-- Floaterm
-- Keymap('n', '<leader>f', '<cmd>FloatermToggle<cr>')
-- Keymap('t', '<leader>f', '<C-\\><C-n>:FloatermToggle<cr>')
-- Keymap('t', '<A-n>', '<C-\\><C-n>:FloatermNew<cr>')
-- Keymap('t', '<A-k>', '<C-\\><C-n>:FloatermKill<cr>')
-- Keymap('t', '<A-h>', '<C-\\><C-n>:FloatermPrev<cr>')
-- Keymap('t', '<A-l>', '<C-\\><C-n>:FloatermNext<cr>')
-- Keymap('t', '<A-q>', '<C-\\><C-n>')

Keymap('n', '<leader>lg', '<cmd>FloatermNew --title=lazygit --autoclose=2 lazygit<cr>')
Keymap('n', '<leader>lf', '<cmd>FloatermNew --title=fl --autoclose=2 lf<cr>')

-- Variable jumping
Keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>')
Keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>')

-- Easyalign
Keymap({ 'n', 'x' }, 'ga', '<cmd>EasyAlign<cr>')

-- diagnostic
Keymap('n', '[d', vim.diagnostic.goto_prev)
Keymap('n', ']d', vim.diagnostic.goto_next)
Keymap('n', '<leader>d', vim.diagnostic.setqflist, { desc = 'Open diagnostics list' })

-- quickfix
Keymap('n', '[q', '<cmd>cprevious<cr>zz')
Keymap('n', ']q', '<cmd>cnext<cr>zz')
Keymap('n', '[Q', '<cmd>cfirst<cr>zz')
Keymap('n', ']Q', '<cmd>clast<cr>zz')
Keymap('n', '<leader>qo', '<cmd>copen<cr>')
Keymap('n', '<leader>qc', '<cmd>cclose<cr>')
