local map = vim.api.nvim_set_keymap

-- remap the key used to leave insert mode
-- format: modek, sequence, command, options
map('i', 'jk', '', {})

-- Easier window navigation
map('n', '<C-h>', '<C-w>h', {})
map('n', '<C-j>', '<C-w>j', {})
map('n', '<C-k>', '<C-w>k', {})
map('n', '<C-l>', '<C-w>l', {})

-- Ctrl+S for saving
map('i', '<C-s>', '<esc>:w<cr>a', {})
map('n', '<C-s>', ':w<cr>', {})

-- Unmap these since happen by accident
map('i', '<F1>', '<nop>', {})
map('n', 'Q', '<nop>', {})

-- Clipboard
map('n', '<C-c>', "+y", {})
map('n', '<leader>p', '"+p', {})
map('n', '<leader>P', '"+P', {})
