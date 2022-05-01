local executable = function(x)
  return vim.fn.executable(x) == 1
end

-- Automatically install packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  vim.api.nvim_command('packadd packer.nvim')
end

local packer = require('packer')
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
})

packer.startup(function(use)
  -- packer can manage itself
  use('wbthomason/packer.nvim')

  -- dependence
  use('nvim-lua/plenary.nvim')
  use('kyazdani42/nvim-web-devicons')

  -- colorscheme
  use('rebelot/kanagawa.nvim')
  use('folke/tokyonight.nvim')

  -- base(usually need't add key map)
  use('psliwka/vim-smoothie')
  use('rmagatti/auto-session')
  use('akinsho/bufferline.nvim')
  use('RRethy/vim-illuminate')
  use('nvim-lualine/lualine.nvim')
  use('p00f/nvim-ts-rainbow')
  use('folke/which-key.nvim')
  use('lukas-reineke/indent-blankline.nvim')
  use('windwp/nvim-ts-autotag')
  use('j-hui/fidget.nvim')
  use('windwp/nvim-autopairs')
  use('junegunn/fzf')
  use('junegunn/fzf.vim')
  use('andymass/vim-matchup')
  use('romainl/vim-cool')
  use('lewis6991/impatient.nvim')
  use('github/copilot.vim')
  use('norcalli/nvim-colorizer.lua')
  use('moll/vim-bbye')
  -- use("unblevable/quick-scope")

  -- text edit
  use('tpope/vim-repeat')
  use('tpope/vim-surround')
  use('wellle/targets.vim')
  use('junegunn/vim-easy-align')
  use('AndrewRadev/splitjoin.vim')

  -- tools(need key map to call)
  use('nvim-telescope/telescope.nvim')
  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
  use('kyazdani42/nvim-tree.lua')
  use('vim-test/vim-test')
  use('folke/trouble.nvim')
  use('phaazon/hop.nvim')
  use('simrat39/symbols-outline.nvim')
  use('numToStr/Comment.nvim')
  use('jose-elias-alvarez/null-ls.nvim')
  use('mileszs/ack.vim')
  use('dstein64/vim-startuptime')
  --use("tpope/vim-dispatch")

  -- git
  use({ 'lewis6991/gitsigns.nvim', tag = 'release' })
  use('tpope/vim-fugitive')
  -- syntax
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
  use('RRethy/nvim-treesitter-textsubjects')
  use('SmiteshP/nvim-gps')

  -- asyncrun/task,build and test
  use('skywind3000/asynctasks.vim')
  use('skywind3000/asyncrun.vim')

  -- lsp
  use('neovim/nvim-lspconfig')
  use('folke/lsp-colors.nvim')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/nvim-cmp')
  use('onsails/lspkind-nvim')
  use('ray-x/lsp_signature.nvim')
  use('L3MON4D3/LuaSnip')
  use('saadparwaiz1/cmp_luasnip')
  use('rafamadriz/friendly-snippets')
  -- go
  use('fatih/vim-go')
  use('buoto/gotests-vim')
  -- typescript
  use('leafgarland/typescript-vim')
  use('jose-elias-alvarez/nvim-lsp-ts-utils')

  -- floaterm
  use('voldikss/vim-floaterm')

  -- ack.vim
  if executable('ag') then
    vim.g.ackprg = 'ag --vimgrep'
  end
end)

-- one line setup
require('impatient')
require('luasnip.loaders.from_vscode').load()

Keymap('n', '<leader>ps', ':PackerSync<CR>')
Keymap('n', '<leader>pu', ':PackerUpdate<CR>')
Keymap('n', '<leader>pi', ':PackerInstall<CR>')
Keymap('n', '<leader>pc', ':PackerClean<CR>')

-- ack
vim.g['test#strategy'] = 'make'
Keymap('n', '<leader>a', ':Ack!<Space>')
