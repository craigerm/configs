return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    -- optional, updated every week. (see issue #1193)
    tag = 'nightly'
  }

  use { 'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use { 'junegunn/fzf', run = './install --bin' }

  -- Purchased theme
  use '~/.vim/pack/themes/opt/dracula_pro'

  -- Color themes
  use "EdenEast/nightfox.nvim"
  use 'Mofiqul/dracula.nvim'
end)

