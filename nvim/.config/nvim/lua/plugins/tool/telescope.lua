return {
  'nvim-telescope/telescope.nvim',
  enabled = false,
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
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
        -- https://github.com/nvim-telescope/telescope.nvim/issues/522
        -- It is first recommended to install rg to increase the filtering speed
        -- rg only ignores files in the .gitignore of remote repositories(not completely right)
        -- local project If you need to ignore some large file directories, such as node_modules, you can add a.ignore file to make rg effective
        file_ignore_patterns = {
          'node_modules',
          'vendor',
          'dist',
          '.git',
          '.idea',
          '.DS_Store',
          'Session.vim',
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

    Keymap('n', '<leader>?', '<cmd>Telescope oldfiles<cr>', { desc = '[?] Find recently opened files' })
    Keymap(
      'n',
      '<leader>/',
      '<cmd>Telescope current_buffer_fuzzy_find<cr>',
      { desc = '[/] Fuzzily search in current buffer' }
    )
    Keymap('n', 'sf', '<cmd>Telescope find_files<cr>', { desc = '[S]earch [F]iles' })
    Keymap('n', '<leader>sg', '<cmd>Telescope live_grep<cr>', { desc = '[S]earch by [G]rep' })
    Keymap('n', '<leader>sG', '<cmd>Telescope git_files<cr>', { desc = '[S]earch by [G]it files' })
    Keymap('n', '<leader>sh', '<cmd>Telescope help_tags<cr>', { desc = '[S]earch [H]elp' })
    Keymap('n', '<leader>sd', '<cmd>Telescope diagnostics<cr>', { desc = '[S]earch [D]iagnostics' })
    Keymap('n', '<leader>sw', '<cmd>Telescope grep_string<cr>', { desc = '[S]earch current [W]ord' })
    Keymap('n', '<leader>sc', '<cmd>Telescope commands<cr>', { desc = '[S]earch [C]ommands' })
    Keymap('n', '<leader>sr', '<cmd>Telescope registers<cr>', { desc = '[S]earch [R]egisters' })
  end,
}