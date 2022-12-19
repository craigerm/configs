local map = vim.api.nvim_set_keymap

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = false,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
    icons = {
      git_placement = "after",
    },
  },
  git = {
    ignore = false
  }
})

-- Mappings
map('n', '<c-n>', ':NvimTreeToggle<cr>', {})
map('n', '<leader>r', ':NvimTreeFindFile<cr>', {})
