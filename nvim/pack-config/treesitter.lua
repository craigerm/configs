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
  "liquid",
  "scss",
  "toml",
  "yaml",
  "elixir",
  "heex",
  "eex",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "liquid",
  callback = function(event)
    vim.treesitter.start(event.buf)
  end,
})
-- Mappings (this needs migrated to latest treesitter version if possible)
-- vim.api.nvim_set_keymap("n", "<F10>", ":TSHighlightCapturesUnderCursor<cr>", {})
