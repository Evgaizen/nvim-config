-- Добавляем Packer как пакет в Neovim
vim.cmd [[packadd packer.nvim]]

-- Используем данный коллбэк как список для плагинов
return require('packer').startup(function()

	-- Добавляем Packer в список, чтобы он обновлял сам себя
	use 'wbthomason/packer.nvim'

	-- Просмотрщик MD
	use {
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	}

	-- Красивые уведомления
	use {
		"rcarriga/nvim-notify",
		config = function()
			require('plugins.notify')
		end
	}

	use {
		"luukvbaal/nnn.nvim",
		config = function ()
			require("nnn").setup()
		end
	}

	use {
		"glepnir/dashboard-nvim",
		config = function ()
			require('plugins.dashboard')
		end
	}

	use {
		'sainnhe/gruvbox-material',
		config = function ()
			vim.cmd[[color gruvbox-material]]
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

	-- Статусбар для буфферов
	use {
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('plugins.bufferline')
		end
	}

	-- Поиск
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			{'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
		},
		config = function ()
			require('plugins.telescope')
		end
	}

	-- LSP
	use {
		'neoclide/coc.nvim',
		branch = 'release',
	}
end)
