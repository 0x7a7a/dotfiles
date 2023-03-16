Keymap = function(mode, key, cmd, opts)
  opts = opts or {
    noremap = true,
    silent = true,
  }
  vim.keymap.set(mode, key, cmd, opts)
end

Keymap('n', '<leader>bb', ':BufDel<CR>')
Keymap('n', '<leader>bB', ':BufDel!<CR>')
Keymap('n', '<leader>ba', ':BufDelAll<CR>')
Keymap('n', '<leader>bo', ':BufDelOthers<CR>')
Keymap('n', '<leader>bp', ':BufferLinePickClose<CR>')
Keymap('n', '<leader>bs', ':BufferLinePick<CR>')

Keymap('n', '<leader>qq', ':q<CR>')
Keymap('n', '<leader>qQ', ':q!<CR>')
Keymap('n', '<leader>qa', ':qa<CR>')
Keymap('n', '<leader>qA', ':qa!<CR>')
Keymap('n', '<leader>qc', ':cclose<CR>')
Keymap('n', '<leader>w', ':w<CR>')

Keymap('i', '<C-e>', '<Esc>$a')
Keymap('n', 'H', '^')
Keymap('n', 'L', '$')

-- Move lines
Keymap('n', '<A-j>', '<Cmd>move+1<CR>==')
Keymap('n', '<A-k>', '<Cmd>move-2<CR>==')
Keymap('i', '<A-j>', '<Esc><Cmd>move+1<CR>==gi')
Keymap('i', '<A-k>', '<Esc><Cmd>move-2<CR>==gi')
Keymap('v', '<A-j>', "<Esc><Cmd>'<,'>move'>+1<CR>gv=gv")
Keymap('v', '<A-k>', "<Esc><Cmd>'<,'>move'<-2<CR>gv=gv")

-- Navigation in the quickfix and location
Keymap('n', '[q', ':cprevious<CR>')
Keymap('n', ']q', ':cnext<CR>')
Keymap('n', '[Q', ':cfirst<CR>')
Keymap('n', ']Q', ':clast<CR>')

Keymap('n', '[l', ':lprevious<CR>')
Keymap('n', ']l', ':lnext<CR>')
Keymap('n', '[L', ':lfirst<CR>')
Keymap('n', ']L', ':llast<CR>')

Keymap('n', ']<Space>', 'o<Esc>k')
Keymap('n', '[<Space>', 'O<Esc>j')

Keymap('n', 'sv', ':vsp<CR>')
Keymap('n', 'sh', ':sp<CR>')
Keymap('n', 'sc', '<C-w>c')
Keymap('n', 'so', '<C-w>o')
-- Keymap('', 'sh', '<C-w>h')
-- Keymap('', 'sj', '<C-w>j')
-- Keymap('', 'sk', '<C-w>k')
-- Keymap('', 'sl', '<C-w>l')
Keymap('', '<C-h>', '<C-w>h')
Keymap('', '<C-j>', '<C-w>j')
Keymap('', '<C-k>', '<C-w>k')
Keymap('', '<C-l>', '<C-w>l')

Keymap('n', '<A-right>', ':vertical resize+5<CR>')
Keymap('n', '<A-left>', ':vertical resize-5<CR>')
Keymap('n', '<A-up>', ':resize+5<CR>')
Keymap('n', '<A-down>', ':resize-5<CR>')

-- Cmdline shortcuts
Keymap('c', '<C-a>', '<Home>', { noremap = true })
Keymap('c', '<C-e>', '<End>', { noremap = true })
Keymap('c', '<A-b>', '<C-Left>', { noremap = true })
Keymap('c', '<A-f>', '<C-Right>', { noremap = true })
Keymap('c', '<C-k>', '<C-\\>e(strpart(getcmdline(), 0, getcmdpos() - 1))<CR>', { noremap = true })
Keymap('c', '<C-l>', '<C-\\>e("")<CR>', { noremap = true })

-- Floaterm
Keymap('n', '<leader>f', ':FloatermToggle<CR>')
Keymap('t', '<leader>f', '<C-\\><C-n>:FloatermToggle<CR>')
Keymap('t', '<A-n>', '<C-\\><C-n>:FloatermNew<CR>')
Keymap('t', '<A-k>', '<C-\\><C-n>:FloatermKill<CR>')
Keymap('t', '<A-h>', '<C-\\><C-n>:FloatermPrev<CR>')
Keymap('t', '<A-l>', '<C-\\><C-n>:FloatermNext<CR>')
Keymap('t', '<A-q>', '<C-\\><C-n>')

Keymap('n', '<leader>lg', ':FloatermNew --title=lazygit --autoclose=2 lazygit<CR>')
Keymap('n', '<leader>lf', ':FloatermNew --title=fl --autoclose=2 lf<CR>')

-- Async task
Keymap('n', '<F5>', ':AsyncTask dev<CR>')
Keymap('n', '<F6>', ':AsyncTask build<CR>')

-- Variable jumping
Keymap('n', '<a-n>', ':lua require"illuminate".next_reference{wrap=true}<cr>')
Keymap('n', '<a-p>', ':lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>')

-- Nvim-lsp-ts-utils
Keymap('n', '<leader>ia', ':TSLspImportAll<CR>')
Keymap('n', '<leader>io', ':TSLspOrganize<CR>')

-- Easyalign
Keymap('n', 'ga', ':EasyAlign<CR>')
Keymap('x', 'ga', ':EasyAlign<CR>')

-- Test
Keymap('n', '<leader>tt', ':TestNearest -strategy=floaterm<CR>')
Keymap('n', '<leader>tf', ':TestFile<CR>')
Keymap('n', '<leader>ts', ':TestSuite<CR>')
Keymap('n', '<leader>tl', ':TestLast<CR>')
Keymap('n', '<leader>tv', ':TestVisit<CR>')

-- Dev
Keymap('n', '<leader>R', ':source %<CR>')
Keymap('n', '<leader>L', ':luafile %<CR>')

-- Outline
Keymap('n', '<leader>o', ':TagbarToggle<CR>')

-- Vim-go
Keymap('n', '<leader>gd', ':GoDoc<CR>')
Keymap('n', '<leader>gD', ':GoDocBrowser<CR>')
Keymap('n', '<leader>gf', ':GoFillStruct<CR>')
