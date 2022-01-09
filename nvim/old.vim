set nu
set smartindent
set autoindent
set tabstop=2 softtabstop=2
set shiftwidth=2
set textwidth=79
set expandtab

set nohlsearch
set incsearch

autocmd BufRead *.md,*.rst,*.txt, call SetWritingMode()
function! SetWritingMode()
  set nonu
  set spelllang=en_in
  set spell!
  nmap K 1z=
endfunction

autocmd Bufread *.py,*.rb,*.lua call SetFourTab()
function! SetFourTab()
  set shiftwidth=4
  set tabstop=4 
  set expandtab
  set softtabstop=4
  set shiftround 
endfunction


set nocp
filetype plugin on

tmap <Esc> <c-\><c-n>

nmap Y y$
nmap n nzzzv
nmap N Nzzzv

vmap > >gv
vmap < <gv

cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Q q
