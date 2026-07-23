local elixir = require("elixir")
local elixirls = require("elixir.elixirls")

elixir.setup({
  -- nextls = { enable = true },
  credo = {},
  elixirls = {
    enable = true,
    settings = elixirls.settings({
      dialyzerEnabled = false,
      enableTestLenses = false,
    }),
    on_attach = function(client, bufnr)
      vim.keymap.set(
        "n",
        "<space>fp",
        ":ElixirFromPipe<cr>",
        { buffer = true, noremap = true }
      )
      vim.keymap.set(
        "n",
        "<space>tp",
        ":ElixirToPipe<cr>",
        { buffer = true, noremap = true }
      )
      vim.keymap.set(
        "v",
        "<space>em",
        ":ElixirExpandMacro<cr>",
        { buffer = true, noremap = true }
      )
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end,
  },
})
