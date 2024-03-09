-- Leader
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- Disable default file explorer (recommended by nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Imports
require('vars')
require('opts')
require('keys')
require('pack')
require('cmds')

-- Plugin config specific
require('pack-config/autopairs')
require('pack-config/zen-mode')
require('pack-config/nvim-comment')
require('pack-config/nvim-tree')
require('pack-config/fzf')
require('pack-config/surround')
require('pack-config/mini-surround')
require('pack-config/mason')
require('pack-config/lsp')
require('pack-config/treesitter')
require('pack-config/lsp-saga')
require('pack-config/conform')
require('pack-config/nvim-lint')
require('pack-config/lualine')
require('pack-config/trouble')
require('pack-config/luasnip')
require('pack-config/mini-pairs')
require('pack-config/whitespace')
require('pack-config/nvim-colorizer')
require('pack-config/tailwindcss-colorizer-cmp')
require('pack-config/aerial')

-- Add the complete last
require('pack-config/nvim-cmp')

-- Set color scheme
vim.cmd([[colorscheme nightfly]])
