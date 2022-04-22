local opt = vim.opt

vim.g.mapleader = ","
vim.g.maplocalleader = ","

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.scrolloff = 5
opt.number = true
opt.relativenumber = false
opt.cursorline = false
opt.signcolumn = "yes"
opt.wrap = false
opt.mouse = "a"
opt.writebackup = false
opt.swapfile = false
opt.updatetime = 500
opt.timeoutlen = 500
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.completeopt = "menu,menuone,noselect,noinsert"
opt.pumheight = 10
opt.formatoptions:remove('cro')
-- colorschme
opt.showmode = false
opt.background = "dark"
opt.termguicolors = true
-- fold
opt.foldenable = false


---- plugin options ----
--vim-matchup
vim.g.loaded_matchit = true
-- coplilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
-- javascript
vim.g.javascript_plugin_flow = 1
-- floaterm
vim.g.floaterm_height = 0.8
vim.g.floaterm_width = 0.7
-- asynctask
vim.g.asyncrun_open = 6
vim.g.asynctasks_term_pos = "floaterm"
