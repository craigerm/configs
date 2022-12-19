-- Leader
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- Disable default file explorer (recommended by nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set color scheme
-- vim.cmd[[colorscheme dracula]]

-- Imports
require('vars')
require('opts')
require('keys')
require('plug')
require('whitespace')

-- Plugin config specific
require('config-nvim-tree')
require('config-fzf-lua')

vim.cmd[[colorscheme dracula]]

-- Nice to have for later
-- nearest test runners (vim test)
-- snippets
-- code actions
