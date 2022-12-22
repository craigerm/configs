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
require('whitespace')

-- Plugin config specific
require('pack-config/autopairs')
require('pack-config/zen-mode')
require('pack-config/nvim-comment')
require('pack-config/nvim-tree')
require('pack-config/fzf')
require('pack-config/prettier')
require('pack-config/surround')
require('pack-config/dracula')
require('pack-config/mason')
require('pack-config/lsp')
require('pack-config/nvm-cmp')
require('pack-config/treesitter')
require('pack-config/lsp-saga')
require('pack-config/null-ls')
require('pack-config/lualine')

-- Set color scheme
vim.cmd([[colorscheme dracula]])

-- vim.cmd([[colorscheme tokyonight-moon]])
-- vim.cmd([[colorscheme nightfox]])
