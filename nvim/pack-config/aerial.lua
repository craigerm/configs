require('aerial').setup({
  default_direction = 'right'
})

local map = vim.api.nvim_set_keymap

map('n', '<F8>', ':AerialToggle<cr>', {})
