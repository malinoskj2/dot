local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- Setup Sources
local languages = require("jesse.lsp.languages")
local servers = require("jesse.lsp.null_servers")
local sources = {}

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			prefer_local = "node_modules/.bin",
		}),
		formatting.stylua,
		diagnostics.eslint_d,
		formatting.nixfmt,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()")
		end
	end,
})
