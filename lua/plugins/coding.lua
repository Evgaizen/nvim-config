return {
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'rafamadriz/friendly-snippets',
            config = function()
                require('luasnip.loaders.from_vscode').lazy_load()
            end,
        },
        opts = {
            history = true,
            delete_check_events = 'TextChanged',
        },
    },
    {
        'hrsh7th/nvim-cmp',
        version = false, -- last release is way too old
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
        },
        opts = function()
            local cmp = require('cmp')

            return {
                completion = {
                    completeopt = 'menu,menuone,noinsert',
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                }),
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior, select = true })
                })
            }
        end,
    },
    {
        'echasnovski/mini.pairs',
        event = 'VeryLazy',
        opts = {},
    },
    {
        'glepnir/lspsaga.nvim',
        event = { 'LspAttach' },
        config = function()
            local keymap = vim.keymap.set
            local opts = { noremap = true, silent = true }

            keymap('n', 'K', '<CMD>Lspsaga hover_doc<CR>', opts)
            keymap('n', '<LEADER>gd', '<CMD>Lspsaga goto_definition<CR>', opts)
            keymap('n', '<LEADER>gp', '<CMD>Lspsaga preview_definition<CR>', opts)
            keymap('n', '<LEADER>gr', '<CMD>Lspsaga lsp_finder<CR>', opts)
            keymap('n', '<LEADER>ga', '<CMD>Lspsaga code_action<CR>', opts)

            require('lspsaga').setup({})
        end
    }
}
