return {
  'nvim-telescope/telescope.nvim',
  -- Lazy loading affects mappings in lsp-config
  -- event = 'VeryLazy',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-live-grep-args.nvim', version = '^1.0.0' },
  },
  config = function()
    local actions = require('telescope.actions')
    local previewers = require('telescope.previewers')
    local lga_actions = require('telescope-live-grep-args.actions')

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
            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
          },
          n = {
            ['<C-d>'] = actions.results_scrolling_down,
            ['<C-u>'] = actions.results_scrolling_up,
            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
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
          '.idea',
          '^.git',
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
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = { -- extend mappings
            i = {
              ['<C-k>'] = lga_actions.quote_prompt(),
              ['<C-g>'] = lga_actions.quote_prompt({ postfix = ' --iglob ' }),
              ['<C-t>'] = lga_actions.quote_prompt({ postfix = ' -t' }),
            },
          },
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
    require('telescope').load_extension('live_grep_args')

    Keymap(
      'n',
      '<Space>/',
      '<cmd>Telescope current_buffer_fuzzy_find<cr>',
      { desc = '[/] Fuzzily search in current buffer' }
    )
    Keymap('n', '<C-p>', '<cmd>Telescope find_files<cr>', { desc = '[S]earch [F]iles' })
    Keymap('n', '<Space><Space>', '<cmd>Telescope buffers<cr>', { desc = 'Search Buffers' })
    Keymap('n', '<Space>?', '<cmd>Telescope oldfiles<cr>', { desc = '[?] Find recently opened files' })
    Keymap(
      'n',
      '<Space>sg',
      '<cmd>lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>',
      { desc = '[S]earch by [G]rep' }
    )
    Keymap('n', '<Space>sa', '<cmd>Telescope aerial<cr>', { desc = '[S]earch [U]ndo' })
    Keymap('n', '<Space>st', '<cmd>Telescope git_files<cr>', { desc = '[S]earch by [G]it files' })
    Keymap('n', '<Space>sh', '<cmd>Telescope help_tags<cr>', { desc = '[S]earch [H]elp' })
    Keymap('n', '<Space>sd', '<cmd>Telescope diagnostics<cr>', { desc = '[S]earch [D]iagnostics' })
    Keymap('n', '<Space>sD', function()
      require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config'), fllow = true })
    end, { desc = '[S]earch [D]otfiles' })
    Keymap('n', '<Space>sw', '<cmd>Telescope grep_string<cr>', { desc = '[S]earch current [W]ord' })
    Keymap('n', '<Space>sc', '<cmd>Telescope commands<cr>', { desc = '[S]earch [C]ommands' })
    Keymap('n', '<Space>sr', '<cmd>Telescope registers<cr>', { desc = '[S]earch [R]egisters' })
  end,
}
