vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	-- 主题
	use("rebelot/kanagawa.nvim")
	use("folke/tokyonight.nvim")
	use("projekt0n/github-nvim-theme")
	use("olimorris/onedarkpro.nvim")
	use("rmehri01/onenord.nvim")
	-- smooth
	use({
		"psliwka/vim-smoothie",
		config = "vim.gsmoothie_enabled = true",
	})
	-- 侧边栏文件管理
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	-- 保存会话状态
	use("rmagatti/auto-session")
	-- 悬浮ranger
	use("kevinhwang91/rnvimr")
	-- 顶部 bufferline
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	-- 代码高亮 treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	-- status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
	})
	-- git sign
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		-- tag = 'release' -- To use the latest release
	})
	-- 文件搜索
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- 终端
	use("akinsho/toggleterm.nvim")
	-- 彩虹括号
	use("p00f/nvim-ts-rainbow")
	-- 快捷键提示
	use("folke/which-key.nvim")
	-- 缩进提示
	use("lukas-reineke/indent-blankline.nvim")
	-- trouble
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	-- HOP 快捷跳转
	use("phaazon/hop.nvim")
	-- Golang
	use("fatih/vim-go")
	-- LSP
	use("neovim/nvim-lspconfig")
	-- 括号补全
	use("windwp/nvim-autopairs")
	-- nvim-cmp
	use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
	use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
	use("hrsh7th/cmp-path") -- { name = 'path' }
	use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
	use("hrsh7th/nvim-cmp")
	use("tami5/lspsaga.nvim")
	use("folke/lsp-colors.nvim")
	-- lspkind 补全分类图标
	use("onsails/lspkind-nvim")
	use("ray-x/lsp_signature.nvim")
	-- 代码片断
	-- use("hrsh7th/cmp-vsnip")
	-- use("hrsh7th/vim-vsnip")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	-- 注释
	use("numToStr/Comment.nvim")
	-- 格式化
	use("mhartington/formatter.nvim")
	-- fzf
	use("junegunn/fzf")
	use("junegunn/fzf.vim")
	-- git
	use("tpope/vim-fugitive")
	-- %匹配
	use("andymass/vim-matchup")
	-- surround
	use("tpope/vim-surround")
end)
