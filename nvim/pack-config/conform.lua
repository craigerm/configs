local conform = require("conform")
local util = require("conform.util")

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
    markdown = { pbin },
    -- Liquid formatter doesn't seem to work with prettierd
    liquid = { "prettier" },
    -- liquid = { pbin },
    css = { pbin },
    html = { pbin },
    json = { pbin },
    jsonc = { pbin },
    yaml = { pbin },
    scss = { pbin },
    graphql = { pbin },
    -- elixir = { "mix" },
  },

  -- log_level = vim.log.levels.DEBUG,
  format_on_save = {
    lsp_fallback = false,
    async = false,
    timeout_ms = 2000,
  },
})

vim.keymap.set({ "n", "v" }, "<leader>cF", function()
  return require("conform").format({ formatters = { "injected" } })
end, {})
