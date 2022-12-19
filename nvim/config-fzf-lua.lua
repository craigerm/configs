local actions = require "fzf-lua.actions"
local map = vim.api.nvim_set_keymap

require'fzf-lua'.setup {
  winopts = {
    fullscreen = true
  },
  -- This appears to override eveything
  actions = {
    files = {
      ["default"] = actions.file_edit,
      ["ctrl-f"] = actions.file_edit
    }
  }
}

-- We use a different binary for the search
map('n',
  '<leader>d',
  "<cmd>lua require('fzf-lua').files({ cmd = vim.env.FZF_DEFAULT_COMMAND })<CR>",
  { noremap = true, silent = true}
)

map('n', '<leader>s', "<cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true, silent = true})
map('n', '<leader>e', "<cmd>lua require('fzf-lua').blines()<CR>", { noremap = true, silent = true})
map('n', '<leader>f', "<cmd>lua require('fzf-lua').lines()<CR>", { noremap = true, silent = true})
