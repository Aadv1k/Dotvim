vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'gruvbox-community/gruvbox'

    use 'navarasu/onedark.nvim'

    use 'preservim/nerdtree'
    use 'sbdchd/neoformat'
    use 'tpope/vim-fugitive'
    use 'mattn/emmet-vim'

    use {
        'nvim-treesitter/nvim-treesitter', 
        run = ':TSUpdate'
    }
    use 'neovim/nvim-lspconfig'
    use 'mfussenegger/nvim-lint'
    use 'godlygeek/tabular'
    use 'plasticboy/vim-markdown'

		
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

 end)
