vim.keymap.set('n', '<leader>r', ":lua require('kulala').run()<CR>", {
  noremap = true,
  silent = true,
  desc = 'runs the current request',
  buffer = true,
})
vim.keymap.set('n', '<leader>R', ":lua require('kulala').replay()<CR>", {
  noremap = true,
  silent = true,
  desc = 'replays the last run request',
  buffer = true,
})
vim.keymap.set('n', '[[', ":lua require('kulala').jump_prev()<CR>", {
  noremap = true,
  silent = true,
  desc = 'jumps to the previous request',
  buffer = true,
})
vim.keymap.set('n', ']]', ":lua require('kulala').jump_next()<CR>", {
  noremap = true,
  silent = true,
  desc = 'jumps to the next request',
  buffer = true,
})
vim.keymap.set('n', '<leader>hi', ":lua require('kulala').inspect()<CR>", {
  noremap = true,
  silent = true,
  desc = 'inspects the current request',
  buffer = true,
})
vim.keymap.set('n', '<leader>hs', ":lua require('kulala').show_stats()<CR>", {
  noremap = true,
  silent = true,
  desc = 'shows the statistics of the last run request',
  buffer = true,
})
vim.keymap.set('n', '<leader>ht', ":lua require('kulala').scratchpad()<CR>", {
  noremap = true,
  silent = true,
  desc = 'opens the scratchpad',
  buffer = true,
})
vim.keymap.set('n', '<leader>he', ":lua require('kulala').copy()<CR>", {
  noremap = true,
  silent = true,
  desc = 'copies the current request (as cURL command) to the clipboard',
  buffer = true,
})
vim.keymap.set('n', '<leader>hd', ":lua require('kulala').from_curl()<CR>", {
  noremap = true,
  silent = true,
  desc = 'parse the cURL command from the clipboard',
  buffer = true,
})
vim.keymap.set('n', '<leader>hc', ":lua require('kulala').close()<CR>", {
  noremap = true,
  silent = true,
  desc = 'closes the kulala window and also the current buffer',
  buffer = true,
})
vim.keymap.set('n', '<leader>hh', ":lua require('kulala').toggle_view()<CR>", {
  noremap = true,
  silent = true,
  desc = 'toggles between the body and headers view of the last run request',
  buffer = true,
})
