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

"highlight clear SignColumn
:highlight SignColumn ctermbg=none ctermfg=darkgrey
:highlight LineNr ctermbg=none ctermfg=darkgrey

"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" tabstop settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

map <F2> :mksession! ~/.vim_session <cr>
map <F3> :source ~/.vim_session <cr>

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-d> :call pdv#DocumentWithSnip()<CR>

hi TabLineFill ctermfg=grey ctermbg=black
hi TabLine ctermfg=yellow ctermbg=black
hi TabLineSel ctermfg=lightgrey ctermbg=black

vmap <C-c> "+y

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

hi User1 ctermfg=red ctermbg=black
hi User2 ctermfg=green ctermbg=black
hi User3 ctermfg=yellow ctermbg=black
hi User4 ctermfg=cyan ctermbg=black
hi User5 ctermfg=blue ctermbg=black
hi User6 ctermfg=magenta ctermbg=black
hi User7 ctermfg=darkgrey ctermbg=black
hi StatusLine ctermbg=black

set gcr=a:block
" mode aware cursors
set gcr+=o:hor50-Cursor
set gcr+=n:Cursor
set gcr+=i-ci-sm:InsertCursor
set gcr+=r-cr:ReplaceCursor-hor20
set gcr+=c:CommandCursor
set gcr+=v-ve:VisualCursor
set gcr+=a:blinkon0

hi InsertCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=37  guibg=#2aa198
hi VisualCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=125 guibg=#d33682
hi ReplaceCursor ctermfg=15 guifg=#fdf6e3 ctermbg=65  guibg=#dc322f
hi CommandCursor ctermfg=15 guifg=#fdf6e3 ctermbg=166 guibg=#cb4b16

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>6

