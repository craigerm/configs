require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "eslint",
    "html",
    "jsonls",
    "cssls",
    -- "elixirls",
    "prismals",
    "lua_ls",
    "tailwindcss",
    "theme_check",
    "ts_ls",
    "yamlls",
  },
})
