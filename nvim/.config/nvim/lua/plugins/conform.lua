return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',
  config = function()
    local conform = require('conform')
    conform.setup({
      log_level = vim.log.levels.DEBUG,
      formatters = {
        -- ['goimports-reviser'] = { prepend_args = { '-rm-unused' } },
        prettier = {
          prepend_args = function()
            return {
              '--no-semi',
              '--single-quote',
              '--no-bracket-spacing',
              '--print-width',
              '80',
              '--config-precedence',
              'prefer-file',
            }
          end,
        },
        goctl = {
          command = 'goctl',
          args = { 'api', 'format', '--stdin' },
        },
      },
      formatters_by_ft = {
        python = { 'ruff_format' },
        lua = { 'stylua' },
        go = { 'goimports', 'goimports-reviser', 'gofumpt' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        javascript = { 'prettier' },
        vue = { 'prettier' },
        css = { 'prettier' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
        svelte = { 'prettier' },
        api = { 'goctl' },
      },

      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_format = 'fallback' }
      end,
    })

    local function get_stylua_config()
      local stylua_conf = '.stylua.toml'

      if not vim.fs.find(stylua_conf, { upward = true }) then
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

    vim.keymap.set({ 'n', 'v' }, '=f', function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = 'Format file (or range in visual mode)' })

    -- Command to toggle format-on-save
    vim.api.nvim_create_user_command('FormatDisable', function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = 'Disable autoformat-on-save',
      bang = true,
    })
    vim.api.nvim_create_user_command('FormatEnable', function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = 'Re-enable autoformat-on-save',
    })
  end,
}
