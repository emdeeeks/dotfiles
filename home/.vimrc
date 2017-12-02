" pathogen init
execute pathogen#infect()

" colorscheme
colorscheme noctu

" So much better than \.
let mapleader = ","

" Basics.
set undofile
set undodir=~/.vim/undo
set relativenumber
set number
set list listchars=tab:▸\ ,eol:¬,trail:·
set hlsearch
set backspace=indent,eol,start

" Handle tabs.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Disable movement with arrow keus.
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
noremap! <left>  <nop>
noremap! <right> <nop>
noremap! <up>    <nop>
noremap! <down>  <nop>

" Keep search matches in the middle of the window.
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

map <tab> %

" PDV settings
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-d> :call pdv#DocumentWithSnip()<CR>

" Necessary for multiple encodings
set encoding=utf-8

" Enable spellchecking
au BufReadPre *.md set spell spelllang=en_us
au BufReadPre *.ctp set spell spelllang=en_us
