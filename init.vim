""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" File: init.vim
"" Source: https://github.com/Aadv1k/Dotvim/blob/7abf2c2204313bf4ec8417f3bee06416fc1ac741/init.vim
"" Author: Aadvik<aadv1k@outlook.com>
"" Licence: GNU Public Licence
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
set nu
set guicursor=
set smartindent autoindent
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4
set hidden
set noerrorbells
set nowrap

set incsearch
set nohlsearch
set smartcase
set ignorecase

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set textwidth=79
set scrolloff=8
set splitright
set cursorline
set formatoptions-=cro
set encoding=utf-8

let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=2
let g:netrw_winsize=80

"""""""""""""""""""""""
"""""""""""""""""""""""
""""""""Plugins""""""""
"""""""""""""""""""""""
"""""""""""""""""""""""


" Install
 " if !exists(':PlugInstall')
     " silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
         " \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 " endif

call plug#begin('~/.vim/plugged')
    Plug 'gruvbox-community/gruvbox'
    Plug 'sainnhe/gruvbox-material'

    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'mattn/emmet-vim'
    Plug 'preservim/nerdtree'
call plug#end()

let g:gruvbox_material_background = 'hard'
set background=dark
color gruvbox

let mapleader=" "

lua << EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>d', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '<space>N', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<space>n', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

end

local servers = { 'pyright', 'cssls', 'tsserver', 'clangd', 'jsonls'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

""""""""""""""""""""""""
""""""""""""""""""""""""
""""""""Autocmds""""""""
""""""""""""""""""""""""
""""""""""""""""""""""""

augroup htmlMode
    autocmd!
    autocmd BufRead,BufReadPost *.js,*.md,*.css,*.html,*.scss,*.json nmap <silent> <Leader>fmt :silent exec '!prettier --write %'<CR>:e<CR>
    "" Inefficient, but hey it works.
    autocmd FileType html nmap <CR> <c-y>,
augroup END

augroup pyMode
    autocmd!
    autocmd FileType python nnoremap <silent> <Leader>fmt :silent exec ':!python3 -m autopep8 --in-place --aggressive %'<CR>:e<CR>
    autocmd FileType python nnoremap <Leader>py :!python3 %<cr>
augroup END

augroup cppMode
    autocmd!
    autocmd FileType c nmap <silent> <Leader>cc :execute '!gcc % -o ' . expand('%:r') . ' && ./' . expand('%:r') <CR>
    autocmd FileType cpp nmap <silent> <Leader>cc :execute '!g++ % -o' . expand('%:r') . ' && ./' . expand('%:r') <CR>
augroup END

augroup luaMode 
    autocmd!
    autocmd FileType lua nnoremap <Leader>lua :!lua %<cr>
augroup END

"""""""""""""""""""""""
"""""""""""""""""""""""
""""""""Keymaps""""""""
"""""""""""""""""""""""
"""""""""""""""""""""""

let mapleader=" "
tmap <Esc> <C-\><C-n>
tmap <C-v> <C-W>"+

nmap <silent> <S-l> :tabn<CR>
nmap <silent> <S-h> :tabp<CR>

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ( (<c-g>u

nmap <C-Right> :vertical res +2 <CR>
nmap <C-Left> :vertical res -2 <CR>

nnoremap J mzJ`z
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap Y y$
vnoremap > >gv
vnoremap > >gv

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Q q
cnoreabbrev so so %
