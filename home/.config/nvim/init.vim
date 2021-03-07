" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()
    " Easily move code up/down preserving indentation
    " https://github.com/matze/vim-move
    "<A-k>   Move current line/selection up
    "<A-j>   Move current line/selection down
    "<A-h>   Move current character/selection left
    "<A-l>   Move current character/selection right
    Plug 'matze/vim-move'

    " Multi-cursors
    " https://github.com/mg979/vim-visual-multi
    Plug 'mg979/vim-visual-multi'

    " Set root folder for project
    Plug 'airblade/vim-rooter'

    Plug 'voldikss/vim-floaterm'

    " Automatically deal with swap files
    Plug 'gioele/vim-autoswap'

    " Change cursor for different modes.
    Plug 'jszakmeister/vim-togglecursor'

    " Asynchronous Lint Engine
    " https://github.com/dense-analysis/ale.git
    Plug 'dense-analysis/ale'

    " Close html tags automatically
    " https://github.com/alvan/vim-closetag
    Plug 'alvan/vim-closetag'

    " Surround things
    " https://github.com/tpope/vim-surround
    Plug 'tpope/vim-surround'

    " Cool Git things
    " https://github.com/tpope/vim-fugitive.git
    Plug 'tpope/vim-fugitive'

    " Easy motion
    " https://github.com/justinmk/vim-sneak
    "s<char><char>
    " Plug 'justinmk/vim-sneak'

    " Easy commenting
    " https://github.com/preservim/nerdcommenter
    "[count]<leader>c<space>
    Plug 'scrooloose/nerdcommenter'

    " Some cool RoR tools
    " https://github.com/tpope/vim-rails
    Plug 'tpope/vim-rails'

    " Automagically end methods, functions, if blocks, etc.
    Plug 'tpope/vim-endwise'

    " Syntax highlighting for missing gems
    " https://github.com/tpope/vim-bundler
    Plug 'tpope/vim-bundler'

    " .editorconfig support.
    " https://github.com/sgur/vim-editorconfig
    Plug 'sgur/vim-editorconfig'

    " Colemak mappings (Not quite using colemak yet).
    " https://github.com/jooize/vim-colemak
    "Plug 'jooize/vim-colemak'

    " Wakatime integration
    " https://github.com/wakatime/vim-wakatime
    "Plug 'wakatime/vim-wakatime'

    " Hard mode. (Not quite there yet).
    " https://github.com/takac/vim-hardtime
    Plug 'takac/vim-hardtime'

    " Docblocks for PHP
    " https://github.com/brett-griffin/PHPDocBlocks.vim
    Plug 'brett-griffin/phpdocblocks.vim'

    " emmet (vim-zen, kinda)
    " https://github.com/mattn/emmet-vim
    "[insert mode]div>p#foo$*3>a<c-y>,
    Plug 'mattn/emmet-vim'

    " Fuzzy file finder
    " https://github.com/junegunn/fzf.vim
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " Rainbow parethesis
    " https://github.com/luochen1990/rainbow
    Plug 'luochen1990/rainbow'

    " This plugin provides extended matching for the % operator.
    " https://github.com/adelarsq/vim-matchit
    Plug 'https://github.com/adelarsq/vim-matchit'

    " Insert or delete brackets, parens, quotes in pair.
    "https://github.com/jiangmiao/auto-pairs
    Plug 'jiangmiao/auto-pairs'

    Plug 'ap/vim-css-color'

    Plug 'airblade/vim-gitgutter'

    " Syntax highlighting for .slim files
    Plug 'slim-template/vim-slim'

call plug#end()

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

let g:sneak#label = 1

filetype plugin on

" Needed for a few things"
syntax on

let autoload_vimrc = 1

" colorscheme
colorscheme noctu
"colorscheme custom

set ignorecase

set relativenumber

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

" Disable annoying as fuck visual bell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" I love undoing things
set undofile
set undodir=~/.config/nvim/undo
set directory=~/.config/nvim/undo

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

set nowrap

" Necessary for multiple encodings
set encoding=utf-8

" Enable spellchecking for various formats
au BufReadPre *.md set spell spelllang=en_us
au BufReadPre *.txt set spell spelllang=en_us

" Keep search matches in the middle of the window.
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

" Jump to middle when entering insert mode
autocmd InsertEnter * norm zz

autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

"au BufWritePost $MYVIMRC source %
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC nested source %
augroup end

augroup reload_xresources
    autocmd!
    autocmd BufWritePost ~/.Xresources* silent !xrdb -I$HOME/.Xresources.d ~/.Xresources
    autocmd BufWritePost ~/.Xresources* !~/.themes/xresources/colors.sh
augroup end

augroup reload_tmux
    autocmd!
    autocmd BufWritePost ~/.tmux.conf silent !tmux source-file ~/.tmux.conf
augroup end



" Jump to the same line I was on before
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Allow indenting muliple times and keeping selection
vnoremap < <gv
vnoremap > >gv

" Move selections in visual mode
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv

"map ; :Files<CR> " for fzf

" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" So much better than \.
let mapleader = " "

let g:phpdocblocks_move_cursor = 1

" Get rid of ex mode
nnoremap Q <nop>

nnoremap ; :
noremap H ^
noremap L g_

let g:sneak#s_next = 1

"let g:hardtime_default_on = 1

let g:closetag_filenames = "*.html.erb,*.html,*.xhtml,*.phtml"

let g:togglecursor_disable_tmux = 1
let g:autoswap_detect_tmux = 1

"let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

command! Config execute ":e $MYVIMRC"

let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_highlight_linenrs = 1

let g:user_emmet_leader_key='<C-Z>'

" Commenting
nmap <leader>c <Plug>NERDCommenterToggle
vmap <leader>c <Plug>NERDCommenterToggle

" Git
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gf :Gfetch<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gpl :Gpull<CR>
nnoremap <leader>gps :Gpush<CR>

" Open a file
noremap <leader>o  :Files<cr>

" Quicker writing
nnoremap <leader>w :w<CR>

" PHP
nnoremap <leader>pd :PHPDocBlocks<cr>

let g:NERDCreateDefaultMappings = 0

let g:netrw_banner = 0

set colorcolumn=80
highlight ColorColumn ctermbg=darkgray

let &runtimepath.=',~/.vim/bundle/neoterm'

hi TabLineFill ctermfg=LightGreen ctermbg=Red
hi TabLine ctermfg=Blue ctermbg=Yellow
hi TabLineSel ctermfg=Blue ctermbg=Green

let g:gitgutter_sign_added = '█'
let g:gitgutter_sign_modified = '█'
let g:gitgutter_sign_removed = '█'
let g:gitgutter_sign_removed_first_line = '█'
let g:gitgutter_sign_removed_above_and_below = '█'
let g:gitgutter_sign_modified_removed = '█'

set clipboard=unnamedplus
