local function is_quickfix_open()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win['quickfix'] == 1 then
      return true
    end
  end
  return false
end

local function toggle_quicfix()
  if is_quickfix_open() then
    vim.cmd('cclose')
  else
    vim.cmd('copen')
  end
end

return {
  'kevinhwang91/nvim-bqf',
  ft = { 'qf' },
  keys = { {
    '<Space>q',
    function()
      toggle_quicfix()
    end,
    'Toggle quickfix',
  } },
}
