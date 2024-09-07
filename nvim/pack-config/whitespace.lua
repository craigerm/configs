local ws = require("whitespace-nvim")

ws.setup({
  -- `highlight` configures which highlight is used to display
  -- trailing whitespace
  -- highlight = 'DiffDelete',
  -- highlight = 'ErrorMsg',
  highlight = "NvimInternalError",

  -- `ignored_filetypes` configures which filetypes to ignore when
  -- displaying trailing whitespace
  ignored_filetypes = {
    "TelescopePrompt",
    "Trouble",
    "lspinfo",
    "help",
    "fzf",
    "markdown",
    "trouble",
  },

  -- `ignore_terminal` configures whether to ignore terminal buffers
  ignore_terminal = true,
})
