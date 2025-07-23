return {
  'ibhagwan/fzf-lua',
  config = function()
    local fzflua = require('fzf-lua')

    local winopts = {
      previewer = false,
      cwd_prompt = false,
      winopts = {
        height = 0.5,
        width = 0.5,
      },
    }

    fzflua.setup({
      'hide',
      'default-prompt',
      files = winopts,
      buffers = winopts,

      fzf_colors = true,
    })

    -- stylua: ignore start
    vim.keymap.set('i', '<C-x><C-f>', fzflua.complete_path , { desc = 'Fuzzy complete path' })
    vim.keymap.set('n', '<C-p>', fzflua.files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<C-\\>', fzflua.buffers, { desc = 'Search buffers' })
    vim.keymap.set('n', '<C-g>', fzflua.live_grep, { desc = '[S]earch by grep native' })
    vim.keymap.set('n', '<C-\'>', fzflua.resume, { desc = '[S]earch re[S]ume' })

    vim.keymap.set('n', '<Space>sg', fzflua.global, { desc = '[S]earch [G]lobal' })
    vim.keymap.set('n', '<Space>sc', fzflua.grep_curbuf, { desc = '[/] Fuzzily search in current buffer' })
    vim.keymap.set('n', '<Space>sa', fzflua.lsp_document_symbols, { desc = 'Search document symbols' })
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
    -- stylua: ignore end
  end,
}
