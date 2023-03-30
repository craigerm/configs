require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "eslint",
    "html",
    "jsonls",
    -- "marksman",
    "prismals",
    "lua_ls",
    "theme_check",
    "tsserver",
    "yamlls"
  }
})
