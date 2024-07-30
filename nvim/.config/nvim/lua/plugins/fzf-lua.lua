return {
  'ibhagwan/fzf-lua',
  enabled = false,
  config = function()
    local fzflua = require('fzf-lua')
    fzflua.setup({
      files = {
        file_icons = 'mini',
      },
    })

    local files_opts = {
      previewer = false,
      cwd_prompt = false,
      prompt = 'Files❯ ',
      winopts = {
        height = 0.5,
        width = 0.5,
      },
    }

    map('n', '<C-p>', function()
      fzflua.files(files_opts)
    end, { desc = '[S]earch [F]iles' })
    map('n', '<C-\\>', fzflua.buffers, { desc = 'Search buffers' })
    map('n', '<Space>/', fzflua.grep_curbuf, { desc = '[/] Fuzzily search in current buffer' })
    map('n', '<Space>sg', fzflua.live_grep_native, { desc = '[S]earch by [G]rep' })
    map('n', '<Space>ss', fzflua.live_grep_resume, { desc = '[S]earch by [G]rep' })
    map('n', '<Space>sh', fzflua.help_tags, { desc = '[S]earch [H]elp' })
    map('n', '<Space>so', fzflua.oldfiles, { desc = '[S]earch [O]ldfiles' })
    map('n', '<Space>sd', fzflua.diagnostics_workspace, { desc = '[S]earch [D]iagnostics' })
    map('n', '<Space>sw', fzflua.grep_cword, { desc = '[S]earch current [W]ord' })
    map('n', '<Space>sc', fzflua.commands, { desc = '[S]earch [C]ommands' })
    map('n', '<Space>sr', fzflua.registers, { desc = '[S]earch [R]egisters' })
  end,
}
