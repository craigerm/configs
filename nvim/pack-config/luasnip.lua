local ls = require('luasnip')

-- require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets/typescript" } }
require("luasnip.loaders.from_snipmate").lazy_load()

ls.filetype_extend("all", { "_" })
