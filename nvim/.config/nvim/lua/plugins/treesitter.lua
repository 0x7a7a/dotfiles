vim.api.nvim_command 'set foldmethod=expr'
vim.api.nvim_command 'set foldexpr=nvim_treesitter#foldexpr()'
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'html', 'css', 'javascript', 'typescript', 'tsx', 'go', 'vue', 'lua', 'vim', 'json', 'rust' },
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    context_commentstring = {
      enable = true,
      config = {
        javascript = {
          __default = '// %s',
          jsx_element = '{/* %s */}',
          jsx_fragment = '{/* %s */}',
          jsx_attribute = '// %s',
          comment = '// %s',
        },
      },
    },
  },
  refactor = {
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  },
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    -- [options]
  },
  autotag = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
  },
}
