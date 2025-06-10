return {
  'lewis6991/gitsigns.nvim',
  opts = {
    on_attach = function(_bufnr)
      local gs = package.loaded.gitsigns

      local function next_hunk()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return '<Ignore>'
      end

      local function prev_hunk()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return '<Ignore>'
      end

      vim.keymap.set('n', ']c', next_hunk, { expr = true, desc = 'Next git hunk' })
      vim.keymap.set('n', '[c', prev_hunk, { expr = true, desc = 'Prev git hunk' })
    end,

    current_line_blame = true,
  },
}
