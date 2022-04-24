vim.api.nvim_command('set foldmethod=expr')
vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'html', 'css', 'javascript', 'typescript', 'tsx', 'go', 'vue' },
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
  textsubjects = {
    enable = true,
    prev_selection = ';', -- (Optional) keymap to select the previous selection
    keymaps = {
      ['.'] = 'textsubjects-smart',
      -- [";"] = "textsubjects-container-outer",
      -- ["i;"] = "textsubjects-container-inner",
    },
  },
})
