return {
    {
        'hoob3rt/lualine.nvim',
        event = 'VeryLazy',
        opts = {
            options = {
                icons_enabled = true,
                theme = 'fluoromachine',
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
    },
    {
        'akinsho/nvim-bufferline.lua',
        event = 'VeryLazy',
        opts = function()
            local keymap = vim.keymap.set

            keymap('n', '<Leader>bn', '<cmd>BufferLineCycleNext<CR>')
            keymap('n', '<Leader>bp', '<cmd>BufferLineCyclePrev<CR>')
            keymap('n', '<Leader>bf', '<cmd>BufferLinePick<CR>')
            keymap('n', '<Leader>bd', '<cmd>bdelete<CR>')

            return {
                options = {
                    mode = 'buffers',
                    separator_style = 'slant',
                    always_show_bufferline = false,
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    color_icons = true
                },
                highlights = {
                    separator = {
                        fg = '#073642',
                        bg = '#002b36'
                    },
                    separator_selected = {
                        fg = '#073642'
                    },
                    background = {
                        fg = '#657b83',
                        bg = '#002b36'
                    },
                    buffer_selected = {
                        fg = '#fdf6e3',
                        bold = true
                    },
                    fill = {
                        bg = '#073642'
                    },
                }
            }
        end
    },
    {
        'nvim-tree/nvim-web-devicons',
        lazy = true,
        opts = {
            default = true,
        }
    },
    {
        'echasnovski/mini.indentscope',
        version = '*',
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {
            symbol = "│",
            options = { try_as_border = true },
        },
    },
}
