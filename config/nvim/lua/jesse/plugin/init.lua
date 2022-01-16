-- Plugins

local packer = require("jesse.plugin.packer")
local use = packer.use

-- Install
packer.startup(function()
	-- use 'jose-elias-alvarez/null-ls.nvim'
	-- Util
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("rcarriga/nvim-notify")
	use("kyazdani42/nvim-web-devicons")

	-- Line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Navigation
	use("farmergreg/vim-lastplace")

	-- Fuzzy
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-telescope/telescope-fzy-native.nvim")

	-- Completion
	use("hrsh7th/nvim-cmp")
	use("onsails/lspkind-nvim")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp")
	use("windwp/nvim-ts-autotag")
	use("windwp/nvim-autopairs")

	-- Language
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("b0o/schemastore.nvim")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	-- Colors
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- Tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	})

	-- Comment
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Automatically set up your configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

-- Setup plugins
-- require "plugin/null-ls"
require("jesse.plugin.cmp")
require("jesse.plugin.catppuccin")
vim.cmd([[colorscheme catppuccin]])
require("jesse.plugin.treesitter")
require("jesse.plugin.telescope")
require("jesse.plugin.nvim-ts-autotag")
require("jesse.plugin.nvim-autopairs")
require("jesse.plugin.nvim-notify")
require("jesse.plugin.lualine")
