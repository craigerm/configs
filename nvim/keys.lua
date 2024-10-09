local map = vim.api.nvim_set_keymap

-- Easier window navigation
map("n", "<C-h>", "<C-w>h", { noremap = true })
map("n", "<C-j>", "<C-w>j", { noremap = true })
map("n", "<C-k>", "<C-w>k", { noremap = true })
map("n", "<C-l>", "<C-w>l", { noremap = true })

-- Allow moving text "chunks"
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

-- Ctrl+S for saving
map("i", "<C-s>", "<esc>:w<cr>a", {})
map("n", "<C-s>", ":w<cr>", {})

-- Unmap this one
map("n", "Q", "<nop>", {})

-- Clipboard
map("n", "<C-c>", "+y", {})
map("n", "<leader>p", '"+p', {})
map("n", "<leader>P", '"+P', {})

-- Register stuff
map("v", "<leader>p", '"_dP', {})

-- In terminal mode CTRL-O to normal mode so you can scroll, etc (usefull for vim.test)
map("t", "<C-o>", "<C-\\><C-n>", { noremap = true, silent = true })
