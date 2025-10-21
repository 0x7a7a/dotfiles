local languages = {
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
}

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install(languages)

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('treesitter.setup', {}),
      callback = function(args)
        local buf = args.buf
        local filetype = args.match

        local language = vim.treesitter.language.get_lang(filetype) or filetype
        if not vim.treesitter.language.add(language) then
          return
        end

        vim.treesitter.start(buf, language)
        -- vim.bo[buf].syntax = 'ON'
      end,
    })
  end,
}
