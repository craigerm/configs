local opt = vim.opt

-- Clipboard
vim.opt.clipboard:append({ "unnamedplus" })

-- Context
opt.number = true
opt.relativenumber = true
opt.scrolloff = 0
opt.signcolumn = "yes"
opt.cursorline = true
opt.cursorlineopt = "screenline"

-- Encodings
opt.encoding = "utf8"
opt.fileencoding = "utf8"

-- Themes
opt.syntax = "ON"
opt.termguicolors = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false
opt.colorcolumn = "100"

-- Spaces
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.smartindent = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Virtual lines
opt.breakindent = true

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end
