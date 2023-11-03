local ws = require("whitespace-nvim")

ws.setup({
  -- `highlight` configures which highlight is used to display
  -- trailing whitespace
  -- highlight = 'DiffDelete',
  -- highlight = 'ErrorMsg',
  highlight = 'NvimInternalError',

  -- `ignored_filetypes` configures which filetypes to ignore when
  -- displaying trailing whitespace
  ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help' },

  -- `ignore_terminal` configures whether to ignore terminal buffers
  ignore_terminal = true,
})

-- remove trailing whitespace with a keybinding
-- vim.keymap.set('n', '<Leader>t', require('whitespace-nvim').trim)
