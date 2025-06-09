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
      local exclude = { 'floaterm', 'codecompanion' }

      if not vim.tbl_contains(exclude, filetype) then
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
