local actions = require('telescope.actions')
local previewers = require('telescope.previewers')

-- Preview only small files
local previewer_maker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then
      return
    end
    if stat.size > 500000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

require('telescope').setup({
  defaults = {

    buffer_previewer_maker = previewer_maker,

    mappings = {
      i = {
        ['<esc>'] = actions.close,

        ['<C-k>'] = actions.cycle_history_next,
        ['<C-j>'] = actions.cycle_history_prev,
        ['<C-d>'] = actions.results_scrolling_down,
        ['<C-u>'] = actions.results_scrolling_up,
      },
      n = {
        ['<C-d>'] = actions.results_scrolling_down,
        ['<C-u>'] = actions.results_scrolling_up,
      },
    },
    file_ignore_patterns = {
      'node_modules',
      'vendor',
      'dist',
      '/.git',
      '.idea',
      '.DS_Store',
    },
    -- preview = false,
    layout_strategy = 'horizontal',
  },
  pickers = {
    find_files = {
      hidden = true,
      theme = 'dropdown',
      previewer = false,
      follow = true,
    },
    oldfiles = {
      hidden = true,
      theme = 'dropdown',
      previewer = false,
    },
    live_grep = {
      follow = true,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = 'smart_case',       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    aerial = {
      -- Display symbols as <root>.<parent>.<symbol>
      show_nesting = {
        ['_'] = false, -- This key will be the default
        json = true,   -- You can set the option for specific filetypes
        yaml = true,
      },
    },
  },
})
require('telescope').load_extension('fzf')
require('telescope').load_extension('aerial')

Keymap('n', '<leader><space>', '<cmd>Telescope find_files<cr>')
Keymap('n', '<leader>?', function()
  require('telescope.builtin').buffers({ sort_lastused = true })
end)
Keymap('n', '<leader>sg', '<cmd>Telescope live_grep<cr>')
Keymap('n', '<leader>sb', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
Keymap('n', '<leader>sh', '<cmd>Telescope help_tags<cr>')
Keymap('n', '<leader>sd', '<cmd>Telescope diagnostics<cr>')
Keymap('n', '<leader>sa', '<cmd>Telescope aerial<cr>')
Keymap('n', '<leader>sc', '<cmd>Telescope commands<cr>')
Keymap('n', '<leader>sr', '<cmd>Telescope registers<cr>')

Keymap('n', '<leader>sN', '<cmd>lua require("plugins/telescope/finder").fd_in_nvim()<cr>')
Keymap('n', '<leader>sD', '<cmd>lua require("plugins/telescope/finder").fd_in_dotfiles()<cr>')
-- Keymap('n', '<leader>sm', '<cmd>lua require("plugins/telescope/finder").fd()<cr>')
