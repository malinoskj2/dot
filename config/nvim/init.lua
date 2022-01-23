-- Jesse's Neovim config :)

local List = require "pl.List"

local modules = List {
  "jesse.core",
  "jesse.mapping",
  "jesse.lsp",
  "jesse.tab",
  "jesse.plugin",
  "jesse.util",
}

modules:foreach(function(module)
  require(module)
end)

-- Vertically center document when entering Insert mode
vim.cmd [[
  autocmd insertEnter * norm zz
]]

-- Set cursor shape when leaving vim
vim.cmd [[
  augroup SetCmdlineCursorShape
    autocmd!
    autocmd VimLeave * set guicursor=a:hor20-blinkwait400-blinkoff400-blinkon400
  augroup END  
]]
