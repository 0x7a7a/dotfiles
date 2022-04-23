Keymap = function(mode, key, cmd, opts)
  opts = opts or { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode, key, cmd, opts)
end

Keymap("n", "]<Space>", "o<Esc>k")
Keymap("n", "[<Space>", "O<Esc>j")

Keymap("n", "<leader>qq", ":q<CR>")
Keymap("n", "<leader>qQ", ":q!<CR>")
Keymap("n", "<leader>qa", ":qa<CR>")
Keymap("n", "<leader>qc", ":cclose<CR>")
Keymap("n", "<leader>w", ":w<CR>")

Keymap("n", "sv", ":vsp<CR>")
Keymap("n", "ss", ":sp<CR>")
Keymap("n", "sc", "<C-w>c")
Keymap("n", "so", "<C-w>o")

Keymap("", "sh", "<C-w>h")
Keymap("", "sj", "<C-w>j")
Keymap("", "sk", "<C-w>k")
Keymap("", "sl", "<C-w>l")

Keymap("n", "<A-right>", ":vertical resize+5<CR>")
Keymap("n", "<A-left>", ":vertical resize-5<CR>")
Keymap("n", "<A-up>", ":resize+5<CR>")
Keymap("n", "<A-down>", ":resize-5<CR>")

-- git
Keymap("n", "<leader>gd", ":Gvdiffsplit<CR>")
Keymap("n", "<leader>gb", ":Git blame<CR>")
Keymap("n", "<leader>G", ":G<CR>")

-- markdown
Keymap("n", "<leader>m", ":MarkdownPreviewToggle<CR>")

-- floaterm
Keymap("n", "<F7>", ":FloatermNew<CR>")
Keymap("t", "<F7>", "<C-\\><C-n>:FloatermNew<CR>")
Keymap("n", "<F8>", ":FloatermPrev<CR>")
Keymap("t", "<F8>", "<C-\\><C-n>:FloatermPrev<CR>")
Keymap("n", "<F9>", ":FloatermNext<CR>")
Keymap("t", "<F9>", "<C-\\><C-n>:FloatermNext<CR>")
Keymap("n", "<F10>", ":FloatermKill<CR>")
Keymap("t", "<F10>", "<C-\\><C-n>:FloatermKill<CR>")
Keymap("n", "<F12>", ":FloatermToggle<CR>")
Keymap("t", "<F12>", "<C-\\><C-n>:FloatermToggle<CR>")
-- custome term command
Keymap("n", "<leader>lg", ":FloatermNew --title=lazygit --autoclose=2 lazygit<CR>")
Keymap("n", "<leader>lf", ":FloatermNew --title=fl --autoclose=2 lf<CR>")
Keymap("t", "<A-q>", "<C-\\><C-n>")

-- async task
Keymap("n", "<F5>", ":AsyncTask dev<CR>")
Keymap("n", "<F6>", ":AsyncTask build<CR>")

-- variable jumping
Keymap("n", "<a-n>", ':lua require"illuminate".next_reference{wrap=true}<cr>')
Keymap("n", "<a-p>", ':lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>')

-- nvim-lsp-ts-utils
Keymap("n", "<leader>Ti", ":TSLspImportAll<CR>")
Keymap("n", "<leader>Ts", ":TSLspOrganize<CR>")

-- easyalign
Keymap("n", "ga", ":EasyAlign<CR>")
Keymap("x", "ga", ":EasyAlign<CR>")

-- test
Keymap("n", "<leader>tt", ":TestNearest<CR>")
Keymap("n", "<leader>tf", ":TestFile<CR>")
Keymap("n", "<leader>ts", ":TestSuite<CR>")
Keymap("n", "<leader>tl", ":TestLast<CR>")
Keymap("n", "<leader>tv", ":TestVisit<CR>")
