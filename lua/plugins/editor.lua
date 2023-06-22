return {
    {
        'nvim-telescope/telescope.nvim',
        version = false,
        cmd = 'Telescope',
        keys = {
            {
                '<LEADER>ff',
                '<CMD>lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true })<CR>',
                desc = 'Find file from root'
            },
            {
                '<LEADER>fw',
                '<CMD>lua require("telescope.builtin").live_grep()<CR>',
                desc = 'Find word in root'
            },
            {
                '<LEADER>fl',
                '<CMD>Telescope current_buffer_fuzzy_find<CR>'
            }
        },
        opts = {
            defaults = {
                mappings = {
                    n = {
                        ['q'] = function(...)
                            require('telescope.actions').close(...)
                        end
                    }
                }
            }
        }
    },
    {
        'nvim-tree/nvim-tree.lua',
        keys = {
            {
                '<LEADER>nf',
                '<CMD>:NvimTreeFindFile<CR>',
                desc = 'Open tree and focus on current buffer'
            },
            {
                '<LEADER>nn',
                '<CMD>:NvimTreeToggle<CR>',
                desc = 'Toggle nvim tree'
            }
        },
        opts = {}
    }
}
