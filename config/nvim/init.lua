-- Jesse's Neovim config :)
require("jesse.general")
require("jesse.performance")
require("jesse.mapping")
require("jesse.lsp")
require("jesse.tab")
require("jesse.plugin")
require("jesse.util")

-- Vertically center document when entering Insert mode
vim.cmd([[
  autocmd insertEnter * norm zz
]])

-- Set cursor shape when leaving vim
vim.cmd([[
  augroup SetCmdlineCursorShape
    autocmd!
    autocmd VimLeave * set guicursor=a:hor20-blinkwait400-blinkoff400-blinkon400
  augroup END  
]])
