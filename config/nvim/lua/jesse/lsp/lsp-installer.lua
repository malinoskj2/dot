-- Lsp Installer
local lsp_installer = require("nvim-lsp-installer")

local languages = require("jesse.lsp.languages")
local servers = require("jesse.lsp.servers")

-- Install servers
for _, language in pairs(languages) do
	local ok, server = require("nvim-lsp-installer.servers").get_server(language.language_server["name"])

	if ok and not server:is_installed() then
		print("Installing LSP server " .. language.name)
		server:install()
	end
end

-- Register a handler that will be called for all installed servers.
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("jesse.lsp.handlers").on_attach,
		capabilities = require("jesse.lsp.handlers").capabilities,
	}

	-- Load server specific options if file exists in servers directory
	opts = vim.tbl_deep_extend("force", servers[server.name] or {}, opts)

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
