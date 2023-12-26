Keymap = function(mode, key, cmd, opts)
  opts = opts or {
    noremap = true,
    silent = true,
  }
  vim.keymap.set(mode, key, cmd, opts)
end

Keymap('n', '<leader>qq', '<CMD>q<CR>')
Keymap('n', '<leader>qQ', '<CMD>q!<CR>')
Keymap('n', '<leader>qa', '<CMD>qa<CR>')
Keymap('n', '<leader>qA', '<CMD>qa!<CR>')
Keymap('n', '<leader>w', '<CMD>w<CR>')

Keymap('i', '<C-a>', '<Esc>^i')
Keymap('i', '<C-e>', '<Esc>$a')
Keymap('n', 'H', '^')
Keymap('n', 'L', '$')

-- Move lines
Keymap('n', '<A-j>', '<CMD>move+1<CR>==')
Keymap('n', '<A-k>', '<CMD>move-2<CR>==')
Keymap('i', '<A-j>', '<Esc><CMD>move+1<CR>==gi')
Keymap('i', '<A-k>', '<Esc><CMD>move-2<CR>==gi')
Keymap('v', '<A-j>', "<Esc><CMD>'<,'>move'>+1<CR>gv=gv")
Keymap('v', '<A-k>', "<Esc><CMD>'<,'>move'<-2<CR>gv=gv")

-- Navigation in the quickfix and location
Keymap('n', '[q', '<CMD>cprevious<CR>')
Keymap('n', ']q', '<CMD>cnext<CR>')
Keymap('n', '[Q', '<CMD>cfirst<CR>')
Keymap('n', ']Q', '<CMD>clast<CR>')
Keymap('n', '<leader>qo', '<CMD>copen<CR>')
Keymap('n', '<leader>qc', '<CMD>cclose<CR>')

Keymap('n', '[l', '<CMD>lprevious<CR>')
Keymap('n', ']l', '<CMD>lnext<CR>')
Keymap('n', '[L', '<CMD>lfirst<CR>')
Keymap('n', ']L', '<CMD>llast<CR>')

Keymap('n', ']<Space>', 'o<Esc>k')
Keymap('n', '[<Space>', 'O<Esc>j')

Keymap('n', 'sv', '<CMD>vsp<CR>')
Keymap('n', 'sh', '<CMD>sp<CR>')
Keymap('n', 'sc', '<C-w>c')
Keymap('n', 'so', '<C-w>o')
Keymap('', '<C-h>', '<C-w>h')
Keymap('', '<C-j>', '<C-w>j')
Keymap('', '<C-k>', '<C-w>k')
Keymap('', '<C-l>', '<C-w>l')

Keymap('n', '<A-right>', '<CMD>vertical resize+5<CR>')
Keymap('n', '<A-left>', '<CMD>vertical resize-5<CR>')
Keymap('n', '<A-up>', '<CMD>resize+5<CR>')
Keymap('n', '<A-down>', '<CMD>resize-5<CR>')

-- Cmdline shortcuts
Keymap('c', '<C-a>', '<Home>', { noremap = true })
Keymap('c', '<C-e>', '<End>', { noremap = true })
Keymap('c', '<C-b>', '<C-Left>', { noremap = true })
Keymap('c', '<C-f>', '<C-Right>', { noremap = true })

-- Floaterm
Keymap('n', '<leader>f', '<CMD>FloatermToggle<CR>')
Keymap('t', '<leader>f', '<C-\\><C-n>:FloatermToggle<CR>')
Keymap('t', '<A-n>', '<C-\\><C-n>:FloatermNew<CR>')
Keymap('t', '<A-k>', '<C-\\><C-n>:FloatermKill<CR>')
Keymap('t', '<A-h>', '<C-\\><C-n>:FloatermPrev<CR>')
Keymap('t', '<A-l>', '<C-\\><C-n>:FloatermNext<CR>')
Keymap('t', '<A-q>', '<C-\\><C-n>')

Keymap('n', '<leader>lg', '<CMD>FloatermNew --title=lazygit --autoclose=2 lazygit<CR>')
Keymap('n', '<leader>lf', '<CMD>FloatermNew --title=fl --autoclose=2 lf<CR>')

-- Async task
Keymap('n', '<F5>', '<CMD>AsyncTask dev<CR>')
Keymap('n', '<F6>', '<CMD>AsyncTask build<CR>')

-- Variable jumping
Keymap('n', '<a-n>', '<CMD>lua require"illuminate".next_reference{wrap=true}<CR>')
Keymap('n', '<a-p>', '<CMD>lua require"illuminate".next_reference{reverse=true,wrap=true}<CR>')

-- Nvim-lsp-ts-utils
Keymap('n', '<leader>ia', '<CMD>TSLspImportAll<CR>')
Keymap('n', '<leader>io', '<CMD>TSLspOrganize<CR>')

-- Easyalign
Keymap('n', 'ga', '<CMD>EasyAlign<CR>')
Keymap('x', 'ga', '<CMD>EasyAlign<CR>')

-- Dev
Keymap('n', '<leader>R', '<CMD>source %<CR>')
Keymap('n', '<leader>L', '<CMD>luafile %<CR>')

-- Harpoon
Keymap('n', '<Space>hm', '<CMD>lua require("harpoon.ui").toggle_quick_menu()<CR>')
Keymap('n', '<Space>ha', '<CMD>lua require("harpoon.mark").add_file()<CR>')
Keymap('n', '<Space>hd', '<CMD>lua require("harpoon.mark").rm_file()<CR>')
Keymap('n', '<Space>hc', '<CMD>lua require("harpoon.mark").clear_all()<CR>')
Keymap('n', '<A-]>', '<CMD>lua require("harpoon.ui").nav_next()<CR>')
Keymap('n', '<A-[>', '<CMD>lua require("harpoon.ui").nav_prev()<CR>')
