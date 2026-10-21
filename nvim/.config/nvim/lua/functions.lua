function Z.close_other_bufs(force)
  local current = vim.api.nvim_get_current_buf()
  local skipped = 0

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted then
      if vim.bo[buf].modified and not force then
        skipped = skipped + 1
      else
        local ok = pcall(vim.api.nvim_buf_delete, buf, { force = force == true })
        if not ok then
          skipped = skipped + 1
        end
      end
    end
  end

  if skipped > 0 then
    vim.notify(('Skipped %d modified or unclosable buffer(s)'):format(skipped), vim.log.levels.WARN)
  end
end

function Z.is_mac()
  return vim.fn.has('mac') == 1
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
vim.api.nvim_create_user_command('LspRestartAll', function()
  vim.cmd('lsp restart')
end, {})
vim.api.nvim_create_user_command('LspInfo', function()
  vim.cmd('checkhealth vim.lsp')
end, {})

-- Color scheme toggle
function Z.set_light_colorscheme()
  require('lazy').load({ plugins = { 'rose-pine' } })
  vim.opt.background = 'light'
  vim.opt.guicursor = {
    'n-v-c-sm:block-Cursor',
    'i-ci-ve:ver25-Cursor',
    'r-cr-o:hor20',
    't:block-blinkon500-blinkoff500-TermCursor',
  }
  vim.cmd.colorscheme('rose-pine-dawn')
end

function Z.set_dark_colorscheme()
  vim.opt.background = 'dark'
  vim.opt.guicursor = {
    'n-v-c-sm:block',
    'i-ci-ve:ver25',
    'r-cr-o:hor20',
    't:block-blinkon500-blinkoff500-TermCursor',
  }
  vim.cmd.colorscheme('gruvbox-material')
end

vim.api.nvim_create_user_command('ToggleColorscheme', function()
  if vim.o.background == 'dark' then
    Z.set_light_colorscheme()
  else
    Z.set_dark_colorscheme()
  end
end, {})
