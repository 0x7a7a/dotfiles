return {
  'chrisgrieser/nvim-origami',
  event = 'VeryLazy',
  opts = {
    useLspFoldsWithTreesitterFallback = {
      enabled = true,
      foldmethodIfNeitherIsAvailable = 'indent', ---@type string|fun(bufnr: number): string
    },
    pauseFoldsOnSearch = true,
    foldtext = {
      enabled = true,
      padding = 3,
      lineCount = {
        template = '%d lines', -- `%d` is replaced with the number of folded lines
        hlgroup = 'Comment',
      },
      diagnosticsCount = true, -- uses hlgroups and icons from `vim.diagnostic.config().signs`
      gitsignsCount = true, -- requires `gitsigns.nvim`
      disableOnFt = { 'snacks_picker_input' }, ---@type string[]
    },
    autoFold = {
      enabled = true,
      kinds = { 'comment', 'imports' }, ---@type lsp.FoldingRangeKind[]
    },
    foldKeymaps = {
      setup = true, -- modifies `h`, `l`, `^`, and `$`
      closeOnlyOnFirstColumn = false, -- `h` and `^` only close in the 1st column
      scrollLeftOnCaret = false, -- `^` should scroll left (basically mapped to `0^`)
    },
  },
  init = function()
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
  end,
}
