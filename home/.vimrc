"set background=dark
"set term=screen-256color
"let base16colorspace=256
colorscheme base16-tomorrow
set laststatus=2
set number
set ruler
set viminfo='50,<1000,s100,h

hi Normal ctermfg=white ctermbg=none
set list listchars=tab:▸\ ,eol:¬,trail:·

execute pathogen#infect()

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
"let g:airline_theme             = 'base16'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1

if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_powerline_fonts=0

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"highlight clear SignColumn
:highlight SignColumn ctermbg=none ctermfg=darkgrey
:highlight LineNr ctermbg=none ctermfg=darkgrey

" tabstop settings
set tabstop=4 " a tab found in a file will be represented with 4 columns
set softtabstop=4 " when in insert mode <tab> is pressed move 4 columns
set shiftwidth=4 " indentation is 4 columns
"set noexpandtab " tabs are tabs, do not replace with spaces

map <F2> :mksession! ~/.vim_session <cr>
map <F3> :source ~/.vim_session <cr>

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-d> :call pdv#DocumentWithSnip()<CR>

hi TabLineFill ctermfg=grey ctermbg=grey
hi TabLine ctermfg=yellow ctermbg=grey
hi TabLineSel ctermfg=lightgrey ctermbg=grey

vmap <C-c> "+y

