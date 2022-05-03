-- Automatically install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  vim.api.nvim_command 'packadd packer.nvim'
end

local packer = require 'packer'
-- pop-up window
-- packer.init {
--   display = {
--     open_fn = function()
--       return require('packer.util').float { border = 'rounded' }
--     end,
--   },
-- }

packer.startup(function(use)
  -- packer
  use 'wbthomason/packer.nvim'

  -- cache
  use 'lewis6991/impatient.nvim'

  -- colorscheme
  -- toolkit:
  --    https://github.com/lifepillar/vim-colortemplate
  --    https://github.com/rktjmp/lush.nvim
  use 'rebelot/kanagawa.nvim'
  use 'folke/tokyonight.nvim'
  -- use 'morhetz/gruvbox'

  -- base dependence
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- smooth scroll
  use 'psliwka/vim-smoothie'

  -- close buffer,keep window
  use 'moll/vim-bbye'

  -- auto save session
  use { 'rmagatti/auto-session', config = [[ require 'auto-session' ]] }

  -- buffer line
  use { 'akinsho/bufferline.nvim', config = [[ require 'plugins/bufferline' ]] }

  -- statusline
  use { 'nvim-lualine/lualine.nvim', config = [[ require 'plugins/lualine' ]] }
  -- show code gps on statusline
  use 'SmiteshP/nvim-gps'

  -- highlight the variable with the same name
  use 'RRethy/vim-illuminate'

  -- rainbow brackets
  use 'p00f/nvim-ts-rainbow'

  -- keymap tips
  use { 'folke/which-key.nvim', config = [[ require 'plugins/which-key' ]] }

  -- indent tips
  use { 'lukas-reineke/indent-blankline.nvim', config = [[ require 'plugins/indent-blankline' ]] }

  -- auto close html tag
  use 'windwp/nvim-ts-autotag'

  use { 'windwp/nvim-autopairs', config = [[ require 'plugins/auto-pairs' ]], after = 'nvim-cmp' }

  -- lsp progress alert
  use { 'j-hui/fidget.nvim', after = 'auto-session', config = [[ require 'plugins/fidget' ]] }

  -- fzf in vim
  -- use { 'junegunn/fzf.vim', requires = { 'junegunn/fzf' } }

  -- auto unhighlight after search
  use { 'romainl/vim-cool', config = [[ vim.g.CoolTotalMatches = 1 ]] }

  -- ai code hint
  use {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ''
    end,
  }

  -- neovim colorizer
  use {
    'norcalli/nvim-colorizer.lua',
    ft = { 'css', 'javascript', 'vim', 'html' },
    config = [[require('colorizer').setup {'css', 'javascript', 'vim', 'html'}]],
  }

  -- highlight matching words
  use { 'andymass/vim-matchup', config = [[ vim.g.loaded_matchit = true ]] }

  -- highlighting unique characters within a line
  -- use("unblevable/quick-scope")

  -- text object edit
  -- use 'mg979/vim-visual-multi'
  use 'tommcdo/vim-exchange'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'wellle/targets.vim'
  use 'junegunn/vim-easy-align'
  use 'AndrewRadev/splitjoin.vim'

  -- search
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    config = [[ require 'plugins/telescope' ]],
  }

  -- file manager
  use { 'kyazdani42/nvim-tree.lua', config = [[ require 'plugins/nvim-tree' ]] }

  -- trouble List
  use { 'folke/trouble.nvim', config = [[ require 'plugins/trouble' ]] }

  -- quick jump in file
  use { 'phaazon/hop.nvim', config = [[ require 'plugins/hop' ]] }

  -- outline
  use 'simrat39/symbols-outline.nvim'

  -- snip run
  use { 'michaelb/sniprun', run = './install.sh', config = [[ require 'plugins/sniprun' ]] }

  -- smart comment
  use { 'numToStr/Comment.nvim', config = [[ require 'plugins/comment' ]] }

  -- Documentation
  -- use {
  --   'danymat/neogen',
  --   requires = 'nvim-treesitter',
  --   config = [[require('config.neogen')]],
  --   keys = { '<localleader>d', '<localleader>df', '<localleader>dc' },
  -- }

  -- external supplement for lsp
  use { 'jose-elias-alvarez/null-ls.nvim', config = [[ require 'plugins/null-ls' ]] }

  -- test helper
  use 'vim-test/vim-test'

  -- analysis of neovim's start-up time
  use { 'dstein64/vim-startuptime', cmd = 'StartupTime' }

  -- async building & commands
  -- use { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }

  -- git
  use {
    {
      'tpope/vim-fugitive',
      cmd = { 'G', 'G!', 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' },
    },
    {
      'lewis6991/gitsigns.nvim',
      config = [[ require 'plugins.gitsigns' ]],
    },
    -- { 'sindrets/diffview.nvim' },
  }

  -- highlights
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'RRethy/nvim-treesitter-textsubjects',
      -- 'RRethy/nvim-treesitter-textsubjects',
    },
    run = ':TSUpdate',
    config = [[ require 'plugins/treesitter' ]],
  }

  -- asyncrun/task,build and test
  use {
    'skywind3000/asynctasks.vim',
    requires = { 'skywind3000/asyncrun.vim' },
    cmd = { 'AsyncTask' },
    config = function()
      vim.g.asyncrun_open = 6
      vim.g.asynctasks_term_pos = 'floaterm'
    end,
  }

  -- parameter hints
  use { 'ray-x/lsp_signature.nvim', config = [[ require 'plugins/lsp_signature' ]] }

  -- nvim-cmp and snip
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'onsails/lspkind-nvim',
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
    },
    config = [[ require 'plugins/lsp-cmp' ]],
  }
  use {
    'L3MON4D3/LuaSnip',
    requires = { 'rafamadriz/friendly-snippets' },
    config = [[ require('luasnip.loaders.from_vscode').load() ]],
  }

  -- lsp
  use { 'neovim/nvim-lspconfig', config = [[ require 'plugins/lsp-config' ]] }
  use {
    'folke/lsp-colors.nvim',
    config = function()
      require('lsp-colors').setup {
        Error = '#db4b4b',
        Warning = '#e0af68',
        Information = '#0db9d7',
        Hint = '#10B981',
      }
    end,
  }
  -- go
  use { 'fatih/vim-go', ft = { 'go' }, after = 'nvim-lspconfig', config = [[ require 'lsp/go' ]] }
  use { 'buoto/gotests-vim', cmd = 'GoTests' }
  -- typescript
  use { 'leafgarland/typescript-vim', ft = { 'typescript', 'typescriptreact' } }
  use {
    'jose-elias-alvarez/nvim-lsp-ts-utils',
    ft = { 'typescript', 'typescriptreact' },
    config = [[ require 'lsp/typescript' ]],
  }

  -- floaterm
  use {
    'voldikss/vim-floaterm',
    setup = function()
      vim.g.floaterm_height = 0.8
      vim.g.floaterm_width = 0.7
    end,
  }

  -- TODO
  -- use 'mhinz/vim-grepper'
  use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
  use {
    'junegunn/fzf',
    run = function()
      vim.fn['fzf#install']()
    end,
  }

  -- search/replace
  -- use 'nvim-pack/nvim-spectre'
end)

Keymap('n', '<leader>ps', ':PackerSync<CR>')
Keymap('n', '<leader>pu', ':PackerUpdate<CR>')
Keymap('n', '<leader>pi', ':PackerInstall<CR>')
Keymap('n', '<leader>pc', ':PackerClean<CR>')
