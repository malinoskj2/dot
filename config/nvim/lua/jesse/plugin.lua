-- Plugins

-- Install plugins
require('packer').startup({function() 

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

-- Language
use 'neovim/nvim-lspconfig'
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

end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})

-- Setup plugins
-- require "plugin/null-ls"
require "jesse.plugin.lspconfig"
require "jesse.plugin.cmp"
require "jesse.plugin.catppuccin"
vim.cmd[[colorscheme catppuccin]]
require "jesse.plugin.treesitter"
require "jesse.plugin.nvim-ts-autotag"
require "jesse.plugin.nvim-notify"
require "jesse.plugin.lualine"
