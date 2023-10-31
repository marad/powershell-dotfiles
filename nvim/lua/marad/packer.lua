-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use {
      'nvim-treesitter/nvim-treesitter',
      commit = "6f2ef910c2c320f27cf988cf4e688746f16f4f75",
      run = ':TSUpdate',
  }

  use('mbbill/undotree')

  use('tpope/vim-fugitive')

  use('ThePrimeagen/harpoon')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment these if you want to manage LSP servers from neovim
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
          {'simrat39/rust-tools.nvim'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }

  -- use {
  --     "nvim-neorg/neorg",
  --     config = function()
  --         require("neorg").setup {
  --             load = {
  --                 ["core.defaults"] = {},
  --                 ["core.concealer"] = {},
  --             }
  --         }
  --     end,
  --     run = ":Neorg sync-parsers",
  --     requires = "nvim-lua/plenary.nvim",
  -- }
  end)
