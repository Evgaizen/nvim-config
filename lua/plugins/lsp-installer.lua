-- Берем плагин для установки LSP
local lspinstaller = require'nvim-lsp-installer'

-- Конфигурация для LSP
local lspconfig = require'lspconfig'

-- Конфигурируем lsp-installer
lspinstaller.setup{
	ensure_installed = {
		'cssls',                  -- CSS
		'emmet_ls',               -- HTML
		'sumneko_lua',            -- Lua
		'tsserver',               -- Typescript, Javascript
		'volar'                   -- Vue
	},
}

-- Возможности редактора
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Добавляем возможность использовать сниппеты
capabilities.textDocument.completion.completionItem.snippetSupport = true

for _, server in ipairs(lspinstaller.get_installed_servers()) do
  lspconfig[server.name].setup{
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  }
end
