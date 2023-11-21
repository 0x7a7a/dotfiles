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
  -- https://github.com/uga-rosa/ccc.nvim
  {
    'rebelot/kanagawa.nvim',
    config = function()
      require('colors.kanagawa')
      -- vim.cmd([[colorscheme kanagawa]])
    end,
  },
  { 'folke/tokyonight.nvim' },
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('colors.nightfox')
      vim.cmd([[colorscheme nordfox]])
    end,
  },
  {
    'AlexvZyl/nordic.nvim',
    config = function()
      require('colors.nordic')
    end,
  },
  { 'nyoom-engineering/oxocarbon.nvim' },
  {
    'ellisonleao/gruvbox.nvim',
    config = function()
      require('colors.gruvbox')
    end,
  },
  'kyazdani42/nvim-web-devicons',

  -- Base dependence
  'nvim-lua/plenary.nvim',

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
  -- 'SmiteshP/nvim-navic' -- now use aerial's built-in replacement

  -- Highlight the variable with the same name
  'RRethy/vim-illuminate',

  -- Rainbow brackets
  'hiphish/rainbow-delimiters.nvim',

  -- Keymap tips
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
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

  {
    'windwp/nvim-autopairs',
    config = function()
      require('plugins.auto-pairs')
    end,
  },

  -- Lsp progress alert
  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
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

  -- Extends vim's % key
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
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup()
    end,
  },

  -- Search
  -- { 'ibhagwan/fzf-lua' },
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
    keys = {
      { '<Space>e', '<CMD>NvimTreeFindFileToggle<CR>', desc = 'NeoTree' },
    },
    config = function()
      require('plugins.nvim-tree')
    end,
  },
  {
    'stevearc/oil.nvim',
    event = 'VeryLazy',
    config = function()
      require('plugins.oil')
    end,
  },

  -- Trouble List
  {
    'folke/trouble.nvim',
    keys = {
      { 'gt', '<CMD>TroubleToggle document_diagnostics<CR>', desc = 'Open  file trouble menu' },
      { 'gT', '<CMD>TroubleToggle workspace_diagnostics<CR>', desc = 'Open workspace trouble menu' },
    },
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
  {
    'stevearc/aerial.nvim',
    keys = {
      { '<Space>a', '<CMD>AerialToggle!<CR>', desc = 'Toggle Aerial' },
    },
    config = function()
      require('plugins.aerial')
    end,
  },

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
    'nvimtools/none-ls.nvim',
    config = function()
      require('plugins.null-ls')
    end,
  },
  -- { 'mfussenegger/nvim-lint' },
  -- { 'stevearc/conform.nvim' },
  -- { 'nvimdev/guard.nvim' },

  -- Analysis of neovim's start-up time
  { 'dstein64/vim-startuptime', cmd = 'StartupTime' },

  -- Async building & commands
  { 'tpope/vim-dispatch', event = 'VeryLazy' },

  -- Git
  {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugins.gitsigns')
    end,
  },
  { 'sindrets/diffview.nvim', cmd = { 'DiffviewOpen' } },

  -- Highlights and txt select
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
      'windwp/nvim-ts-autotag',
    },
    build = ':TSUpdate',
    config = function()
      require('plugins.treesitter')
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
      require('luasnip.loaders.from_snipmate').lazy_load({ paths = './lua/snippets/snipmate' })
      require('luasnip.loaders.from_lua').lazy_load({ paths = './lua/snippets/luasnip' })
    end,
  },

  -- Lsp
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    build = ':MasonUpdate', -- :MasonUpdate updates registry contents
    config = function()
      require('mason').setup()
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.lsp-config')
      require('lsp')
    end,
  },
  -- go
  -- {
  --   'crispgm/nvim-go',
  --   ft = { 'go', 'gomod' },
  -- },
  {
    'olexsmir/gopher.nvim',
    ft = { 'go', 'gomod' },
  },
  -- typescript
  { 'leafgarland/typescript-vim', ft = { 'typescript', 'typescriptreact' } },
  -- rust
  {
    'rust-lang/rust.vim',
    ft = { 'rust' },
  },

  -- Definition Preview
  {
    'rmagatti/goto-preview',
    keys = {
      { 'gpd', "<CMD>lua require('goto-preview').goto_preview_definition()<CR>", desc = 'goto_preview_definition' },
      {
        'gpt',
        "<CMD>lua require('goto-preview').goto_preview_type_definition()<CR>",
        desc = 'goto_preview_type_definition',
      },
      {
        'gpi',
        "<CMD>lua require('goto-preview').goto_preview_implementation()<CR>",
        desc = 'goto_preview_implementation',
      },
      { 'gP', "<CMD>lua require('goto-preview').close_all_win()<CR>", desc = 'close_all_win' },
      { 'gpr', "<CMD>lua require('goto-preview').goto_preview_references()<CR>", desc = 'goto_preview_references' },
    },
    config = function()
      require('plugins.preview')
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
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },

  -- Search/replace
  {
    'nvim-pack/nvim-spectre',
    keys = {
      { '<leader>S', '<CMD>lua require("spectre").toggle()<CR>', desc = 'Toggle Spectre' },
    },
  },

  -- Escape Mapping
  {
    'max397574/better-escape.nvim',
    config = function()
      require('plugins.better_escape')
    end,
  },

  -- Undo tree
  { 'mbbill/undotree', keys = { { '<Space>u', '<CMD>UndotreeToggle<CR>', desc = 'UndoTree' } } },

  -- tmux
  'christoomey/vim-tmux-navigator',

  -- fold
  -- { 'kevinhwang91/nvim-ufo' },

  -- plugin dev plugin
  { 'folke/neodev.nvim', ft = { 'lua' } },
}, {
  checker = { enabled = true },
})

Keymap('n', '<leader>ps', '<CMD>Lazy sync<CR>')
Keymap('n', '<leader>pu', '<CMD>Lazy update<CR>')
Keymap('n', '<leader>pi', '<CMD>Lazy install<CR>')
Keymap('n', '<leader>pc', '<CMD>Lazy clean<CR>')
