local opt = vim.opt

--[[ Настройка панелей ]]--
-- Вертикальные сплиты становятся справа
-- По умолчанию панели в Neovim ставятся в зависимости от расположения текущей панели. Данная настройка поможет нам держать панели в порядке
opt.splitright = true

-- Горизонтальные сплиты становятся снизу
opt.splitbelow = true

--[[ Дополнительные настройки ]]--
-- Используем системный буфер обмена
opt.clipboard = 'unnamedplus'

-- Отключаем дополнение файлов в конце
opt.fixeol = false

-- Автодополнение (встроенное в Neovim)
opt.completeopt = 'menuone,noselect'

-- Не автокомментировать новые линии при переходе на новую строку
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

-- Номер строки
opt.number = true

-- Относительный номер строки
opt.relativenumber = true

-- Кол-во пробелов для символа табуляции
opt.tabstop = 4
opt.shiftwidth = 4 

-- Не переносить строки из-за выхода за вьюпорт
opt.wrap = false

-- Окно скролла (Скролл вниз начинается при наличии n строк снизу)
opt.scrolloff = 8

-- Возможность открыть новый буффер без сохранения текущего
opt.hidden = true

-- Нормальное поведение backspace
opt.backspace = 'eol,start,indent'

-- Инкриментальный поиск
opt.incsearch = true

-- Бэкапы файла
opt.backup = false

-- Своп файл
opt.swapfile = false

-- Стандарт кодирования
opt.encoding = 'UTF-8'

-- Шрифт
opt.guifont = 'JetBrains Mono:h14'
