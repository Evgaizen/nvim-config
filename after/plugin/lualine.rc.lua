local status, lualine = pcall(require, 'lualine')
if (not status) then return end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'solarized_dark',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { {
      'filename',
      file_status = true,
      path = 0
    } },
    lualine_x = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' }
      },
      'enocding',
      'filetype',
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  }
}
