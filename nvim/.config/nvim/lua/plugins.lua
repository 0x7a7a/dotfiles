local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Colorscheme
  -- toolkit:
  -- https://github.com/lifepillar/vim-colortemplate
  -- https://github.com/rktjmp/lush.nvim
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('colors.kanagawa')
      vim.cmd([[colorscheme kanagawa]])
    end,
  },
  { 'folke/tokyonight.nvim', lazy = true },
  { 'EdenEast/nightfox.nvim', lazy = true },
  { 'AlexvZyl/nordic.nvim', lazy = true },

  -- Base dependence
  'nvim-lua/plenary.nvim',
  'kyazdani42/nvim-web-devicons',

  -- Smooth scroll
  'psliwka/vim-smoothie',

  -- Close buffer,keep window
  'ojroques/nvim-bufdel',

  -- Auto save session
  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup({
        log_level = 'error',
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      })
    end,
  },

  -- Buffer line
  {
    'akinsho/bufferline.nvim',
    config = function()
      require('plugins.bufferline')
    end,
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('plugins.lualine')
    end,
  },
  -- Show code context on statusline
  'SmiteshP/nvim-navic',

  -- Highlight the variable with the same name
  'RRethy/vim-illuminate',

  -- Rainbow brackets
  'hiphish/rainbow-delimiters.nvim',

  -- Keymap tips
  {
    'folke/which-key.nvim',
    config = function()
      require('plugins.which-key')
    end,
  },

  -- Indent tips
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugins.indent-blankline')
    end,
    enabled = false,
  },

  -- Auto close html tag
  'windwp/nvim-ts-autotag',

  {
    'windwp/nvim-autopairs',
    config = function()
      require('plugins.auto-pairs')
    end,
  },

  -- Lsp progress alert
  {
    'j-hui/fidget.nvim',
    dependencies = 'auto-session',
    config = function()
      require('plugins.fidget')
    end,
  },

  -- Fzf in vim
  --  { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' } },

  -- Auto unhighlight after search
  {
    'romainl/vim-cool',
    config = function()
      vim.g.CoolTotalMatches = 1
    end,
  },

  -- Ai code hint
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    enabled = false,
    config = function()
      require('copilot').setup({})
    end,
  },

  -- Neovim colorizer
  {
    'norcalli/nvim-colorizer.lua',
    ft = { 'css', 'javascript', 'vim', 'html' },
    config = function()
      require('colorizer').setup({ 'css', 'javascript', 'vim', 'html' })
    end,
  },

  -- Highlight matching words
  'andymass/vim-matchup',

  -- Highlighting unique characters within a line
  -- ("unblevable/quick-scope")

  -- Text object edit
  'tpope/vim-repeat',
  'wellle/targets.vim',
  'junegunn/vim-easy-align',
  'AndrewRadev/splitjoin.vim',
  --  'tommcdo/vim-exchange',
  --  'mg979/vim-visual-multi',
  --  'terryma/vim-expand-region',
  -- 'tpope/vim-surround',
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({})
    end,
  },

  -- Search
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      require('plugins.telescope')
    end,
  },

  -- File manager
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('plugins.nvim-tree')
    end,
  },

  -- Trouble List
  {
    'folke/trouble.nvim',
    config = function()
      require('plugins.trouble')
    end,
  },

  -- Quick jump in file
  {
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat' },
    config = function()
      require('plugins.leap')
    end,
  },
  'ThePrimeagen/harpoon',

  -- Outline
  --  'preservim/tagbar',

  -- Smart comment
  {
    'numToStr/Comment.nvim',
    config = function()
      require('plugins.comment')
    end,
  },

  -- Documentation
  --  {
  --   'danymat/neogen',
  --   dependencies = 'nvim-treesitter',
  --   config = [[require('config.neogen')]],
  -- },

  -- External supplement for lsp
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('plugins.null-ls')
    end,
  },

  -- Test helper
  'vim-test/vim-test',

  -- Analysis of neovim's start-up time
  { 'dstein64/vim-startuptime', cmd = 'StartupTime' },

  -- Async building & commands
  --  { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } },

  -- Git
  {
    'tpope/vim-fugitive',
    -- cmd = { 'G', 'G!', 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' },
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugins.gitsigns')
    end,
  },
  -- { 'sindrets/diffview.nvim' },

  -- Highlights
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
    },
    build = ':TSUpdate',
    config = function()
      require('plugins.treesitter')
    end,
  },

  -- Asyncrun/task,build and test
  {
    'skywind3000/asynctasks.vim',
    dependencies = { 'skywind3000/asyncrun.vim' },
    config = function()
      vim.g.asyncrun_open = 6
      vim.g.asynctasks_term_pos = 'floaterm'
    end,
  },

  -- Parameter hints
  {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('plugins.lsp_signature')
    end,
  },

  -- Completion and snip
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'onsails/lspkind-nvim',
      { 'hrsh7th/cmp-buffer', dependencies = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', dependencies = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline', dependencies = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', dependencies = 'nvim-cmp' },
    },
    config = function()
      require('plugins.lsp-cmp')
    end,
  },
  {
    'L3MON4D3/LuaSnip',
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },

  -- Lsp
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate', -- :MasonUpdate updates registry contents
    config = function()
      require('mason').setup()
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.lsp-config')
    end,
  },
  -- go
  {
    'ray-x/go.nvim',
    dependencies = { 'ray-x/guihua.lua', 'nvim-lspconfig' },
    config = function()
      require('lsp.go')
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
  },
  -- typescript
  { 'leafgarland/typescript-vim', ft = { 'typescript', 'typescriptreact' } },
  -- rust
  {
    'rust-lang/rust.vim',
    ft = { 'rust' },
    dependencies = 'nvim-lspconfig',
    config = function()
      require('lsp.rust')
    end,
  },

  -- Floaterm
  {
    'voldikss/vim-floaterm',
    config = function()
      vim.g.floaterm_height = 0.8
      vim.g.floaterm_width = 0.7
    end,
    cmd = { 'FloatermNew', 'FloatermToggle' },
  },

  -- Make quickfix better
  --  { 'mhinz/vim-grepper', cmd = 'Grepper' },
  --  { 'kevinhwang91/nvim-bqf', ft = 'qf' },
  --  {
  --   'junegunn/fzf',
  --   build = function()
  --     vim.fn['fzf#install']()
  --   end,
  -- },

  -- Search/replace
  --  'nvim-pack/nvim-spectre',

  -- Escape Mapping
  {
    'max397574/better-escape.nvim',
    config = function()
      require('plugins.better_escape')
    end,
  },

  -- Undo tree
  'mbbill/undotree',

  -- tmux
  'christoomey/vim-tmux-navigator',

  -- fold
  -- kevinhwang91/nvim-ufo
}, {
  checker = { enabled = true },
})

Keymap('n', '<leader>ps', '<cmd>Lazy sync<CR>')
Keymap('n', '<leader>pu', '<cmd>Lazy update<CR>')
Keymap('n', '<leader>pi', '<cmd>Lazy install<CR>')
Keymap('n', '<leader>pc', '<cmd>Lazy clean<CR>')
