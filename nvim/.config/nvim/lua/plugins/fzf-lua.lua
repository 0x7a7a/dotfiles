return {
  'ibhagwan/fzf-lua',
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
    vim.keymap.set('n', '<Space>sc', fzflua.grep_curbuf, { desc = '[/] Fuzzily search in current buffer' })
    vim.keymap.set('n', '<Space>sa', fzflua.lsp_document_symbols, { desc = 'Search document symbols' })
    vim.keymap.set('n', '<Space>sg', fzflua.live_grep_native, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<Space>ss', fzflua.live_grep_resume, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<Space>sh', fzflua.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<Space>so', fzflua.oldfiles, { desc = '[S]earch [O]ldfiles' })
    vim.keymap.set('n', '<Space>sd', fzflua.diagnostics_workspace, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<Space>sw', fzflua.grep_cword, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<Space>sC', fzflua.commands, { desc = '[S]earch [C]ommands' })
    vim.keymap.set('n', '<Space>sr', fzflua.registers, { desc = '[S]earch [R]egisters' })
    vim.keymap.set('n', '<Space>sk', fzflua.keymaps, { desc = '[S]earch [K]eymaps' })

    vim.keymap.set('n', 'gd', fzflua.lsp_definitions, { desc = '[G]oto [D]efinition' })
    vim.keymap.set('n', 'gD', fzflua.lsp_declarations, { desc = '[G]oto type [D]eclaration' })
    vim.keymap.set('n', 'gri', fzflua.lsp_implementations, { desc = '[G]oto [I]mplementation' })
    vim.keymap.set('n', 'gs', fzflua.lsp_document_symbols, { desc = '[G]oto Document [S]ymbols' })
    vim.keymap.set('n', 'grr', fzflua.lsp_references, { desc = '[G]oto [R]eferences' })
  end,
}
