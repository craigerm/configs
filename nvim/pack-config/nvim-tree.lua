local map = vim.api.nvim_set_keymap

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = false,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "o", action = "edit_no_picker" },
        { key = "O", action = "edit" },
        { key = "i", action = "split" }
      },
    },
  },
  renderer = {
    group_empty = true,
    icons = {
      git_placement = "after",
      glyphs = {
        git = {
          staged = '●',
          unstaged = '●',
          untracked = '●',
          ignored = '●',
        }
      }
    },
  },
  git = {
    ignore = false
  }
})

-- Mappings
map('n', '<c-n>', ':NvimTreeToggle<cr>', {})
map('n', '<leader>r', ':NvimTreeFindFile<cr>', {})
