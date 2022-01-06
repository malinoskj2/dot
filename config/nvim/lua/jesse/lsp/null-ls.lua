local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			prefer_local = "node_modules/.bin",
			filetypes = {
				"json",
				"yaml",
				"markdown",
			},
		}),
		formatting.prettier_d_slim.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
			},
		}), -- Installed globally via npm -g, Gonna have to make a nixos derivation for this at some point
		formatting.stylua,
		diagnostics.eslint_d,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()")
		end
	end,
})
