local cmp = require("cmp")
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local lspkind = require("lspkind")
local defaults = require("cmp.config.default")()

local twt = require("tailwind-tools.cmp")
local format_kinds = lspkind.cmp_format({
  mode = "symbol",
  max_width = 50,
  before = twt.lspkind_format,
})

lspkind.init({
  symbol_map = {
    Supermaven = "",
  },
})

vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
vim.api.nvim_set_hl(0, "CmpItemKindSupermaven", { fg = "#6CC644" })

cmp.setup({
  completion = {
    completeopt = "menu,menuone,noinsert",
  },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),

    -- Accept currently selected item. Set `select` to `false`
    -- to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<S-CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),

    -- Accept currently selected item. Set `select` to `false` to only
    -- confirm explicitly selected items.
    ["<C-CR>"] = function(fallback)
      cmp.abort()
      fallback()
    end,
  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "supermaven" },
    { name = "luasnip" },
    { name = "path" },
  }, {
    { name = "buffer" },
  }),

  formatting = {
    format = format_kinds,
  },

  sorting = defaults.sorting,
})
