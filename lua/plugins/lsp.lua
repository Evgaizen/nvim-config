return {
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig',
        },
        opts = {
            ensure_installed = {
                'tsserver',
                'lua_ls',
                'jsonls',
                'eslint',
                'cssls',
            }
        },
        config = function(_, opts)
            require('mason').setup()
            require('mason-lspconfig').setup(opts)

            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            lspconfig.tsserver.setup {
                filetypes = {
                    'typescript',
                    'typescriptreact',
                    'typescript.tsx',
                    'javascript',
                    'javascriptreact',
                    'javascript.tsx',
                },
                cmd = { 'typescript-language-server', '--stdio' },
                single_file_support = true,
                capabilities = capabilities,
            }

            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            enable = true,
                            globals = { 'vim' }
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file('', true),
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        }
                    }
                }
            }

            lspconfig.cssls.setup {
                capabilities = capabilities,
            }
        end
    }
}
