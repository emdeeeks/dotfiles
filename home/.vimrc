colorscheme base16-tomorrow

" So much better than \.
let mapleader = ","

" Basics.
set undofile
set cursorline
"set laststatus=1
set relativenumber
set number
set ruler
set viminfo+=n~/.vim/viminfo
set list listchars=tab:▸\ ,eol:¬,trail:·
set hlsearch

" Color stuff.
hi ColorColumn ctermbg=none
hi Error ctermfg=red ctermbg=none
hi Errormsg ctermfg=red ctermbg=none
hi Normal ctermfg=none ctermbg=none
hi TabLineFill ctermbg=black
hi TabLine ctermfg=darkgrey ctermbg=black
hi TabLineSel ctermfg=green ctermbg=black
"hi NonText ctermfg=gray
hi User1 ctermfg=red ctermbg=black
hi User2 ctermfg=green ctermbg=black
hi User3 ctermfg=yellow ctermbg=black
hi User4 ctermfg=cyan ctermbg=black
hi User5 ctermfg=blue ctermbg=black
hi User6 ctermfg=magenta ctermbg=black
hi User7 ctermfg=gray ctermbg=black
hi StatusLine ctermbg=none
hi GitGutterAdd ctermbg=none
hi GitGutterChange ctermbg=none
hi GitGutterDelete ctermbg=none
hi GitGutterChangeDelete ctermbg=none
hi SignColumn ctermbg=none
hi LineNr ctermfg=grey ctermbg=none
hi CursorLine ctermbg=none
hi CursorLineNR ctermfg=green ctermbg=none
hi CursorColumn ctermfg=green ctermbg=none
hi Pmenu ctermfg=black ctermbg=black
hi Pmenusel ctermfg=green ctermbg=black
hi DiffAdd ctermfg=black ctermbg=green
hi DiffDelete ctermfg=black ctermbg=red
hi DiffChange ctermfg=black ctermbg=yellow
hi DiffText ctermfg=black ctermbg=blue
hi SpellBad ctermfg=black ctermbg=red
hi VertSplit term=none ctermfg=none ctermbg=none guifg=none guibg=none
hi FoldColumn ctermfg=none ctermbg=none
hi Folded ctermfg=none ctermbg=none
hi StatusLineNC ctermfg=none ctermbg=none

" Handle tabs.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Disable movement with arrow keys.
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
"noremap! <Left> <NOP>
"noremap! <Right> <NOP>
"noremap! <Up> <NOP>
"noremap! <Down> <NOP>

" Strip leading whitespace.
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Keep search matches in the middle of the window.
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

" NEED TO ORGANIZE EVERYTHING BELOW HERE

map <tab> %

set backspace=indent,eol,start

execute "set colorcolumn=" . join(range(81,335), ',')

execute pathogen#infect()


let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_column_always = 1

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-d> :call pdv#DocumentWithSnip()<CR>

vmap <C-c> :!xclip -f -sel clip<CR>
map <C-v> :-1r !xclip -o -sel clip<CR>

map <F2> :mksession! ~/.vim_session <cr>
map <F3> :source ~/.vim_session <cr>

" Necessary for multiple encodings
set encoding=utf-8

" Pass arguments to phpcs binary
" let g:phpqa_codesniffer_args = "--standard=PSR2"
" Another example
let g:phpqa_codesniffer_args = "--standard=PSR2 --tab-width=4"

" PHP codesniffer binary (default = phpcs)
let g:phpqa_codesniffer_cmd='phpcs'

" Run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0

" Mess detector
" let g:phpqa_messdetector_ruleset = "./phpmd.xml"

" PHP mess detector binary (default = phpmd)
let g:phpqa_messdetector_cmd='phpmd'

" Run mess detector on save (default = 1)
let g:phpqa_messdetector_autorun = 0

let g:phpunit_testroot = './Test/Case'
let g:phpunit_srcroot = '../app'
let g:phpunit_bin = './Console/cake test'

"let g:phpqa_codecoverage_file = "./test.xml"
let g:phpqa_codecoverage_showcovered = 1

let g:phpqa_run_on_write = 1

"map <C-s> :set spell spelllang=en_us<cr>
map <C-n> :Phpcs<cr>
map <C-m> :Phpmd<cr>



"let s:vim_home = '~/.vim/settings/'

"let config_list = [
"  \ 'plugins.vim',
"  \ 'base.vim',
"  \ 'functions.vim',
"  \ 'theme.vim',
"  \ 'settings.vim',
"  \ 'leader.vim',
"  \ 'keymappings.vim',
"  \ 'languages.vim',
"  \ 'plugin_settings.vim'
"\]

"for files in config_list
"  for f in split(glob(s:vim_home.files), '\n')
"    exec 'source '.f
"  endfor
"endfor

au BufReadPre *.md set spell spelllang=en_us
