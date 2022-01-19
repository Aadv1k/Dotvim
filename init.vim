set nu
set smartindent
set autoindent

set tabstop=2 softtabstop=2 
set shiftwidth=2
set textwidth=79
set expandtab
set nowrap

set nohlsearch
set incsearch

set splitright
set mouse=a

set undofile
set undodir=~/.config/nvim/undodir
set undolevels=10000
set history=10000
set nobackup
set noswapfile
set nowritebackup

set formatoptions-=cro
let mapleader=" "

autocmd Bufread *.py,*.rb,*.lua call SetFourTab()
function! SetFourTab()
  set shiftwidth=4
  set tabstop=4 
  set expandtab
  set softtabstop=4
  set shiftround 
endfunction

tmap <Esc> <c-\><c-n>

nmap Y y$
nmap n nzzzv
nmap N Nzzzv

vmap > >gv
vmap < <gv

vmap <A-j> :m .+1<CR>==gv
vmap <A-k> :m .-2<CR>==gv


nmap <C-Left> :vertical res +2<cr>
nmap <C-Right> :vertical res -2<cr>
nmap <C-Up> :res +2<cr>
nmap <C-Down> :res -2<cr>

cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Q q
cnoreabbrev so so %
