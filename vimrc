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
syntax on
set number
set nowrap

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
