-- General

vim.cmd([[set iskeyword+=-]]) -- treat split by "-" as single word
vim.cmd([[syntax on]])

local options = {
	number = true,
	swapfile = false,
	cursorline = true,
	ignorecase = true,
	smartcase = true,
	termguicolors = true,
	mouse = "a",
	splitbelow = true,
	splitright = true,
	undofile = false,
	undodir = "/tmp/nvim/undodir",
	signcolumn = "yes",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
