local conform = require('conform')

conform.setup({
  format = {
    timeout_ms = 3000,
    async = false,
    quiet = false
  },

  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
  },

  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 2000
  }
  -- formatters = {
  --   injected = { options = { ignore_errors = false } },
  -- }
})

vim.keymap.set({ 'n', 'v' },
  '<leader>cF',
  function()
    return require('conform').format({ formatters = { 'injected' } })
  end,
  {}
)
