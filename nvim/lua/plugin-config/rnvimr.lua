-- Make Ranger replace Netrw and be the file explorer
vim.g.rnvimr_enable_ex = 1
-- Make Ranger to be hidden after picking a file
vim.g.rnvimr_enable_picker = 1
-- Add a shadow window, value is equal to 100 will disable shadow
vim.g.rnvimr_enable_bw = 1
vim.g.rnvimr_ranger_cmd = 'ranger --cmd="set draw_borders both"'
