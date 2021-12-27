-- Plugins
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Init
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install
packer.startup(function()

-- use 'jose-elias-alvarez/null-ls.nvim'
-- Util
use 'wbthomason/packer.nvim'
use 'nvim-lua/plenary.nvim'
use 'rcarriga/nvim-notify'
use 'kyazdani42/nvim-web-devicons'

-- Line
use {
  'nvim-lualine/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}
}

-- Navigation
use 'farmergreg/vim-lastplace'

-- Fuzzy
use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}
use 'nvim-telescope/telescope-fzy-native.nvim'

-- Completion
use 'hrsh7th/nvim-cmp'
use 'onsails/lspkind-nvim'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-nvim-lua'
use 'hrsh7th/cmp-nvim-lsp'
use 'windwp/nvim-ts-autotag'
use 'windwp/nvim-autopairs'

-- Language
use 'neovim/nvim-lspconfig'
use 'williamboman/nvim-lsp-installer'
use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

-- Snippets
use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'

-- Colors
use({
	"catppuccin/nvim",
	as = "catppuccin"
})

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end
)

-- Setup plugins
-- require "plugin/null-ls"
require "jesse.plugin.cmp"
require "jesse.plugin.catppuccin"
vim.cmd[[colorscheme catppuccin]]
require "jesse.plugin.treesitter"
require "jesse.plugin.telescope"
require "jesse.plugin.nvim-ts-autotag"
require "jesse.plugin.nvim-autopairs"
require "jesse.plugin.nvim-notify"
require "jesse.plugin.lualine"
