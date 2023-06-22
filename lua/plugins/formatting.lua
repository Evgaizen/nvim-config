return {
    {
        'jose-elias-alvarez/null-ls.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        opts = function()
            local nls = require('null-ls')
            return {
                sources = {
                    nls.builtins.diagnostics.eslint_d.with({
                        diagnostics_format = '[eslint] #{m}\n(#{c})'
                    }),
                    nls.builtins.diagnostics.fish
                },
            }
        end,
    },
}
