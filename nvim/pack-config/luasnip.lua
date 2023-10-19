local ls = require('luasnip')

require('luasnip.loaders.from_vscode').load()

ls.setup({
  history = true,
  delete_check_events = 'TextChanged'
})

vim.keymap.set('i',
  '<tab>',
  function()
    return require('luasnip').jumpable(1) and '<Plug>luasnip-jump-next' or '<tab>'
  end,
  { silent = true }
)

vim.keymap.set('s', '<tab>', function() return require('luasnip').jump(1) end, {})
vim.keymap.set({'i', 's'}, '<s-tab>', function() return require('luasnip').jump(-1) end, {})
