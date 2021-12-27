-- Lsp Installer
local lsp_installer = require "nvim-lsp-installer"

local lsp_servers = { "sumneko_lua", "tsserver", "tailwindcss" }

-- Install servers
for _, name in ipairs(lsp_servers) do
  local ok, server = require("nvim-lsp-installer.servers").get_server(name)

  if ok and not server:is_installed() then
    print("Installing LSP server " .. name)
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

	 if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("jesse.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
