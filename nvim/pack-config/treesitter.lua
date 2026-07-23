require("nvim-treesitter").install({
  "base",
  "css",
  "html",
  "javascript",
  "typescript",
  "tsx",
  "jsdoc",
  "json",
  "lua",
  "graphql",
  "markdown",
  "markdown_inline",
  "scss",
  "toml",
  "yaml",
  "elixir",
  "heex",
  "eex"
})

-- Mappings (this needs migrated to latest treesitter version if possible)
-- vim.api.nvim_set_keymap("n", "<F10>", ":TSHighlightCapturesUnderCursor<cr>", {})
