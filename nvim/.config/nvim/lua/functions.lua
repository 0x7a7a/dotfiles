local AUGROUP = vim.api.nvim_create_augroup('Z', {})

function Z.autocmd(event, pattern, cmds)
  if cmds == nil then
    cmds = pattern
    pattern = nil
  end

  local callback = type(cmds) == 'function' and cmds
    or function()
      for opt, val in pairs(cmds) do
        vim.opt_local[opt] = val
      end
    end

  vim.api.nvim_create_autocmd(event, {
    callback = callback,
    group = AUGROUP,
    pattern = pattern,
  })
end

function Z.has(mod)
  local exists, _ = pcall(require, mod)
  return exists
end

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
        vim.api.nvim_buf_delete(buf, { force = false })
      end
    end
  end
end

function Z.toggle_quickfix()
  local qf_windows = vim.tbl_filter(function(winid)
    local ok, bufnr = pcall(vim.api.nvim_win_get_buf, winid)
    if ok then
      local buftype = vim.bo[bufnr].buftype
      if buftype == 'quickfix' then
        local wininfo = vim.fn.getwininfo(winid)
        if wininfo and #wininfo > 0 and wininfo[1] then
          return wininfo[1].loclist == 0
        end
      end
    end
    return false
  end, vim.api.nvim_tabpage_list_wins(0))

  if #qf_windows == 0 then
    local qf_list = vim.fn.getqflist()
    if #qf_list > 0 then
      vim.cmd('copen')
    else
      vim.notify('Quickfix list is empty', vim.log.levels.INFO)
    end
  else
    vim.cmd('cclose')
  end
end

function Z.is_mac()
  return vim.fn.has('mac') == 1
end

function Z.set_auto_cursorline_highlight()
  Z.autocmd({ 'InsertEnter', 'InsertLeave' }, function(arg)
    if arg.event == 'InsertEnter' then
      vim.opt.cursorlineopt = 'number'
    else
      vim.opt.cursorlineopt = 'both'
    end
  end)
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

-- Automatic switching of relative and absolute line numbers
local autocmd = Z.autocmd
autocmd({ 'InsertEnter', 'InsertLeave' }, function(arg)
  local ft = vim.bo.filetype
  if ft == 'help' or ft == 'copilot-chat' then
    return
  end

  if ft == 'qf' or ft == 'codecompanion' then
    vim.opt.relativenumber = false
    return
  end

  vim.opt.relativenumber = arg.event == 'InsertLeave'
end)

autocmd({ 'BufEnter', 'WinEnter' }, function()
  vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = 'orange' })
end)

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

-- Use yanky.nvim instand of this
-- Flash yanked lines
-- autocmd('TextYankPost', function()
--   vim.highlight.on_yank({
--     higroup = 'IncSearch',
--     timeout = 150,
--   })
-- end)

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
  vim.api.nvim_set_hl(0, 'Cursor', {})
end

vim.api.nvim_create_user_command('ToggleColorscheme', function()
  if vim.o.background == 'dark' then
    Z.set_light_colorscheme()
  else
    Z.set_dark_colorscheme()
  end
end, {})
