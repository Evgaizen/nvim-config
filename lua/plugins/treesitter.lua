return {
    {
        'nvim-treesitter/nvim-treesitter',
        version = false,
        build = ':TSUpdate',
        event = { 'BufReadPost', 'BufNewFile' },
        cmd = { 'TSUpdateSync' },
        dependencies = {
            {
                'nvim-treesitter/nvim-treesitter-textobjects',
                init = function()
                    local plugin = require('lazy.core.config').spec.plugins['nvim-treesitter']
                    local opts = require('lazy.core.plugin').values(plugin, 'opts', false)
                    local enabled = false
                    if opts.textobjects then
                        for _, mod in ipairs({ 'move', 'select', 'swap', 'lsp_interop' }) do
                            if opts.textobjects[mod] and opts.textobjects[mod].enable then
                                enabled = true
                                break
                            end
                        end
                    end
                    if not enabled then
                        require('lazy.core.loader').disable_rtp_plugin('nvim-treesitter-textobjects')
                    end
                end,
            },
        },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                'bash',
                'c',
                'html',
                'javascript',
                'json',
                'lua',
                'luadoc',
                'luap',
                'markdown',
                'markdown_inline',
                'python',
                'query',
                'regex',
                'tsx',
                'typescript',
                'vim',
                'vimdoc',
                'yaml',
            },
            incremental_selection = {
                enable = true,
            },
        },
        config = function(_, opts)
            if type(opts.ensure_installed) == 'table' then
                local added = {}
                opts.ensure_installed = vim.tbl_filter(function(lang)
                    if added[lang] then
                        return false
                    end
                    added[lang] = true
                    return true
                end, opts.ensure_installed)
            end
            require('nvim-treesitter.configs').setup(opts)
        end,
    },
}
