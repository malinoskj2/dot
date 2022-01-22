-- Lsp Installer
local lsp_installer = require "nvim-lsp-installer"

local languages = require "jesse.lsp.languages"
local servers = require "jesse.lsp.language_servers"

-- Install servers
for _, language in pairs(vim.tbl_filter(function(language)
  return language.language_server ~= nil
end, languages)) do
  local ok, server = require("nvim-lsp-installer.servers").get_server(language.language_server["name"])

  if ok and not server:is_installed() then
    print("Installing LSP server " .. language.name)
    server:install()
  end
end

-- Register a handler that will be called for all installed servers.
lsp_installer.on_server_ready(function(server)
  server:setup(vim.tbl_deep_extend("force", {
    on_attach = require("jesse.lsp.handlers").on_attach,
    capabilities = require("jesse.lsp.handlers").capabilities,
  }, servers[server.name] or {}))
end)
