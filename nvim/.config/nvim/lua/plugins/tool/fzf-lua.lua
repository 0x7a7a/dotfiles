return {
  'ibhagwan/fzf-lua',
  enabled = false,
  events = 'VeryLazy',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- calling `setup` is optional for customization
    require('fzf-lua').setup()

    Keymap(
      'n',
      '<leader>/',
      '<cmd>lua require("fzf-lua").grep_curbuf()<cr>',
      { desc = '[/] Fuzzily search in current buffer' }
    )
    Keymap(
      'n',
      'sf',
      '<cmd>lua require("fzf-lua").files({cwd_prompt = false,prompt = "Files❯ " })<cr>',
      { desc = '[S]earch [F]iles' }
    )
    Keymap('n', '<leader>sg', '<cmd>lua require("fzf-lua").live_grep_native()<cr>', { desc = '[S]earch by [G]rep' })
    Keymap('n', '<leader>ss', '<cmd>lua require("fzf-lua").live_grep_resume()<cr>', { desc = '[S]earch by [G]rep' })
    Keymap('n', '<leader>sG', '<cmd>lua require("fzf-lua").git_files()<cr>', { desc = '[S]earch by [G]it files' })
    Keymap('n', '<leader>sh', '<cmd>lua require("fzf-lua").help_tags()<cr>', { desc = '[S]earch [H]elp' })
    Keymap('n', '<leader>so', '<cmd>lua require("fzf-lua").oldfiles()<cr>', { desc = '[S]earch [O]ldfiles' })
    Keymap(
      'n',
      '<leader>sd',
      '<cmd>lua require("fzf-lua").diagnostics_workspace()<cr>',
      { desc = '[S]earch [D]iagnostics' }
    )
    Keymap('n', '<leader>sw', '<cmd>lua require("fzf-lua").grep_cword()<cr>', { desc = '[S]earch current [W]ord' })
    Keymap('n', '<leader>sc', '<cmd>lua require("fzf-lua").commands()<cr>', { desc = '[S]earch [C]ommands' })
    Keymap('n', '<leader>sr', '<cmd>lua require("fzf-lua").registers()<cr>', { desc = '[S]earch [R]egisters' })
  end,
}
