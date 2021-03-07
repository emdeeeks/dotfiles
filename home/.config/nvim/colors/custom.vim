highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="custom"

hi Comment ctermfg=10
hi Normal ctermfg=13
hi NonText ctermfg=11
hi Special ctermfg=7
hi Cursor ctermfg=6
hi Function ctermfg=2
hi Type ctermfg=4

hi Constant        ctermfg=7    ctermbg=none
hi String          ctermfg=3    ctermbg=none    cterm=none
hi StringDelimiter ctermfg=1    ctermbg=none    cterm=none
hi Character       ctermfg=none    ctermbg=none    cterm=none
hi Boolean         ctermfg=3    ctermbg=none    cterm=none
hi Float           ctermfg=none    ctermbg=none    cterm=none
hi Conditional      ctermfg=5
hi Statement        ctermfg=6
hi Operator         ctermfg=2

hi Identifier      ctermfg=4    ctermbg=none
hi Todo             ctermfg=14 ctermbg=none

highlight clear SignColumn


