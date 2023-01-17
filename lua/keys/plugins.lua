require('keys.alias')

-- Ховер с подсказкой LSP
nm('K', '<cmd>lua vim.lsp.buf.hover()<CR>')

-- Действия с кодом
nm('<Leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
nm('<Leader>gr', '<cmd>Telescope lsp_references<CR>')
nm('<C-c>', '<cmd>lua vim.lsp.bug.completion()<CR>')
nm('<Leader>gd', '<cmd>Telescope lsp_definitions<CR>')

-- Файловый менеджер
nm('<Leader>nn', '<cmd>NvimTreeToggle<CR>')
nm('<Leader>nf', '<cmd>NvimTreeFindFile<CR>')

-- Telescope
nm('<Leader>ff', '<cmd>Telescope find_files<CR>')
nm('<Leader>fw', '<cmd>Telescope live_grep<CR>')
nm('<Leader>fl', '<cmd>Telescope current_buffer_fuzzy_find<CR>')
nm('<Leader>fs', '<cmd>Telescope lsp_document_symbols<CR>')

-- Trouble
nm('<Leader>tt', '<cmd>TroubleToggle<CR>')
