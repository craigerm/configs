require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "eslint",
    "html",
    "jsonls",
    "cssls",
    -- "elixirls",
    -- "ruby_ls",
    -- "marksman",
    "prismals",
    "lua_ls",
    "tailwindcss",
    "theme_check",
    "tsserver",
    "yamlls",
  },
})
