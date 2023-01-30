local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer don't installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'hoob3rt/lualine.nvim' -- Bottom status line
  use 'neovim/nvim-lspconfig' -- LSP
  use 'onsails/lspkind-nvim' -- VScode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffers words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp sources for built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completions
  use 'L3MON4D3/LuaSnip' -- Snippet engine
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'nvim-lua/plenary.nvim' -- Common utils
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'akinsho/nvim-bufferline.lua'
  use 'norcalli/nvim-colorizer.lua'
  use 'glepnir/lspsaga.nvim' -- UI for LSP
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
end)
