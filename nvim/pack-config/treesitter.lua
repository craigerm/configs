local ts = require("nvim-treesitter.configs")
local map = vim.api.nvim_set_keymap

ts.setup({
  highlight = { enable = true },
  indent = { enable = true },
  ensure_installed = {
    "bash",
    "css",
    "elixir",
    "html",
    "javascript",
    "json",
    "lua",
    "graphql",
    "heex",
    "eex",
    "erlang",
    "surface",
    -- Both markdown packages are needed by lspsaga+treesitter to work
    "markdown",
    "markdown_inline",
    "jsdoc",
    "prisma",
    "scss",
    "toml",
    "tsx",
    "yaml",
  },
  autoinstall = true,
  autotag = {
    enable = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

-- Mappings
map('n', '<F10>', ':TSHighlightCapturesUnderCursor<cr>', {})
