vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

local cmp = require('cmp')
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local lspkind = require 'lspkind'
local defaults = require("cmp.config.default")()

cmp.setup({
  completion = {
    completeopt = "menu,menuone,noinsert",
  },

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
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

  -- mapping = cmp.mapping.preset.insert({
  --   ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  --   ['<C-f>'] = cmp.mapping.scroll_docs(4),
  --   ['<C-Space>'] = cmp.mapping.complete(),
  --   ['<C-e>'] = cmp.mapping.close(),
  --   ['<CR>'] = cmp.mapping.confirm({
  --     -- behavior = cmp.ConfirmBehavior.Replace,
  --     select = true
  --   }),
  -- }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  }),

  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      max_width = 50
    })
  },

  sorting = defaults.sorting
})

-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

-- vim.cmd([[
--   set completeopt=menuone,noselect
--   highlight! default link CmpItemKind CmpItemMenuDefault
-- ]])