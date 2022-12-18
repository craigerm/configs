-- Leader
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- Disable default file explorer (recommended by nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--  Imports
require('vars')
require('opts')
require('keys')
require('plug')

-- Plugin config specific
require('config-nvim-tree')
require('config-fzf-lua')

-- Show trailing whitespace
vim.cmd([[highlight ExtraWhitespace ctermbg=red guibg=red]])
vim.cmd([[match ExtraWhitespace /\s\+\%#\@<!$/]])

vim.api.nvim_create_autocmd({ 'InsertEnter '}, {

  pattern = { "*" },
  command = [[match ExtraWhitespace /\s\+\%#\@<!$/]]
})

vim.api.nvim_create_autocmd({ 'InsertLeave'}, {
  pattern = { "*" },
  command = [[match ExtraWhitespace /\s\+$/]]
})

--
--
-- Nice to have for later
-- nearest test runners (vim test)
-- snippets
-- code actions
