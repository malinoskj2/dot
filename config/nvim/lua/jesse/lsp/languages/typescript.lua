return {
	name = "TypeScript",
	language_server = "tsserver",
	null_language_servers = {
		prettier = {
			diagnostics = false,
			formatting = true,
		},
		eslint_d = {
			diagnostics = true,
			formatting = false,
		},
	},
}
