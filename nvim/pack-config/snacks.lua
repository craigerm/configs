local snacks = require("snacks")

local function set_snacks_hl()
  -- vim.api.nvim_set_hl(0, "MySnacksScope", { fg = 7503820 })
  -- vim.api.nvim_set_hl(0, "MySnacksScope", { fg = 7442377 })
  vim.api.nvim_set_hl(0, "MySnacksScope", { fg = 7376584 })
  -- vim.api.nvim_set_hl(0, "MySnacksScope", { fg = 980802 })
  -- vim.api.nvim_set_hl(0, "MySnacksScope", { fg = 8037606 })
end

-- apply now (in case colorscheme is already set)
set_snacks_hl()

-- re-apply whenever colorscheme changes / reloads
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_snacks_hl,
})

snacks.setup({
  input = {},
  picker = {},
  terminal = {},
  bigfile = {},
  scope = {},
  indent = {
    only_scope = true,
    -- only_indent = true,
    animate = {
      enabled = false,
    },
    scope = {
      hl = "MySnacksScope",
    },
    filter = function(buf, win)
      if vim.bo[buf].filetype == "markdown" then
        return false
      end
      return vim.g.snacks_indent ~= false
        and vim.b[buf].snacks_indent ~= false
        and vim.bo[buf].buftype == ""
    end,
  },
})
