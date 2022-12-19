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
