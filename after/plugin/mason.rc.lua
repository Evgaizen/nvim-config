local status, mason = pcall(require, 'mason')
if (not status) then return end
local lspconfig_status, mason_lspconfig = pcall(require, 'mason-lspconfig')
if (not lspconfig_status) then return end

mason.setup {}
mason_lspconfig.setup {
  ensure_installed = {
    'sumneko_lua',
    'tsserver',
    'marksman'
  }
}
