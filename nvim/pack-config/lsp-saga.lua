local saga = require('lspsaga')
local map = vim.api.nvim_set_keymap

saga.setup({
  lightbulb = {
    virtual_text = false
  }
})

-- Diagnostic symbols in gutter
-- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
local signs = { Error = "", Warn = "", Hint = "󰠠 ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local opts = { silent = true }

-- Finder/Hover info
map('n', '<leader>h', '<cmd>Lspsaga lsp_finder<CR>', opts)
map('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts)
map('n', '<leader>g', '<cmd>Lspsaga goto_definition<CR>', opts)
map('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
map('n', 'gt', '<cmd>Lspsaga goto_type_definition<CR>', opts)

-- Code actions
map('', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
map('n', '<F2>', '<cmd>Lspsaga rename<CR>', opts)

-- Diagnostics
map('n', '<leader>cf', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
map('n', '<leader>cd', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
map('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
map('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)

-- Outline LSoutline is deprecated but new versions are not working correctly
map('n', '<leader>o', '<cmd>Lspsaga outline<cr>', opts)

-- Experiments
