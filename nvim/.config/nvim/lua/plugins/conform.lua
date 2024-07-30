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
        typescript = { 'prettierd' },
        javascript = { 'prettierd' },
        css = { 'prettierd' },
        json = { 'prettierd' },
        svelte = { 'prettierd' },
      },
      format_on_save = {
        -- I recommend these options. See :help conform.format for details.
        lsp_fallback = true,
        timeout_ms = 500,
      },
    })

    local function get_stylua_config()
      local stylua_conf = '.stylua.toml'

      if not utils.root_has_file(stylua_conf) then
        return vim.fn.stdpath('config') .. '/' .. stylua_conf
      end
      return vim.fn.getcwd() .. '/' .. stylua_conf
    end

    local stylua_conf = get_stylua_config()
    if vim.fn.filereadable(stylua_conf) == 1 then
      conform.formatters.stylua = {
        prepend_args = { '--config-path', stylua_conf },
      }
    end
  end,
}
