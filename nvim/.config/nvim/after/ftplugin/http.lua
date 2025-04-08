vim.keymap.set('n', '<leader>r', function()
  require('kulala').run()
end, {
  noremap = true,
  silent = true,
  desc = 'Run current request',
  buffer = true,
})
vim.keymap.set('n', '<leader>R', function()
  require('kulala').replay()
end, {
  noremap = true,
  silent = true,
  desc = 'Replay last request',
  buffer = true,
})
vim.keymap.set('n', '[[', function()
  require('kulala').jump_prev()
end, {
  noremap = true,
  silent = true,
  desc = 'Jump to previous request',
  buffer = true,
})
vim.keymap.set('n', ']]', function()
  require('kulala').jump_next()
end, {
  noremap = true,
  silent = true,
  desc = 'Jump to next request',
  buffer = true,
})
vim.keymap.set('n', '<leader>hi', function()
  require('kulala').inspect()
end, {
  noremap = true,
  silent = true,
  desc = 'Inspect current request',
  buffer = true,
})
vim.keymap.set('n', '<leader>hs', function()
  require('kulala').show_stats()
end, {
  noremap = true,
  silent = true,
  desc = 'Show last request statistics',
  buffer = true,
})
vim.keymap.set('n', '<leader>ht', function()
  require('kulala').scratchpad()
end, {
  noremap = true,
  silent = true,
  desc = 'Open scratchpad',
  buffer = true,
})
vim.keymap.set('n', '<leader>he', function()
  require('kulala').copy()
end, {
  noremap = true,
  silent = true,
  desc = 'Copy request as cURL command',
  buffer = true,
})
vim.keymap.set('n', '<leader>hd', function()
  require('kulala').from_curl()
end, {
  noremap = true,
  silent = true,
  desc = 'Parse cURL command from clipboard',
  buffer = true,
})
vim.keymap.set('n', '<leader>hc', function()
  require('kulala').close()
end, {
  noremap = true,
  silent = true,
  desc = 'Close kulala window and buffer',
  buffer = true,
})
vim.keymap.set('n', '<leader>hh', function()
  require('kulala').toggle_view()
end, {
  noremap = true,
  silent = true,
  desc = 'Toggle between body and headers view',
  buffer = true,
})
