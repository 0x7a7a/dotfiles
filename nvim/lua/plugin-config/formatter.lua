require("formatter").setup({
	filetype = {
		lua = {
			function()
				return {
					exe = "stylua",
					args = {
						"--config-path " .. os.getenv("PWD") .. "/lua/formatter/lua.toml",
						"-",
					},
					stdin = true,
				}
			end,
		},
	},
})

-- 保存自动格式化
vim.api.nvim_exec(
	[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.lua FormatWrite
augroup END
]],
	true
)
