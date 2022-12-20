require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "eslint",
    "html",
    "jsonls",
    "marksman",
    "prismals",
    "sumneko_lua",
    "theme_check",
    "tsserver",
    "yamlls"
  }
})
