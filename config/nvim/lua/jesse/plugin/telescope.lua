-- Telescope 
local M = {}

require('telescope').setup {
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
    },
    git_files = {
      shorten_path = true
    }
  }
}

require('telescope').load_extension('fzy_native')

-- Launch mappings
vim.api.nvim_set_keymap(
  'n', 
  '<Leader>f', 
  "<CMD>lua require'jesse.plugin.telescope'.git_or_find_files()<CR>",
  { noremap = true, silent = true}
)

vim.api.nvim_set_keymap(
 'n', 
  '<Leader>g', 
  "<CMD>lua require('telescope.builtin').live_grep()<cr>",
  { noremap = true, silent = true}
)

-- Fallback to find_files if not in git repo
M.git_or_find_files = function()
    local opts = {}
    local ok = pcall(require"telescope.builtin".git_files, opts)
    if not ok then require"telescope.builtin".find_files(opts) end
end

 return M
