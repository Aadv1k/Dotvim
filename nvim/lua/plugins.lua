vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use { 'gruvbox-community/gruvbox'}
  use {'folke/tokyonight.nvim'}
  use {'neovim/nvim-lspconfig'}
  use 'tomasiser/vim-code-dark'

  use 'chriskempson/base16-vim'
  use 'junegunn/seoul256.vim'
  use 'jnurmine/Zenburn'

  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'

  -- todo install clang
  -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

end)

