-- Automatically install packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({
        'git', 'clone',
        '--depth', '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    vim.api.nvim_command('packadd packer.nvim')
end

require("packer").startup(function()
    -- packer can manage itself
    use("wbthomason/packer.nvim")

    -- dependence
    use("kyazdani42/nvim-web-devicons")
    use("nvim-lua/plenary.nvim")

    -- colorscheme
    use("rebelot/kanagawa.nvim")
    use("folke/tokyonight.nvim")
    use("projekt0n/github-nvim-theme")

    -- base(usually need't key map)
    use("karb94/neoscroll.nvim")
    use("rmagatti/auto-session")
    use("akinsho/bufferline.nvim")
    use("RRethy/vim-illuminate")
    use("nvim-lualine/lualine.nvim")
    use("p00f/nvim-ts-rainbow")
    use("folke/which-key.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use("windwp/nvim-ts-autotag")
    use("j-hui/fidget.nvim")
    use("windwp/nvim-autopairs")
    use("junegunn/fzf")
    use("junegunn/fzf.vim")
    use("andymass/vim-matchup")
    use("romainl/vim-cool")
    use("lewis6991/impatient.nvim")
    use("tpope/vim-repeat")
    use("github/copilot.vim")
    use({ 'lewis6991/gitsigns.nvim', tag = 'release' })
    use("norcalli/nvim-colorizer.lua")
    -- use("unblevable/quick-scope")


    -- tools(need key map to call)
    use("kyazdani42/nvim-tree.lua")
    use("tpope/vim-surround")
    use("iamcco/markdown-preview.nvim")
    use("folke/todo-comments.nvim")
    use("AndrewRadev/splitjoin.vim")
    use("folke/trouble.nvim")
    use("phaazon/hop.nvim")
    use("simrat39/symbols-outline.nvim")
    use("numToStr/Comment.nvim")
    use("jose-elias-alvarez/null-ls.nvim")
    use { 'ray-x/navigator.lua', requires = { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' } }
    -- use({
    -- 	"danymat/neogen",
    -- 	config = function()
    -- 		require("neogen").setup()
    -- 	end,
    -- })
    --
    -- git
    use("nvim-telescope/telescope.nvim")
    use("tpope/vim-fugitive")
    -- syntax
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("RRethy/nvim-treesitter-textsubjects")
    use("SmiteshP/nvim-gps")
    -- multiple line
    -- https://github.com/mg979/vim-visual-multi
    -- use { 'mg979/vim-visual-multi', as = 'multiple-cursors'}

    -- asyncrun/task,build and test
    use("skywind3000/asynctasks.vim")
    use("skywind3000/asyncrun.vim")

    -- lsp
    use("neovim/nvim-lspconfig")
    use("folke/lsp-colors.nvim")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
    use("onsails/lspkind-nvim")
    use("ray-x/lsp_signature.nvim")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")
    -- golang
    use("fatih/vim-go")
    use("buoto/gotests-vim")
    -- typescript
    use("leafgarland/typescript-vim")
    use("jose-elias-alvarez/nvim-lsp-ts-utils")
    --javascript
    use("pangloss/vim-javascript")

    -- floaterm
    use("voldikss/vim-floaterm")

end)

-- one line setup
require('neoscroll').setup()
require('impatient')
require('todo-comments').setup()
require('fidget').setup()


Keymap("n", "<leader>ps", ":PackerSync<CR>")
Keymap("n", "<leader>pu", ":PackerUpdate<CR>")
Keymap("n", "<leader>pi", ":PackerInstall<CR>")
Keymap("n", "<leader>pc", ":PackerClean<CR>")
