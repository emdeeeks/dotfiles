call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
call plug#end()

" Needed for a few things"
syntax on

" colorscheme
colorscheme noctu

" So much better than \.
let mapleader = ","

"Change cursor for different modes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Hide command
set noshowcmd

" Hide mode
set noshowmode

" Hide ruler
set noruler

" Basics.
set undofile
set undodir=~/.vim/undo
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

" Necessary for multiple encodings
set encoding=utf-8

" Enable spellchecking
au BufReadPre *.md set spell spelllang=en_us
au BufReadPre *.ctp set spell spelllang=en_us

" Set x clipboard if available
set clipboard=unnamed
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" Disable annoying as fuck visual bell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Reload .Xresources if it was edited
augroup Xresources
    autocmd!
    au BufWritePost ~/.Xresources silent !xrdb -merge ~/.Xresources
augroup END
