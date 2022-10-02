require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_c = {'filename', 'lsp_progress'},
		lualine_b = {
			 {
				 'diagnostics',
				 sources = { 'nvim_diagnostic' },
				 symbols = { error = ' ', warn = ' ', info = ' ' },
				 diagnostics_color = {
					color_error = { fg = '#ec5f67' },
					color_warn = { fg = '#ECBE7B' },
					color_info = { fg = '#008080' },
				 },
			}
		},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
}
