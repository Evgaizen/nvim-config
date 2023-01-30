local status, lspsaga = pcall(require, 'lspsaga')
if (not status) then return end

lspsaga.setup {
  server_filetype_map = {}
}

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
keymap('n', '<Leader>gd', '<cmd>Lspsaga goto_definition<CR>', opts)
keymap('n', '<Leader>gp', '<cmd>Lspsaga preview_definition<CR>', opts)
keymap('n', '<Leader>gr', '<cmd>Lspsaga lsp_finder<CR>', opts)
keymap('n', '<Leader>ga', '<cmd>Lspsaga code_action<CR>', opts)
