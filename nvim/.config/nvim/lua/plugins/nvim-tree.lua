local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')
  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.del('n', 's', { buffer = bufnr })
end

require('nvim-tree').setup({
  on_attach = my_on_attach,
  view = {
    preserve_window_proportions = true,
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = 'editor',
        border = 'rounded',
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
  },
  trash = {
    cmd = 'trash',
    require_confirm = true,
  },
})
