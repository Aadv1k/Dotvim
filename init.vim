set nu
set relativenumber

set expandtab
set smartindent
set tabstop=2 softtabstop=2
set nowrap

set ignorecase
set smartcase
set nohlsearch
set incsearch

set novisualbell
set noerrorbells

set scrolloff=4
set cmdheight=1

set hidden
set noswapfile
set nobackup
set exrc
set mouse=nv
set updatetime=50


call plug#begin('~/AppData/Local/nvim/autoload/plugged')

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'preservim/nerdtree'

  Plug 'chriskempson/base16-vim'
  Plug 'gruvbox-community/gruvbox'
  Plug 'sheerun/vim-polyglot'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'sbdchd/neoformat'

call plug#end()


let g:neoformat_enabled_python = ['autopep8', 'yapf', 'docformatter']
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1

color gruvbox
set termguicolors
hi Normal guibg=NONE ctermbg=NONE
syntax on

set shell=cmd

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

autocmd BufWritePre *.* %s/\s\+$//e

cnoreabbrev W! w!
cnoreabbrev Q q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev nt :NERDTree

command! FixWhitespace :%s/\s\+$//e
tnoremap <Esc> <C-\><C-n>

noremap T :tabnew<CR>
noremap <Tab> :tabNext<CR>

noremap = :vertical res +5<CR>
noremap - :vertical res -5<CR>

noremap <C-p> :FZF<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
