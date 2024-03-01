return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',
  config = function()
    local conform = require('conform')
    local utils = require('utils')

    conform.setup({
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'goimports', 'goimports-reviser', 'gofumpt' },
        javascript = { 'prettierd' },
        json = { 'prettierd' },
        svelte = { 'prettierd' },
      },
      format_on_save = {
        -- I recommend these options. See :help conform.format for details.
        lsp_fallback = true,
        timeout_ms = 500,
      },
    })

    local function stylua_config()
      local conf_file = '/stylua.toml'

      if not utils.root_has_file('stylua.toml') then
        return vim.fn.stdpath('config') .. conf_file
      end
      return vim.fn.getcwd() .. conf_file
    end

    conform.formatters.stylua = {
      prepend_args = { '--config-path', stylua_config() },
    }
  end,
}
