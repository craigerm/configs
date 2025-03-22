local actions = require("fzf-lua.actions")
local map = vim.api.nvim_set_keymap

require("fzf-lua").setup({
  winopts = {
    fullscreen = false,
    width = 1.0,
    height = 0.5,
    preview = {
      horizontal = "right:45%",
      delay = 300,
    },
  },
  grep = {
    cmd = "ag",
  },
  keymap = {
    fzf = {
      -- fzf '--bind=' options
      ["ctrl-z"] = "abort",
      [","] = "abort",
      ["ctrl-u"] = "unix-line-discard",
      ["ctrl-f"] = "half-page-down",
      ["ctrl-b"] = "half-page-up",
      ["ctrl-a"] = "beginning-of-line",
      ["ctrl-e"] = "end-of-line",
      ["alt-a"] = "toggle-all",

      -- Only valid with fzf previewers (bat/cat/git/etc)
      ["f3"] = "toggle-preview-wrap",
      ["f4"] = "toggle-preview",
      ["shift-down"] = "preview-page-down",
      ["shift-up"] = "preview-page-up",
    },
  },
  actions = {
    files = {
      ["default"] = actions.file_edit_or_qf,
      ["ctrl-a"] = actions.file_edit_or_qf,
      ["ctrl-s"] = actions.file_split,
      ["ctrl-v"] = actions.file_vsplit,
    },
    buffers = {
      ["default"] = actions.buf_edit,
      ["ctrl-a"] = actions.buf_edit,
      ["ctrl-s"] = actions.buf_split,
      ["ctrl-v"] = actions.buf_vsplit,
    },
  },
})

local opts = { noremap = true, silent = true }

map(
  "n",
  "<leader>d",
  "<cmd>lua require('fzf-lua').files({ cmd = vim.env.FZF_DEFAULT_COMMAND })<CR>",
  opts
)

map("n", "<leader>p", "<cmd>lua require('fzf-lua').live_grep()<CR>", opts)
map("n", "<leader>s", "<cmd>lua require('fzf-lua').buffers()<CR>", opts)
map("n", "<leader>e", "<cmd>lua require('fzf-lua').blines()<CR>", opts)
map("n", "<leader>f", "<cmd>lua require('fzf-lua').lines()<CR>", opts)
map("n", "<F12>", "<cmd>lua require('fzf-lua').highlights()<CR>", opts)

map(
  "n",
  "<F4>",
  "<cmd>lua require('fzf-lua').live_grep({ cmd = 'git grep --line-number --column --color=always' })<CR>",
  opts
)
