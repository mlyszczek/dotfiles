"%% SiSU Vim color file
" Stefan Maintainer: Stefan Nelson-Lindall <bethebunny@gmail.com>
" (originally looked at Slate by Ralph Amissah <ralph@amissah.com>, 8/9/2012)
:set background=dark
:highlight clear
if version > 580
 hi clear
 if exists("syntax_on")
 syntax reset
 endif
endif
let colors_name = "lm-"
:hi clear Normal
:hi SpecialKey ctermfg=darkgreen
:hi Statement ctermfg=yellow
:hi Keyword ctermfg=cyan cterm=bold
:hi Label ctermfg=cyan cterm=bold
:hi Visual cterm=reverse
:hi String ctermfg=red cterm=bold
:hi Comment ctermfg=darkblue cterm=none
:hi Constant ctermfg=red cterm=bold
:hi Special ctermfg=darkgreen
:hi Identifier ctermfg=red
:hi Include ctermfg=magenta cterm=none
:hi PreProc ctermfg=red
:hi PreCondit ctermfg=red cterm=none
:hi Operator ctermfg=red cterm=bold
:hi Define ctermfg=yellow cterm=bold
:hi Type ctermfg=lightyellow cterm=bold
:hi Typedef ctermfg=magenta cterm=bold
:hi StorageClass ctermfg=darkgreen
:hi Function ctermfg=yellow cterm=bold
:hi UserFunction ctermfg=yellow cterm=bold
:hi Structure ctermfg=lightyellow cterm=bold
:hi LineNr ctermfg=red
:hi Ignore ctermfg=white
:hi Todo ctermbg=Yellow
:hi Debug ctermfg=LightGray
:hi Pmenu ctermfg=grey ctermbg=magenta
:hi PmenuSel ctermfg=magenta ctermbg=grey
:autocmd BufEnter * if &readonly | hi StatusLine ctermfg=Red | else | hi StatusLine ctermfg=Cyan | endif
