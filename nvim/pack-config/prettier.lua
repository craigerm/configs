local prettier = require("prettier")

prettier.setup({
  bin = "prettierd",
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "astro",
    "liquid",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})
