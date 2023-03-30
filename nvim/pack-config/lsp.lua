local nvim_lsp = require("lspconfig")
local windows = require('lspconfig.ui.windows')

local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

windows.default_options.border = 'single'

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
  })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    buffer = bufnr,
    callback = function()
      lsp_formatting(bufnr)
    end,
  })
end

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- YAML
nvim_lsp.yamlls.setup {
  on_attach = on_attach
}

-- JSON
nvim_lsp.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    json = {
      provideFormatter = false,
      schemas = {
        {
          description = "Node NPM packages file",
          fileMatch = { 'package.json' },
          url = 'https://json.schemastore.org/package.json'
        },
        {
          description = 'TypeScript compiler configuration file',
          fileMatch = {'tsconfig.json', 'tsconfig.*.json'},
          url = 'http://json.schemastore.org/tsconfig'
        },
        {
          description = 'Babel configuration',
          fileMatch = {'.babelrc.json', '.babelrc', 'babel.config.json'},
          url = 'http://json.schemastore.org/lerna'
        },
        {
          description = 'ESLint config',
          fileMatch = {'.eslintrc.json', '.eslintrc'},
          url = 'http://json.schemastore.org/eslintrc'
        },
        {
          description = 'Prettier config',
          fileMatch = {'.prettierrc', '.prettierrc.json', 'prettier.config.json'},
          url = 'http://json.schemastore.org/prettierrc'
        },
      }
    }
  }
}

-- CSS
nvim_lsp.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- CSS
nvim_lsp.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Lua
nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT'
      },
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false
      }
    }
  }
}

-- Shopify (Theme Check)
nvim_lsp.theme_check.setup { on_attach = on_attach }

-- Code navigation
map('n', '<space>t', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
map('n', '<space>D', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
map('n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)

-- Diagnostics
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<cr>', opts)
