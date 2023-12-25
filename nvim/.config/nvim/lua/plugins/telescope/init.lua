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
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    aerial = {
      -- Display symbols as <root>.<parent>.<symbol>
      show_nesting = {
        ['_'] = false, -- This key will be the default
        json = true, -- You can set the option for specific filetypes
        yaml = true,
      },
    },
  },
})
require('telescope').load_extension('fzf')
require('telescope').load_extension('aerial')

Keymap('n', 'sf', '<Cmd>Telescope find_files<CR>')
Keymap('n', '<Space>fo', '<Cmd>Telescope oldfiles<CR>')
Keymap('n', '<Space>fg', '<Cmd>Telescope live_grep<CR>')
Keymap('n', '<Space>fb', '<Cmd>Telescope buffers<CR>')
Keymap('n', '<Space>fh', '<Cmd>Telescope help_tags<CR>')
Keymap('n', '<Space>fi', '<Cmd>Telescope lsp_implementations<CR>')
Keymap('n', '<Space>fd', '<Cmd>Telescope diagnostics<CR>')
Keymap('n', '<Space>fa', '<Cmd>Telescope aerial<CR>')
Keymap('n', '<Space>fc', '<Cmd>Telescope commands<CR>')
Keymap('n', '<Space>fr', '<Cmd>Telescope registers<CR>')

Keymap('n', '<Space>fn', '<Cmd>lua require("plugins/telescope/finder").fd_in_nvim()<CR>')
Keymap('n', '<Space>fd', '<Cmd>lua require("plugins/telescope/finder").fd_in_dotfiles()<CR>')
Keymap('n', '<Space>fm', '<Cmd>lua require("plugins/telescope/finder").fd()<CR>')

-- lsp
Keymap('n', 'gi', '<Cmd>Telescope lsp_implementations<CR>')
Keymap('n', 'gr', '<Cmd>Telescope lsp_reference<CR>')
