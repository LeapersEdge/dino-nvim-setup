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

--  use ({
--	'olimorris/onedarkpro.nvim',
--	as = 'onedarkpro',
--	config = function()
--		vim.cmd("colorscheme onedark")
--	end
--  })
--  use { "ellisonleao/gruvbox.nvim" }
  use 'Mofiqul/vscode.nvim'
  use('nvim-treesitter/playground')
  use{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment these if you want to manage LSP servers from neovim
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup({
        direction = "float",
    })
  end}
  use('nvim-tree/nvim-web-devicons')
  use {
    'mfussenegger/nvim-dap',
    config = function()
        require('dap').adapters.lldb = {
            type = 'executable',
            command = 'lldb-dap',
            name = 'lldb'
        }
        require('dap').configurations.cpp = {
            {
                name = "Launch",
                type = "lldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                args = {},
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                runInTerminal = false,
            }
        }
    end
  }

  use('theHamsta/nvim-dap-virtual-text')
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
  -- nvim v0.7.2
  use({
      "kdheepak/lazygit.nvim",
      -- optional for floating window border decoration
      requires = {
          "nvim-lua/plenary.nvim",
      },
  })
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
end)


