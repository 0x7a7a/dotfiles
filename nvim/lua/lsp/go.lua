local basic = require("lsp/basic")

require("lspconfig").gopls.setup({
	capabilities = basic.capabilities,
	on_attach = function(client, bufnr)
		basic.on_attach()
	end,
})
-- 和lspsaga冲突
vim.g.go_doc_keywordprg_enabled = false
