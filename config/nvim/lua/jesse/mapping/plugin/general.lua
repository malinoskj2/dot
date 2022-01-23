-- Nvim-tree Mappings
local List = require "pl.List"

local mappings = {
  -- Nvimtree toggle
  { "n", "<leader>t", ":NvimTreeToggle<cr>" },
}

local opts = { noremap = true, silent = true }

List(mappings):foreach(function(mapping)
  vim.api.nvim_set_keymap(mapping[1], mapping[2], mapping[3], opts)
end)
