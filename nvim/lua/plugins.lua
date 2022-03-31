vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	-- 主题
	use("rebelot/kanagawa.nvim")
	use("folke/tokyonight.nvim")
	use("sainnhe/gruvbox-material")
	-- use("projekt0n/github-nvim-theme")
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
	-- 高亮当前变量
	use("RRethy/vim-illuminate")
	use("RRethy/nvim-treesitter-textsubjects")
	-- status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
	})
	-- git
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		-- tag = 'release' -- To use the latest release
	})
	-- 文件搜索
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	-- 彩虹括号
	use({ "p00f/nvim-ts-rainbow" })
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
	use("buoto/gotests-vim")
	-- typescript
	use("leafgarland/typescript-vim")
	--javascript
	use("pangloss/vim-javascript")
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
	use("rmagatti/goto-preview")
	-- 代码片段
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	-- 注释
	use("numToStr/Comment.nvim")
	-- use({
	-- 	"danymat/neogen",
	-- 	config = function()
	-- 		require("neogen").setup()
	-- 	end,
	-- })
	-- 格式化
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	-- fzf
	use("junegunn/fzf")
	use("junegunn/fzf.vim")
	-- git
	use("tpope/vim-fugitive")
	-- %匹配
	use("andymass/vim-matchup")
	-- surround
	use("tpope/vim-surround")

	-- github coplilot
	use("github/copilot.vim")

	-- markdown
	use("iamcco/markdown-preview.nvim")

	-- todo comments
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	-- floaterm
	use("voldikss/vim-floaterm")

	-- asyncrun/task
	use("skywind3000/asynctasks.vim")
	use("skywind3000/asyncrun.vim")

	-- auto tag
	use("windwp/nvim-ts-autotag")

	-- 插件提速
	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
		end,
	})
	-- lsp载入状态
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	})
	-- 大纲
	use("simrat39/symbols-outline.nvim")
	-- use("unblevable/quick-scope")
end)
