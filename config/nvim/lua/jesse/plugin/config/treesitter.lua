local present, ts_config = pcall(require, "nvim-treesitter.configs")

if not present then
	return
end

ts_config.setup({
	ensure_installed = "maintained",
	sync_install = false,
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})