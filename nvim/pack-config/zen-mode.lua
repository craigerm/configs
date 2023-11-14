local zen = require("zen-mode")

local map = vim.api.nvim_set_keymap
map('n', '<F9>', ':ZenMode<cr>', {})

zen.setup({
  window = {
    options = {
      -- Enable whitespace characters
      list = true
    }
  }
})
