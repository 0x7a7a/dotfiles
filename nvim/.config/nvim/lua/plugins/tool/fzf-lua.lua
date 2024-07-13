return {
  'ibhagwan/fzf-lua',
  -- enabled = false,
  -- dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local fzflua = require('fzf-lua')
    fzflua.setup()

    local files_opts = {
      previewer = false,
      cwd_prompt = false,
      prompt = 'Files❯ ',
      winopts = {
        height = 0.5,
        width = 0.5,
      },
    }

    Keymap('n', '<C-p>', function()
      fzflua.files(files_opts)
    end, { desc = '[S]earch [F]iles' })
    Keymap('n', '<C-\\>', fzflua.buffers, { desc = 'Search buffers' })
    Keymap('n', '<Space>/', fzflua.grep_curbuf, { desc = '[/] Fuzzily search in current buffer' })
    Keymap('n', '<Space>sg', fzflua.live_grep_native, { desc = '[S]earch by [G]rep' })
    Keymap('n', '<Space>ss', fzflua.live_grep_resume, { desc = '[S]earch by [G]rep' })
    Keymap('n', '<Space>sh', fzflua.help_tags, { desc = '[S]earch [H]elp' })
    Keymap('n', '<Space>so', fzflua.oldfiles, { desc = '[S]earch [O]ldfiles' })
    Keymap('n', '<Space>sd', fzflua.diagnostics_workspace, { desc = '[S]earch [D]iagnostics' })
    Keymap('n', '<Space>sw', fzflua.grep_cword, { desc = '[S]earch current [W]ord' })
    Keymap('n', '<Space>sc', fzflua.commands, { desc = '[S]earch [C]ommands' })
    Keymap('n', '<Space>sr', fzflua.registers, { desc = '[S]earch [R]egisters' })
  end,
}
