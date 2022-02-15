local map = vim.api.nvim_set_keymap
local opt = {
	noremap = true,
	silent = true,
}

-- set leader
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- 基础 --
-- 插入模式光标快捷移动
map("i", "<C-h>", "<Left>", opt)
map("i", "<C-l>", "<Right>", opt)

-- 快捷保存和退出
map("n", "<leader>q", ":q<CR>", opt)
map("n", "<leader>w", ":w<CR>", opt)

-- 缩进
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- 分屏
map("n", "sv", ":vsp<CR>", opt)
map("n", "ss", ":sp<CR>", opt)
map("n", "sc", "<C-w>c", opt)
map("n", "so", "<C-w>o", opt)

map("", "sh", "<C-w>h", opt)
map("", "sj", "<C-w>j", opt)
map("", "sk", "<C-w>k", opt)
map("", "sl", "<C-w>l", opt)

map("n", "<A-right>", ":vertical resize+5<CR>", opt)
map("n", "<A-left>", ":vertical resize-5<CR>", opt)
map("n", "<A-up>", ":resize+5<CR>", opt)
map("n", "<A-down>", ":resize-5<CR>", opt)

-- Packer
map("n", "<leader>ps", ":PackerSync<CR>", opt)
map("n", "<leader>pu", ":PackerUpdate<CR>", opt)
map("n", "<leader>pi", ":PackerInstall<CR>", opt)
map("n", "<leader>pc", ":PackerClean<CR>", opt)

-- session
map("n", "<leader>s", ":SaveSession<CR>", opt)

-- 插件相关 --
-- 文件侧边栏 Defx
map("n", "<C-n>", ":NvimTreeToggle<CR>", opt)

-- trouble
map("n", "gt", ":TroubleToggle document_diagnostics<CR>", opt)
map("n", "gT", ":TroubleToggle workspace_diagnostics<CR>", opt)

-- rnvimr
map("n", "<leader>n", ":RnvimrToggle<CR>", opt)

-- bufferline 左右Tab切换
map("n", "<S-Tab>", ":bprev<Return>", opt)
map("n", "<Tab>", ":bnext<Return>", opt)

map("n", "sf", ":Telescope find_files<CR>", opt)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opt)
map("n", "<leader>fb", ":Telescope buffers<CR>", opt)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opt)

-- hop
map("n", "\f", "<cmd>lua require'hop'.hint_char1<CR>", opt)
map(
	"n",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
	{}
)
map(
	"n",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
	{}
)
map(
	"o",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
	{}
)
map(
	"o",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
	{}
)
map(
	"",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
	{}
)
map(
	"",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
	{}
)
map("n", "sn", ":HopLineStart<CR>", opt)
map("n", "sa", ":HopChar2<CR>", opt)

-- lspsaga
map("n", "<F2>", ":Lspsaga diagnostic_jump_next<CR>", opt)
map("n", "<C-k>", ":Lspsaga signature_help<CR>", opt)
map("n", "gh", ":Lspsaga lsp_finder<CR>", opt)
map("n", "gk", ":Lspsaga hover_doc<CR>", opt)
map("n", "gi", ":Lspsaga implement<CR>", opt)
map("n", "gp", ":Lspsaga preview_definition<CR>", opt)
map("n", "<C-space>", ":Lspsaga code_action<CR>", opt)
map("i", "<C-space>", "<Cmd>Lspsaga code_action<CR>", opt)
map("n", "R", ":Lspsaga rename<CR>", opt)
-- 这两个暂时无效
-- map('n', '<C-f>', ":lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opt)
-- map('n', '<C-b>', ":lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opt)

-- bufferline
map("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", opt)
map("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", opt)
map("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", opt)
map("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", opt)
map("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", opt)
map("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", opt)
map("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", opt)
map("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", opt)
map("n", "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", opt)
-- map("n", "<leader>bp", "<Cmd>BufferLinePickClose<CR>", opt)
-- map("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", opt)
-- map("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", opt)
-- map("n", "<leader>bc", "<Cmd>:%bd|e#|bd#<CR>", opt)
map("n", "<leader>b", "<Cmd>:bd<CR>", opt)
map("n", "<leader>B", "<Cmd>:%bd|e#|bd#<CR>", opt)
map("n", "sb", ":BufferLinePick<CR>", opt)

-- vim-go
map("n", "<leader>gr", "<Cmd>GoRun<CR>", opt)
map("n", "<leader>gf", "<Cmd>GoFillStruct<CR>", opt)
map("n", "<leader>gt", "<Cmd>GoAddTags<CR>", opt)

-- toggleterm
function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<A-q>", [[<C-\><C-n>]], opts)
	-- vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
