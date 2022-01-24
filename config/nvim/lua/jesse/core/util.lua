-- Misc utility functions
local M = {}

M.close_all = function()
  vim.cmd "cclose"
  vim.cmd "NvimTreeClose"
  vim.cmd "normal q"
end

return M
