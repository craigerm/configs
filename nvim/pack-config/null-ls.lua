local null_ls = require("null-ls")

local sources = {
  null_ls.builtins.formatting.prettierd,
  null_ls.builtins.diagnostics.ts,
}

null_ls.setup({
  sources =  sources,
})
