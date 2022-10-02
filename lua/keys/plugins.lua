require('keys.alias')

-- Ховер с подсказкой LSP
nm('K', '<cmd>lua vim.lsp.buf.hover()<CR>')

-- Действия с кодом
nm('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
nm('gr', '<cmd>Telescope lsp_references<CR>')

-- Файловый менеджер
nm('nn', '<cmd>NvimTreeToggle<CR>')
nm('nf', '<cmd>NvimTreeFindFile<CR>')

-- Telescope
nm('gd', '<cmd>Telescope lsp_definitions<CR>')
nm('ff', '<cmd>Telescope find_files<CR>')
nm('fw', '<cmd>Telescope live_grep<CR>')
nm('fl', '<cmd>Telescope current_buffer_fuzzy_find<CR>')
