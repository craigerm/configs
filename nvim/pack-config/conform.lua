local conform = require("conform")

local pbin = "prettierd"

conform.setup({
  format = {
    timeout_ms = 3000,
    async = false,
    quiet = false,
  },

  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { pbin },
    typescript = { pbin },
    javascriptreact = { pbin },
    typescriptreact = { pbin },
    css = { pbin },
    html = { pbin },
    json = { pbin },
    yaml = { pbin },
    scss = { pbin },
    graphql = { pbin },
  },

  -- log_level = vim.log.levels.DEBUG,
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 2000,
  },
})

vim.keymap.set({ "n", "v" }, "<leader>cF", function()
  return require("conform").format({ formatters = { "injected" } })
end, {})
