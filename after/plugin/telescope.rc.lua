local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')
local fb_actions = require('telescope').extensions.file_browser.actions

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close
      }
    }
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      hijack_netrw = true,
      mappings = {
        ['n'] = {
          ['N'] = fb_actions.create
        }
      }
    }
  }
}

telescope.load_extension('file_browser')

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap('n', '<Leader>ff',
  '<cmd>lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true })<CR>',
  opts)
keymap('n', '<Leader>fw',
  '<cmd>lua require("telescope.builtin").live_grep()<CR>',
  opts)
keymap('n', '<Leader>fb',
  '<cmd>lua require("telescope.builtin").buffers()<CR>',
  opts)
keymap('n', '<Leader>ft',
  '<cmd>lua require("telescope.builtin").help_tags()<CR>',
  opts)
keymap('n', '<Leader>tt',
  '<cmd>lua require("telescope.builtin").diagnostics()<CR>',
  opts)
keymap('n', '<Leader>nf',
  '<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", pwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, initial_mode = "normal", layout_config = {height=40} })<CR>'
  ,
  opts)
