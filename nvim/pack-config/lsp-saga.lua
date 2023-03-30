local saga = require('lspsaga')
local map = vim.api.nvim_set_keymap

saga.setup({})

-- saga.init_lsp_saga {
--   server_filetype_map = {
--     typescript = 'typescript'
--   }
-- }

local opts = { silent = true }

map('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', opts)
map('n', '<leader>g', '<cmd>Lspsaga lsp_finder<CR>', opts)

map('', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
map('n', '<F2>', '<cmd>Lspsaga rename<CR>', opts)
map('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts)

map('n', '<leader>cf', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
map('n', '<leader>cd', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
map('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
map('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)

-- Outline LSoutline is deprecated but new versions are not working correctly
map('n', '<leader>o', '<cmd>Lspsaga outline<cr>', opts)
-- map('n', '<leader>o', '<cmd>LSoutlineToggle<cr>', opts)

-- Hover doc
map('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
