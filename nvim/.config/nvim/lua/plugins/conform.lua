return {
  'stevearc/conform.nvim',
  config = function()
    local conform = require('conform')
    conform.setup({
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'goimports', 'goimports_reviser', 'gofumpt' },
        javascript = { { 'prettierd', 'prettier' } },
        svelte = { { 'prettierd', 'prettier' } },
      },
      format_on_save = {
        -- I recommend these options. See :help conform.format for details.
        lsp_fallback = true,
        timeout_ms = 500,
      },
    })

    local function stylua_config()
      return vim.fn.expand('~/.config/nvim/stylua.toml')
    end

    conform.formatters.stylua = {
      prepend_args = { '--config-path', stylua_config() },
    }
  end,
}
