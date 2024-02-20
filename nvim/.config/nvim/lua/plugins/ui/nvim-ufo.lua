return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  enabled = false,
  config = function()
    Keymap('n', 'zR', require('ufo').openAllFolds, { desc = 'open all folds' })
    Keymap('n', 'zM', require('ufo').closeAllFolds, { desc = 'close all folds' })
    Keymap('n', 'zr', require('ufo').openFoldsExceptKinds, { desc = 'open folds except kinds' })
    Keymap('n', 'zm', require('ufo').closeFoldsWith, { desc = 'close folds with' })
    Keymap('n', 'zk', function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = 'peek fold' })

    require('ufo').setup({
      provider_selector = function()
        return { 'lsp', 'indent' }
      end,
    })
  end,
}
