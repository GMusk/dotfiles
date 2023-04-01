return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'nvim-treesitter/playground'

  use 'neovim/nvim-lspconfig'

  -- lsp plug in
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'

  -- completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
    },
    config = [[require('config.cmp')]]
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  use 'lervag/vimtex'

  use 'christoomey/vim-tmux-navigator'

  use 'navarasu/onedark.nvim'
end)
