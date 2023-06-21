local keymap = vim.keymap

-- Split window
keymap.set('n', 's-', ':split<CR><C-w>w', { silent = true })
keymap.set('n', 's|', ':vsplit<CR><C-w>w', { silent = true })

keymap.set('n', '<Leader>te', ':tabedit<CR>')
