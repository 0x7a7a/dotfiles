return {
  'MeanderingProgrammer/treesitter-modules.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', branch = 'main', lazy = false },
  opts = {
    ensure_installed = {
      'sql',
      'zig',
      'html',
      'xml',
      'css',
      'javascript',
      'typescript',
      'tsx',
      'go',
      'vue',
      'lua',
      'http',
      'json',
      'vimdoc',
      'make',
    },
    ignore_install = {},
    sync_install = false,
    -- automatically install missing parsers when entering buffer
    auto_install = false,
    fold = {
      enable = false,
      disable = false,
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'vue' },
    },
    incremental_selection = {
      enable = true,
      -- set value to `false` to disable individual mapping
      keymaps = {
        init_selection = '<M-o>',
        node_incremental = '<M-o>',
        node_decremental = '<M-i>',
        -- scope_incremental = '<M-o>',
      },
    },
    indent = {
      enable = false,
      disable = false,
    },
  },
}
