local trouble = require("trouble")
local map = vim.api.nvim_set_keymap

trouble.setup({})

local opts = { noremap = true, silent = true }

-- Mappings
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", opts)
map("n", "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", opts)
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
map("n", "<leader>xd", "<cmd>Trouble symbols toggle focus=true<cr>", opts)
map(
  "n",
  "<leader>xr",
  "<cmd>Trouble lsp_references toggle focus=true<cr>",
  opts
)
