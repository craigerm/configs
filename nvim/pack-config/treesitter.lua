local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

local map = vim.api.nvim_set_keymap

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "bash",
    "css",
    "elixir",
    "html",
    "javascript",
    "json",
    "lua",
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
