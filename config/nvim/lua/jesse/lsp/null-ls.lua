local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- Setup Sources
local languages = require("jesse.lsp.languages")
local servers = require("jesse.lsp.null_servers")
local sources = {}

-- Do this diff later with lua_fun
for _, language in pairs(languages) do
	if language.null_language_servers ~= nil then
		for _, null_language_server in pairs(language.null_language_servers) do
			local target_server = servers[null_language_server]
			if target_server.formatting then
				table.insert(sources, formatting[null_language_server])
			end
			if target_server.diagnostics then
				table.insert(sources, diagnostics[null_language_server])
			end
		end
	end
end

null_ls.setup({
	debug = false,
	sources = sources,
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()")
		end
	end,
})
