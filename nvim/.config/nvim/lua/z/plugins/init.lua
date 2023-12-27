-- Base dependence
return {
  'nvim-lua/plenary.nvim',

  -- Smooth scroll
  'psliwka/vim-smoothie',

  -- Highlight the variable with the same name
  'RRethy/vim-illuminate',

  'andymass/vim-matchup',

  -- Rainbow brackets
  'hiphish/rainbow-delimiters.nvim',

  -- Close buffer,keep window
  'ojroques/nvim-bufdel',

  -- Colorscheme
  -- toolkit:
  -- https://github.com/lifepillar/vim-colortemplate
  -- https://github.com/rktjmp/lush.nvim
  -- https://github.com/uga-rosa/ccc.nvim
  'kyazdani42/nvim-web-devicons',

  -- Text object edit
  'tpope/vim-repeat',
  'wellle/targets.vim',
  'junegunn/vim-easy-align',
  'AndrewRadev/splitjoin.vim',
  --  'tommcdo/vim-exchange',
  --  'mg979/vim-visual-multi',
  --  'terryma/vim-expand-region',

  'ThePrimeagen/harpoon',

  -- Analysis of neovim's start-up time
  { 'dstein64/vim-startuptime', cmd = 'StartupTime' },

  -- Async building & commands
  { 'tpope/vim-dispatch', event = 'VeryLazy' },

  --Git
  {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
  },

  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen' },
  },

  -- go
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

  -- Make quickfix better
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },

  -- Search/replace
  {
    'nvim-pack/nvim-spectre',
    keys = {
      { '<leader>S', '<Cmd>lua require("spectre").toggle()<CR>', desc = 'Toggle Spectre' },
    },
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

  -- Undo tree
  { 'mbbill/undotree', keys = { { '<Space>u', '<Cmd>UndotreeToggle<CR>', desc = 'UndoTree' } } },

  -- tmux
  'christoomey/vim-tmux-navigator',

  -- fold
  -- { 'kevinhwang91/nvim-ufo' },
}
