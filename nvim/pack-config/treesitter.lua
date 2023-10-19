local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

local map = vim.api.nvim_set_keymap

ts.setup {
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
    -- Both markdown packages are needed by lspsaga+treesitter to work
    "markdown",
    "markdown_inline",
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
