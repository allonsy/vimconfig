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
set noesckeys
syntax on
set number
set nowrap
set hlsearch
set path+=**
set complete-=i
set complete-=t
set wildmenu
set diffopt=vertical
set backspace=indent,eol,start
set autoread
set shell=/usr/bin/zsh
set statusline=%<%f\ %m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2
" autocmd VimEnter * :call ProcessStartingDirectory()
command! Detach :call Detach()

" Mappings
let mapleader = " "
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <leader><leader> :noh<CR>

" NERDTree
let g:NERDTreeMapJumpNextSibling="<C-n>"
let g:NERDTreeMapJumpPrevSibling="<C-p>"
let g:NERDTreeMapOpenSplit="s"
let g:NERDTreeMapOpenVSplit="v"
let g:NERDTreeShowHidden=1

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

" Colors
colorscheme molokai

command! SyntaxCheck :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Vim diff
fun! DiffUpdate()
 if &diff
   diffupdate
 endif
endfun
autocmd InsertLeave * call DiffUpdate()
nmap gmc /\v^[<=>\|]{7}.*$<CR>

" LSP config
runtime lsp.vim
