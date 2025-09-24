function Z.close_other_bufs()
  local cur_buf = vim.api.nvim_get_current_buf()
  local bufs = vim.api.nvim_list_bufs()

  for _, buf in ipairs(bufs) do
    if buf ~= cur_buf then
      local filetype = vim.api.nvim_get_option_value('filetype', { buf = buf })
      local exclude = {
        'floaterm',
        'codecompanion',
      }

      local is_dap_filetype = filetype:match('^dap') ~= nil

      if not (vim.tbl_contains(exclude, filetype) or is_dap_filetype) then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end
end

function Z.is_mac()
  return vim.fn.has('mac') == 1
end

-- https://github.com/neovim/nvim-lspconfig/blob/03bc581e05e81d33808b42b2d7e76d70adb3b595/plugin/lspconfig.lua#L106C1-L127C5
function Z.restart_all_lsp()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })

  for _, c in ipairs(clients) do
    local attached_buffers = vim.tbl_keys(c.attached_buffers) ---@type integer[]
    local config = c.config
    vim.lsp.stop_client(c.id, true)

    vim.defer_fn(function()
      local id = vim.lsp.start(config)
      if id then
        for _, b in ipairs(attached_buffers) do
          vim.lsp.buf_attach_client(b, id)
        end
        vim.notify(string.format('Lsp `%s` has been restarted.', config.name))
      else
        vim.notify(string.format('Error restarting `%s`.', config.name), vim.log.levels.ERROR)
      end
    end, 600)
  end
end

-- Add a custom command to copy the current file path to the clipboard
local function copy_path(opts)
  local type = opts.fargs[1] or 'rel'
  local format = type == 'rel' and '%' or '%:p'
  local path = vim.fn.expand(format)
  vim.fn.setreg('+', path)
  vim.notify('copied "' .. path .. '" to the clipboard!')
end
vim.api.nvim_create_user_command('CopyPath', copy_path, {
  nargs = '?',
  complete = function()
    return { 'rel', 'abs' }
  end,
})

-- LSP commands
vim.api.nvim_create_user_command('LspRestartAll', Z.restart_all_lsp, {})
vim.api.nvim_create_user_command('LspInfo', function()
  vim.cmd('checkhealth vim.lsp')
end, {})

-- Color scheme toggle
function Z.set_light_colorscheme()
  vim.opt.background = 'light'
  vim.cmd.colorscheme('rose-pine-dawn')

  -- because the highlight colors of rose-pine-dawn and illuminate are similar
  -- the cursor color has been modified
  vim.opt.guicursor = {
    'n-v-c-sm:block-Cursor',
    'i-ci-ve:ver25-Cursor',
    'r-cr-o:hor20',
    't:block-blinkon500-blinkoff500-TermCursor',
  }
  vim.api.nvim_set_hl(0, 'Cursor', { fg = '#000000', bg = '#EAA041' })
end

function Z.set_dark_colorscheme()
  vim.opt.background = 'dark'
  vim.cmd.colorscheme('gruvbox-material')

  vim.opt.guicursor = {
    'n-v-c-sm:block',
    'i-ci-ve:ver25',
    'r-cr-o:hor20',
    't:block-blinkon500-blinkoff500-TermCursor',
  }
  -- vim.api.nvim_set_hl(0, 'Cursor', {})
  vim.cmd('hi clear Cursor')
end

vim.api.nvim_create_user_command('ToggleColorscheme', function()
  if vim.o.background == 'dark' then
    Z.set_light_colorscheme()
  else
    Z.set_dark_colorscheme()
  end

  -- I don't know why the WindowPicker loses its highlight after toggle colorscheme
  vim.api.nvim_set_hl(0, 'WindowPickerStatusLine', { fg = '#ededed', bg = '#44cc41', bold = true })
  vim.api.nvim_set_hl(0, 'WindowPickerStatusLineNC', { fg = '#ededed', bg = '#44cc41', bold = true })
end, {})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'sql',
    'zig',
    'html',
    'xml',
    'css',
    'javascript',
    'typescript',
    'tsx',
    'go',
    'vue',
    'lua',
    'http',
    'json',
    'vimdoc',
    'make',
  },
  callback = function()
    vim.treesitter.start()
  end,
})
