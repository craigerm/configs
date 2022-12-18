-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- Options
--nvim-tree.view.width*
--*nvim-tree.view.width 30 or '50%'
--*nvim-tree.view.preserve_window_proportions*
--   *nvim-tree.view.number*
-- *nvim-tree.view.relativenumber*
-- *nvim-tree.view.float.enable*


-- Mappings
local map = vim.api.nvim_set_keymap

map('n', '<c-n>', ':NvimTreeToggle<cr>', {})
map('n', '<leader>r', ':NvimTreeFindFile<cr>', {})
-- NvimTreeFocus
-- map('n', '<leader>r', ':NvimTreeCollapse<cr>', {})
