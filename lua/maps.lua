local keymap = vim.keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Split window
keymap.set('n', 's-', ':split<CR><C-w>w', { silent = true })
keymap.set('n', 's|', ':vsplit<CR><C-w>w', { silent = true })

keymap.set('n', '<Leader>te', ':tabedit<CR>')
