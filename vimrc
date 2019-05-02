noremap <up> <nop>
inoremap <up> <nop>
vnoremap <up> <nop>
noremap <down> <nop>
inoremap <down> <nop>
inoremap <down> <nop>
noremap <left> <nop>
inoremap <left> <nop>
inoremap <left> <nop>
noremap <right> <nop>
inoremap <right> <nop>
inoremap <right> <nop>

" Basics
set nocompatible
syntax on
set number
set nowrap
set hlsearch
set path+=**
set wildmenu

" Mappings
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
nmap <C-n> :bn<CR>
nmap <C-p> :bp<CR>

" Indentation
set autoindent
set smartindent
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

filetype on
autocmd FileType make setlocal noexpandtab
autocmd FileType go setlocal noexpandtab
set hidden

let g:netrw_banner = 0
let g:netrw_liststyle = 3

" Comments
autocmd FileType sh setlocal commentstring=#\ %s
autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType rust setlocal commentstring=//\ %s

filetype plugin on
