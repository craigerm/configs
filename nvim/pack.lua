return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- File explorer
  use { 'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    -- optional, updated every week. (see issue #1193)
    tag = 'nightly'
  }

  -- Fuzzy finder
  use { 'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use { 'junegunn/fzf', run = './install --bin' }

  -- Color themes
  use '~/.vim/pack/themes/opt/dracula_pro' -- Purchased
  use 'EdenEast/nightfox.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'folke/tokyonight.nvim'

 -- Status line
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Misc Utils
  use 'folke/zen-mode.nvim'
  use { 'kylechui/nvim-surround', tag = '*' }
  use 'windwp/nvim-autopairs'
  use 'tpope/vim-fugitive'

  -- Markdown preview
  -- use { 'iamcco/markdown-preview.nvim',
  --   run = 'cd app && npm install',
  --   setup = function() vim.g.mkdp_filetypes = { 'markdown' } end,
  --   ft = { 'markdown' }
  -- }

  -- Comments
  use 'terrortylor/nvim-comment'

  -- Lua Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Language server config
  use 'neovim/nvim-lspconfig'

  -- Syntax highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/playground', run = ':TSInstall query' }

  -- Auto complete
  use 'onsails/lspkind-nvim' -- Pictograms
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'glepnir/lspsaga.nvim' -- Nicer UIs

  -- Formatting, etc.
  use 'nvim-lua/plenary.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'

  -- Manages lsp, etc.
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- Shows error diagnostics
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }

  use 'gpanders/editorconfig.nvim'
end)
