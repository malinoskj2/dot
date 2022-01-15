-- Lsp Installer
local lsp_installer = require("nvim-lsp-installer")

local languages = require("jesse.lsp.languages")

-- Install servers
for _, language in pairs(languages) do
	local ok, server = require("nvim-lsp-installer.servers").get_server(language.language_server)

	if ok and not server:is_installed() then
		print("Installing LSP server " .. language.name)
		server:install()
	end
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("jesse.lsp.handlers").on_attach,
		capabilities = require("jesse.lsp.handlers").capabilities,
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("jesse.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("jesse.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "tailwindcss" then
		local tailwindcss_opts = require("jesse.lsp.settings.tailwindcss")
		opts = vim.tbl_deep_extend("force", tailwindcss_opts, opts)
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
