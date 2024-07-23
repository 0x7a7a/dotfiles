return {
  'nvim-treesitter/nvim-treesitter',
  event = 'BufEnter',
  build = ':TSUpdate',
  init = function()
    vim.api.nvim_command('set foldmethod=expr')
    vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
  end,
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'html',
        'xml',
        'css',
        'graphql',
        'javascript',
        'typescript',
        'tsx',
        'go',
        'vue',
        'svelte',
        'lua',
        'http',
        'json',
        'rust',
        'vimdoc',
      },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = true,
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = false,
      -- List of parsers to ignore installing (for "all")
      ignore_install = {},

      highlight = {
        enable = true,
        disable = function(_, buf)
          local max_filesize = 1024 * 1024 -- 1MB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
      --
      --Incremental selection based on the named nodes from the grammar.
      incremental_selection = {
        enable = false,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = '<C-s>',
          node_decremental = false,
        },
      },
      indent = {
        enable = false,
      },
    })
  end,
}
