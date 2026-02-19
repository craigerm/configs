require("mason").setup()

require("mason-lspconfig").setup({
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
    "ts_ls",
    "yamlls",
  },
})
