require('keys.alias')

-- Файловый менеджер
nm('<Leader>nn', '<cmd>Telescope file_browser<CR>')

-- Bufferline
nm('<Leader>bf', '<cmd>BufferLinePick<CR>')

-- Telescope
nm('<Leader>ff', '<cmd>Telescope find_files<CR>')
nm('<Leader>fw', '<cmd>Telescope live_grep<CR>')
nm('<Leader>fl', '<cmd>Telescope current_buffer_fuzzy_find<CR>')
nm('<Leader>fs', '<cmd>Telescope lsp_document_symbols<CR>')

-- LSP
local keyset = vim.keymap.set
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Вызов автодополнения по табам
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

keyset("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "<CR>"]], opts)

-- Вызов автодополнения
keyset("i", "<c-c>", "coc#refresh()", {silent = true, expr = true})

-- Режим диагностики
nm('<Leader>tt', '<Cmd>CocDiagnostics<CR>')

-- Навигация по коду
nm('<Leader>gd', '<Plug>(coc-definition)')
nm('<Leader>gy', '<Plug>(coc-type-definition)')
nm('<Leader>gi', '<Plug>(coc-implementation)')
nm('<Leader>gr', '<Plug>(coc-references)')
nm('<Leader>ga', '<Plug>(coc-codeaction-cursor)')
-- Показ документации для токена
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
nm('K', '<CMD>lua _G.show_docs()<CR>')

-- Подсветка групп под курсором
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})
