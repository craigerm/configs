return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use("nvim-lua/plenary.nvim")

  -- File explorer
  use({
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    -- optional, updated every week. (see issue #1193)
    tag = "nightly",
  })

  -- Fuzzy finder
  use({
    "ibhagwan/fzf-lua",
    -- optional for icon support
    requires = { "nvim-tree/nvim-web-devicons" },
  })

  use({ "junegunn/fzf", run = "./install --bin" })

  -- Color themes
  use("EdenEast/nightfox.nvim")

  -- Status line
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  -- Misc Utils
  use("folke/zen-mode.nvim")
  use({ "kylechui/nvim-surround", tag = "*" })
  use("echasnovski/mini.surround")
  use("windwp/nvim-autopairs")
  use("echasnovski/mini.pairs")
  use("tpope/vim-fugitive")
  use({ "vuki656/package-info.nvim", requires = "MunifTanjim/nui.nvim" })

  -- Comments
  use("terrortylor/nvim-comment")

  -- Lua Snippets
  use({
    "L3MON4D3/LuaSnip",
    tag = "v2.*",
    requires = "rafamadriz/friendly-snippets",
    run = "make install_jsregexp",
  })

  -- Language server config
  use("neovim/nvim-lspconfig")

  -- Syntax highlighting
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({ "nvim-treesitter/playground", run = ":TSInstall query" })

  -- Highlight and remove trailing whitespace
  use("johnfrankmorgan/whitespace.nvim")

  -- Auto complete
  use("hrsh7th/nvim-cmp")
  use("onsails/lspkind-nvim") -- Pictograms
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("saadparwaiz1/cmp_luasnip")
  use("glepnir/lspsaga.nvim") -- Nicer UIs

  -- Formatting, linting, etc.
  use("stevearc/conform.nvim")
  use("mfussenegger/nvim-lint")

  -- Manages lsp, etc.
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- Shows error diagnostics
  use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })

  use("gpanders/editorconfig.nvim")

  -- New color theme
  use("bluz71/vim-nightfly-colors")

  -- For CSS color highlighting, etc.
  use("norcalli/nvim-colorizer.lua")

  use("roobert/tailwindcss-colorizer-cmp.nvim")
end)
