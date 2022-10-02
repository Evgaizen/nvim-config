-- Добавляем Packer как пакет в Neovim
vim.cmd [[packadd packer.nvim]]

-- Используем данный коллбэк как список для плагинов
return require('packer').startup(function()

	-- Добавляем Packer в список, чтобы он обновлял сам себя
	use 'wbthomason/packer.nvim'

	-- LSP сервер
	use 'neovim/nvim-lspconfig'
	
	-- Иконки для автодополнения
	use {
		'onsails/lspkind-nvim',
		config = function()
			-- require('plugins.lspkind')
		end
	}

	-- Удобное меню для обозрения проблем LSP
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {}
		end,
	}
	
	-- Автодополнение
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-emoji',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'hrsh7th/cmp-nvim-lua'
		},
		config = function()
			require('plugins.cmp')
		end
	}

	-- Инсталлер для серверов LSP
	use {
		'williamboman/nvim-lsp-installer',
		config = function()
			require('plugins.lsp-installer')
		end
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('plugins.tree-sitter')
		end
	}

	use {
		'sainnhe/gruvbox-material',
		config = function ()
			vim.cmd[[color gruvbox-material]]
		end
	}

	-- Прогресс загрузки LSP
	use {
		'j-hui/fidget.nvim',
		config = function()
			require('fidget').setup({
				align = {
					bottom = true,
					right = true,
				}
			})
		end
	}

	-- Статус лайн 
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require('plugins.lualine')
		end
	}

	-- Файловый менеджер
	use {
		'kyazdani42/nvim-tree.lua',
		 requires = {
			'kyazdani42/nvim-web-devicons', 
		 },
		 config = function ()
		 	require('plugins.nvim-tree')
		 end
	}

	-- Статусбар для буфферов
	use {
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('plugins.bufferline')
		end
	}

end)
