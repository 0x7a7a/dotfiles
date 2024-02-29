return {
  'jinh0/eyeliner.nvim',
  event = 'VeryLazy',
  config = function()
    require('eyeliner').setup({
      highlight_on_key = true, -- show highlights only after keypress
      dim = true, -- dim all other characters if set to true (recommended!)
    })
  end,
}
