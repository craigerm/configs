local  prettier = require("prettier")

prettier.setup {
  bin = 'prettierd',
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "astro",
    -- "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  }
}
