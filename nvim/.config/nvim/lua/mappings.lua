local map = vim.keymap.set

map('n', 'j', function()
  return vim.v.count > 0 and "m'" .. vim.v.count .. 'j' or 'gj'
end, { noremap = true, expr = true, desc = 'Move down by display line' })
map('n', 'k', function()
  return vim.v.count > 0 and "m'" .. vim.v.count .. 'k' or 'gk'
end, { noremap = true, expr = true, desc = 'Move up by display line' })

map({ 'n', '!' }, '<C-c>', '<Esc>', { desc = 'Escape' })
map('i', '<S-CR>', '<Esc>o', { desc = 'Insert line below' })

map('v', '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
map('x', '<leader>p', '"_dP', { desc = 'Paste but do not replace register' })
map('n', 'c', '"_c', { desc = 'Pure key c' })
map('n', '<leader><leader>', '<C-^>', { desc = 'Toggle last jumppath' })

-- Close other buffers except the current
map('n', '<leader>bo', Z.close_other_bufs, { desc = 'bdelete other buffers' })
map('n', '<leader>bb', '<cmd>bd<CR>', { desc = ':bdelete' })
map('n', '<leader>bB', '<cmd>bd!<CR>', { desc = ':bdelete!' })
map('n', '<leader>w', '<cmd>w<CR>', { desc = ':write' })
map('n', '<leader>qa', '<cmd>qa<CR>', { desc = ':qall' })

map('n', '[b', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
map('n', ']b', '<cmd>bnext<CR>', { desc = 'Next buffer' })

-- Tab
map('n', '<leader><tab>n', '<cmd>$tabnew<CR>', { noremap = true, desc = 'New tab' })
map('n', '<leader><tab>c', '<cmd>tabclose<CR>', { noremap = true, desc = 'Close tab' })
map('n', '<leader><tab>o', '<cmd>tabonly<CR>', { noremap = true, desc = 'Close other tabs' })
map('n', '[t', '<cmd>tabp<CR>', { noremap = true, desc = 'Previous tab' })
map('n', ']t', '<cmd>tabn<CR>', { noremap = true, desc = 'Next tab' })
map('n', '<leader><tab>mp', '<cmd>-tabmove<CR>', { noremap = true, desc = 'Move tab left' })
map('n', '<leader><tab>mn', '<cmd>+tabmove<CR>', { noremap = true, desc = 'Move tab right' })

-- Extend the default behavior
map('i', '<C-h>', '<BS>', { desc = 'Delete previous character' })
map('i', '<C-d>', '<Del>', { desc = 'Delete next character' })
map('i', '<C-b>', '<Left>', { desc = 'Move cursor left' })
map('i', '<C-f>', '<Right>', { desc = 'Move cursor right' })
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
map({ 'i' }, '<C-a>', '<Esc>^i', { desc = 'Go to line start' })
map('i', '<C-e>', [[pumvisible() ? '<C-e>' : '<end>']], {
  desc = 'go to line end or abort completion when pum is visible',
  noremap = true,
  expr = true,
})
map('n', 'H', '^', { desc = 'Go to first non-blank character' })
map('n', 'L', 'g_', { desc = 'Go to last non-blank character' })

-- Move lines
map('n', '<A-j>', '<cmd>move+1<CR>==', { desc = 'Move line down' })
map('n', '<A-k>', '<cmd>move-2<CR>==', { desc = 'Move line up' })
map('i', '<A-j>', '<Esc><cmd>move+1<CR>==gi', { desc = 'Move line down' })
map('i', '<A-k>', '<Esc><cmd>move-2<CR>==gi', { desc = 'Move line up' })
map('v', '<A-j>', "<Esc><cmd>'<,'>move'>+1<CR>gv=gv", { desc = 'Move selection down' })
map('v', '<A-k>', "<Esc><cmd>'<,'>move'<-2<CR>gv=gv", { desc = 'Move selection up' })

map('n', '<A-right>', '<cmd>vertical resize+5<CR>', { desc = 'Increase window width' })
map('n', '<A-left>', '<cmd>vertical resize-5<CR>', { desc = 'Decrease window width' })
map('n', '<A-up>', '<cmd>resize+5<CR>', { desc = 'Increase window height' })
map('n', '<A-down>', '<cmd>resize-5<CR>', { desc = 'Decrease window height' })

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
map('c', '<C-b>', '<Left>', { noremap = true, desc = 'Move cursor left' })
map('c', '<C-f>', '<Right>', { noremap = true, desc = 'Move cursor right' })
map('c', '<C-a>', '<Home>', { noremap = true, desc = 'Go to command start' })
map('c', '<C-e>', '<End>', { noremap = true, desc = 'Go to command end' })
map('c', '<C-h>', '<BS>', { noremap = true, desc = 'Delete previous character' })
map('c', '<C-d>', '<Del>', { noremap = true, desc = 'Delete next character' })
map('c', '<C-k>', [[<C-\>e(strpart(getcmdline(), 0, getcmdpos() - 1))<CR>]], {
  noremap = true,
  desc = 'Delete to command end',
})
map('c', '<A-b>', '<S-Left>', { noremap = true, desc = 'Move one word left' })
map('c', '<A-f>', '<S-Right>', { noremap = true, desc = 'Move one word right' })

-- Block insert in line visual mode
map('x', 'I', function()
  return vim.fn.mode() == 'V' and '^<C-v>I' or 'I'
end, { expr = true, desc = 'Insert at selection start' })
map('x', 'A', function()
  return vim.fn.mode() == 'V' and '$<C-v>A' or 'A'
end, { expr = true, desc = 'Append at selection end' })

-- window navigation
if not Z.is_mac() then
  map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
  map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
  map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
  map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })
end

-- https://www.reddit.com/r/neovim/comments/1og2pg9/mom_can_i_have_harpoon_we_have_harpoon_at_home/
map('n', '<leader>H', '<CMD>$arga<CR>', { silent = true, desc = 'Add current file to arg list' })
for i = 1, 9 do
  map('n', '<leader>' .. i, '<CMD>argu ' .. i .. '<CR>', { silent = true, desc = 'Go to arg ' .. i })
  map('n', '<leader>h' .. i, '<CMD>' .. i - 1 .. 'arga<CR>', { silent = true, desc = 'Add current to arg ' .. i })
  map('n', '<leader>D' .. i, '<CMD>' .. i .. 'argd<CR>', { silent = true, desc = 'Delete current arg' })
end

map('n', '<leader>hq', function()
  local list = vim.fn.argv()
  if type(list) == 'string' then
    list = { list }
  end

  if #list > 0 then
    local qf_items = {}
    for _, filename in ipairs(list) do
      table.insert(qf_items, {
        filename = filename,
        lnum = 1,
        text = filename,
      })
    end
    vim.fn.setqflist(qf_items, 'r')
    vim.cmd.copen()
  end
end, { silent = true, desc = 'Show args in qf' })
