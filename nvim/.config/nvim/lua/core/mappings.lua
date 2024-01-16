Keymap = function(mode, key, cmd, opts)
  opts = opts or {
    noremap = true,
    silent = true,
  }
  vim.keymap.set(mode, key, cmd, opts)
end

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

-- Navigation in the quickfix and location
Keymap('n', '[q', '<cmd>cprevious<cr>')
Keymap('n', ']q', '<cmd>cnext<cr>')
Keymap('n', '[Q', '<cmd>cfirst<cr>')
Keymap('n', ']Q', '<cmd>clast<cr>')
Keymap('n', '<leader>qo', '<cmd>copen<cr>')
Keymap('n', '<leader>qc', '<cmd>cclose<cr>')

Keymap('n', '[l', '<cmd>lprevious<cr>')
Keymap('n', ']l', '<cmd>lnext<cr>')
Keymap('n', '[L', '<cmd>lfirst<cr>')
Keymap('n', ']L', '<cmd>llast<cr>')

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
Keymap('n', '<leader>f', '<cmd>FloatermToggle<cr>')
Keymap('t', '<leader>f', '<C-\\><C-n>:FloatermToggle<cr>')
Keymap('t', '<A-n>', '<C-\\><C-n>:FloatermNew<cr>')
Keymap('t', '<A-k>', '<C-\\><C-n>:FloatermKill<cr>')
Keymap('t', '<A-h>', '<C-\\><C-n>:FloatermPrev<cr>')
Keymap('t', '<A-l>', '<C-\\><C-n>:FloatermNext<cr>')
Keymap('t', '<A-q>', '<C-\\><C-n>')

Keymap('n', '<leader>lg', '<cmd>FloatermNew --title=lazygit --autoclose=2 lazygit<cr>')
Keymap('n', '<leader>lf', '<cmd>FloatermNew --title=fl --autoclose=2 lf<cr>')

-- Async task
Keymap('n', '<F5>', '<cmd>AsyncTask dev<cr>')
Keymap('n', '<F6>', '<cmd>AsyncTask build<cr>')

-- Variable jumping
Keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>')
Keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>')

-- Easyalign
Keymap('n', 'ga', '<cmd>EasyAlign<cr>')
Keymap('x', 'ga', '<cmd>EasyAlign<cr>')

-- Dev
Keymap('n', '<leader>R', '<cmd>source %<cr>')
Keymap('n', '<leader>L', '<cmd>luafile %<cr>')

Keymap('n', '[d', vim.diagnostic.goto_prev)
Keymap('n', ']d', vim.diagnostic.goto_next)
