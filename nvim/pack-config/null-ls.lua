local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.prettierd,
}

null_ls.setup({
  sources =  sources,
})
