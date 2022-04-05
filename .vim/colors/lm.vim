:set background=dark
:highlight clear
hi clear
if exists("syntax_on")
    syntax reset
endif
let colors_name = "lm-"
:hi clear Normal
:hi SpecialKey      ctermfg=darkgrey
:hi Statement       ctermfg=yellow
:hi Keyword         ctermfg=cyan        cterm=bold
:hi Label           ctermfg=cyan        cterm=bold
:hi Visual                              cterm=reverse
:hi String          ctermfg=red         cterm=bold
:hi Comment         ctermfg=darkblue    cterm=italic
:hi Constant        ctermfg=red         cterm=bold
:hi Special         ctermfg=darkgreen
:hi Identifier      ctermfg=red
:hi Include         ctermfg=magenta     cterm=none
:hi PreProc         ctermfg=red
:hi PreCondit       ctermfg=red         cterm=none
:hi Operator        ctermfg=red         cterm=bold
:hi Define          ctermfg=yellow      cterm=bold
:hi Type            ctermfg=darkyellow  cterm=bold
:hi Typedef         ctermfg=magenta     cterm=bold
:hi StorageClass    ctermfg=darkgreen
:hi Function        ctermfg=yellow      cterm=bold
:hi UserFunction    ctermfg=yellow      cterm=bold
:hi Structure       ctermfg=yellow      cterm=bold
:hi LineNr          ctermfg=darkred
:hi Ignore          ctermfg=white
:hi Todo            ctermbg=Yellow
:hi Debug           ctermfg=black
:hi Pmenu           ctermfg=magenta     ctermbg=black
:hi PmenuSel        ctermfg=red         ctermbg=black
:hi Folded          ctermfg=darkblue    ctermbg=black
:hi StatusLine      ctermfg=blue        ctermbg=black   cterm=none
:hi StatusLineNC    ctermfg=grey        ctermbg=black   cterm=none
:hi VertSplit       ctermfg=black       ctermbg=darkgray
:hi SignColumn      ctermfg=blue        ctermbg=black
:hi DiffAdd         cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
:hi DiffDelete      cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
:hi DiffChange      cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
:hi DiffText        cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
