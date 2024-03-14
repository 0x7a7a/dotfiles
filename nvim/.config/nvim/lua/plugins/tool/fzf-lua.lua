return {
  'ibhagwan/fzf-lua',
  event = 'VeryLazy',
  enabled = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- stylua: ignore
  config = function()
    require('fzf-lua').setup()

    Keymap('n', 'sf', '<cmd>lua require("fzf-lua").files({cwd_prompt = false,prompt = "Files❯ ",winopts = { height=0.5, width=0.4 },previewer=false })<cr>', { desc = '[S]earch [F]iles' })
    Keymap('n', '<leader><Space>', '<cmd>lua require("fzf-lua").buffers()<cr>', { desc = 'Search buffers' })
    Keymap('n', '<Space>/', '<cmd>lua require("fzf-lua").grep_curbuf()<cr>', { desc = '[/] Fuzzily search in current buffer' })
    Keymap('n', '<Space>sg', '<cmd>lua require("fzf-lua").live_grep_native()<cr>', { desc = '[S]earch by [G]rep' })
    Keymap('n', '<Space>ss', '<cmd>lua require("fzf-lua").live_grep_resume()<cr>', { desc = '[S]earch by [G]rep' })
    Keymap('n', '<Space>sG', '<cmd>lua require("fzf-lua").git_files()<cr>', { desc = '[S]earch by [G]it files' })
    Keymap('n', '<Space>sh', '<cmd>lua require("fzf-lua").help_tags()<cr>', { desc = '[S]earch [H]elp' })
    Keymap('n', '<Space>so', '<cmd>lua require("fzf-lua").oldfiles()<cr>', { desc = '[S]earch [O]ldfiles' })
    Keymap('n', '<Space>sd', '<cmd>lua require("fzf-lua").diagnostics_workspace()<cr>', { desc = '[S]earch [D]iagnostics' })
    Keymap('n', '<Space>sw', '<cmd>lua require("fzf-lua").grep_cword()<cr>', { desc = '[S]earch current [W]ord' })
    Keymap('n', '<Space>sc', '<cmd>lua require("fzf-lua").commands()<cr>', { desc = '[S]earch [C]ommands' })
    Keymap('n', '<Space>sr', '<cmd>lua require("fzf-lua").registers()<cr>', { desc = '[S]earch [R]egisters' })
  end,
}
