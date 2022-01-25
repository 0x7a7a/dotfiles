local basic = require('lsp/basic')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.gopls.setup({
    capabilities = basic.capabilities,
    on_attach = function(client, bufnr)
        basic.on_attach()
    end
})
-- 和lspsaga冲突
vim.g.go_doc_keywordprg_enabled = false
