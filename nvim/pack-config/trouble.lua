local trouble = require("trouble")
local map = vim.api.nvim_set_keymap


trouble.setup({})

local opts = { noremap = true, silent = true }

-- Mappings
map('n', '<leader>xx', '<cmd>TroubleToggle<cr>', opts)
map('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', opts)
map('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', opts)
map('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', opts)
map('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', opts)
map('n', '<leader>xr', '<cmd>TroubleToggle lsp_references<cr>', opts)
