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
require('config-nvim-tree')
require('config-fzf-lua')

-- Set color scheme
-- vim.cmd([[colorscheme dracula]])
vim.cmd([[colorscheme nightfox]])
