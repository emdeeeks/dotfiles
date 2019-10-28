call plug#begin()
Plug 'scrooloose/nerdcommenter'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'sgur/vim-editorconfig'
Plug 'kana/vim-fakeclip'
"Plug 'jooize/vim-colemak'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'wakatime/vim-wakatime'
"Plug 'vim-hardtime'

" PHP Plugins
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
Plug 'SirVer/ultisnips'
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

" Hide status
set laststatus=0

" Basics.
set number
set list listchars=tab:▸\ ,eol:¬,trail:·
set hlsearch
set backspace=indent,eol,start

" Handle tabs.
set tabstop=4
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

" I love undoing things"
set undofile
set undodir=~/.config/nvim/undo
set directory=~/.config/nvim/undo

" Jump to the same line I was on before
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

autocmd FileType c,cpp,java,scala let b:comment_leader = '//'
autocmd FileType sh,ruby,python   let b:comment_leader = '#'
autocmd FileType conf,fstab       let b:comment_leader = '#'
autocmd FileType tex              let b:comment_leader = '%'
autocmd FileType mail             let b:comment_leader = '>'
autocmd FileType vim              let b:comment_leader = '"'
autocmd FileType lua              let b:comment_leader = '--'
function! CommentToggle()
    execute ':silent! s/\([^ ]\)/' . b:comment_leader . ' \1/'
    execute ':silent! s/^\( *\)' . b:comment_leader . ' \?' . b:comment_leader . ' \?/\1/'
endfunction
map <F7> :call CommentToggle()<CR>

" Allow indenting muliple times and keeping selection
vnoremap < <gv
vnoremap > >gv

vmap <C-c> :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!xclip -selection c<CR>u
map <Insert> :set paste<CR>i<CR><CR><Esc>k:.!xclip -o<CR>JxkJx:set nopaste<CR>

let g:pdv_template_dir = $HOME ."/.config/nvim/plugged/pdv/templates_snip"
nnoremap <buffer> <C-d> :call pdv#DocumentWithSnip()<CR>
