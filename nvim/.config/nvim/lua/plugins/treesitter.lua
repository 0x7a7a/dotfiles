-- https://github.com/MeanderingProgrammer/treesitter-modules.nvim
-- https://github.com/nvim-treesitter/nvim-treesitter/tree/main?tab=readme-ov-file
-- Must install `tree-sitter-cli` first!!!
return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local ensure_installed = {
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
    local already_installed = require('nvim-treesitter.config').get_installed()
    local uninstalled = vim
      .iter(ensure_installed)
      :filter(function(parser)
        return not vim.tbl_contains(already_installed, parser)
      end)
      :totable()

    if #uninstalled > 0 then
      require('nvim-treesitter').install(uninstalled)
    end

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
      end,
    })
  end,
}
