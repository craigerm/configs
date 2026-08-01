require("mason").setup()

require("mason-lspconfig").setup({
  automatic_enable = {
    exclude = { "ts_ls" },
  },
  ensure_installed = {
    "bashls",
    "eslint",
    "html",
    "jsonls",
    "cssls",
    "graphql",
    -- "elixirls",
    "prismals",
    "lua_ls",
    "tailwindcss",
    "shopify_theme_ls",
    -- "theme_check",
    "yamlls",
  },
})
