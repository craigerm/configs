local map = vim.api.nvim_set_keymap

-- Easier window navigation
map('n', '<C-h>', '<C-w>h', { noremap = true })
map('n', '<C-j>', '<C-w>j', { noremap = true })
map('n', '<C-k>', '<C-w>k', { noremap = true })
map('n', '<C-l>', '<C-w>l', { noremap = true })

-- Ctrl+S for saving
map('i', '<C-s>', '<esc>:w<cr>a', {})
map('n', '<C-s>', ':w<cr>', {})

-- Unmap this one
map('n', 'Q', '<nop>', {})

-- Clipboard
map('n', '<C-c>', "+y", {})
map('n', '<leader>p', '"+p', {})
map('n', '<leader>P', '"+P', {})
