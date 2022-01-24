-- Mappings
local List = require "pl.List"

-- Space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local mappings = {
  -- Disable ESC to exit Insert mode
  { "", "<Space>", "<Nop>" },
  -- Use jk/kj to exit Insert mode
  { "i", "<ESC>", "<Nop>" },
  { "i", "jk", "<ESC>" },
  { "i", "kj", "<ESC>" },
  -- Navigate buffers
  { "n", "<S-l>", ":bnext<CR>" },
  { "n", "<S-h>", ":bprevious<CR>" },
}

local opts = { noremap = true, silent = true }

List(mappings):foreach(function(mapping)
  vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
end)
