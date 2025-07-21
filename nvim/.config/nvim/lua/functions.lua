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
    return vim.fn.getwininfo(winid)[1].quickfix == 1
  end, vim.api.nvim_tabpage_list_wins(0))

  local cmd = #qf_windows == 0 and 'copen' or 'cclose'
  vim.cmd(cmd)
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

-- TODO: Implement this function to restart all LSP servers.
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
