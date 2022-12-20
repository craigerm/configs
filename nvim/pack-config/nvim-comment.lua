local map = vim.api.nvim_set_keymap

require('nvim_comment').setup()

map('', '<leader>cl', ':CommentToggle<cr>', { noremap = true, silent = true })
