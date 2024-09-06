local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<leader>t", "<cmd>TestNearest<CR>", opts)
map("n", "<leader>T", "<cmd>TestFile<CR>", opts)
map("n", "<leader>a", "<cmd>TestSuite<CR>", opts)
map("n", "<leader>l", "<cmd>TestLast<CR>", opts)
-- map("n", "<leader>g", "<cmd>TestVisit<CR>", opts)
map("n", "<leader>a", "<cmd>TestLast<CR>", opts)
