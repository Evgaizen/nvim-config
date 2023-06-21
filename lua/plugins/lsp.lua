return {
    {
        'williamboman/mason.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            ensure_installed = {
                'sumneko_lua',
                'tsserver',
            }
        }
    }
}
