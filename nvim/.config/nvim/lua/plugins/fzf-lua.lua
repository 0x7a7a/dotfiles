return {
  'ibhagwan/fzf-lua',
  enabled = true,
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

    vim.keymap.set('n', '<C-p>', function()
      fzflua.files(files_opts)
    end, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<C-\\>', fzflua.buffers, { desc = 'Search buffers' })
    vim.keymap.set('n', '<Space>/', fzflua.grep_curbuf, { desc = '[/] Fuzzily search in current buffer' })
    vim.keymap.set('n', '<Space>sa', fzflua.lsp_document_symbols, { desc = 'Search document symbols' })
    vim.keymap.set('n', '<Space>sg', fzflua.live_grep_native, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<Space>ss', fzflua.live_grep_resume, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<Space>sh', fzflua.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<Space>so', fzflua.oldfiles, { desc = '[S]earch [O]ldfiles' })
    vim.keymap.set('n', '<Space>sd', fzflua.diagnostics_workspace, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<Space>sw', fzflua.grep_cword, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<Space>sc', fzflua.commands, { desc = '[S]earch [C]ommands' })
    vim.keymap.set('n', '<Space>sr', fzflua.registers, { desc = '[S]earch [R]egisters' })
  end,
}
