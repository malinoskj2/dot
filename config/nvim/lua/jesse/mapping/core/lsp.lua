-- Lsp Mappings
local List = require "pl.List"

local M = {}

local opts = { noremap = true, silent = true }

local mappings = {
  { "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>" },
  { "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>" },
  { "n", "gk", "<cmd>lua vim.lsp.buf.hover()<CR>" },
  { "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>" },
  { "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
  { "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>" },
  { "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>" },
  { "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>" },
  { "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>' },
  { "n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>' },
  { "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>' },
  { "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>" },
}

M.map = function(bufnr)
  List(mappings):foreach(function(mapping)
    vim.api.nvim_buf_set_keymap(bufnr, mapping[1], mapping[2], mapping[3], opts)
  end)
end

return M
