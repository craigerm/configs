require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "tsserver",
    "sumneko_lua",
    "cssls",
    "eslint",
    "html",
    "jsonls",
    "marksman",
    "prismals",
    "theme_check",
    "yamlls"
  }
})
