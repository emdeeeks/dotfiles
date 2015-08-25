colorscheme base16-tomorrow
set laststatus=2
set number
set ruler
set viminfo='50,<1000,s100,h
set list listchars=tab:▸\ ,eol:¬,trail:·
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set textwidth=80

hi ColorColumn guibg=#2d2d2d ctermbg=black
execute "set colorcolumn=" . join(range(81,335), ',')

execute pathogen#infect()

hi Normal ctermfg=white ctermbg=none
hi TabLineFill ctermfg=grey ctermbg=black
hi TabLine ctermfg=yellow ctermbg=black
hi TabLineSel ctermfg=lightgrey ctermbg=black

hi User1 ctermfg=red ctermbg=black
hi User2 ctermfg=green ctermbg=black
hi User3 ctermfg=yellow ctermbg=black
hi User4 ctermfg=cyan ctermbg=black
hi User5 ctermfg=blue ctermbg=black
hi User6 ctermfg=magenta ctermbg=black
hi User7 ctermfg=darkgrey ctermbg=black
hi StatusLine ctermbg=black

highlight GitGutterAdd ctermbg=none
highlight GitGutterChange ctermbg=none
highlight GitGutterDelete ctermbg=none
highlight GitGutterChangeDelete ctermbg=none

let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_column_always = 1
highlight SignColumn ctermbg=none ctermfg=darkgrey
highlight LineNr ctermbg=none ctermfg=darkgrey

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-d> :call pdv#DocumentWithSnip()<CR>

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

vmap <C-c> "+y
map <F2> :mksession! ~/.vim_session <cr>
map <F3> :source ~/.vim_session <cr>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>6

set statusline=
"set statusline +=%1*\ %n\ %*				"buffer number
"set statusline +=%5*%{&ff}%*				"file format
"set statusline +=%3*%y%*					"file type
set statusline +=%7*File:\%3*\ %<%F%*				"full path
set statusline +=%2*%m%*					"modified flag
set statusline +=%=							"align right"
set statusline +=%7*Row\:\ %1*%l			"current line
set statusline +=%2*/%L%*					"total lines
set statusline +=%7*\ Column\:\ %6*%4v	"virtual column number
set statusline +=\ (%5*%P)\ "percent through file
