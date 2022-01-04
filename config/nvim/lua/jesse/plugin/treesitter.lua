require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",

	sync_install = false,

	autopairs = {
		enable = true,
	},

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true, disable = { "yaml" } },

	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
