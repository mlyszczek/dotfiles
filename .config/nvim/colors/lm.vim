:set background=dark
:highlight clear
hi clear
if exists("syntax_on")
    syntax reset
endif
let colors_name = "lm"
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
:hi Identifier      ctermfg=cyan
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
:hi Pmenu           ctermfg=232        ctermbg=darkyellow
:hi PmenuSel        ctermfg=235
:hi NonText         ctermfg=235
:hi Folded          ctermfg=darkblue    ctermbg=black
:hi StatusLine      ctermfg=blue        ctermbg=magenta   cterm=none
:hi StatusLineNC    ctermfg=grey        ctermbg=black   cterm=none
:hi VertSplit       ctermfg=black       ctermbg=darkgray
:hi SignColumn      ctermfg=blue        ctermbg=black
:hi DiffAdd         cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
:hi DiffDelete      cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
:hi DiffChange      cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
:hi DiffText        cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
:hi ColorColumn         ctermfg=red         ctermbg=red

:hi doxygenComment ctermfg=LightRed guifg=LightRed
:hi doxygenBrief cterm=bold ctermfg=Cyan ctermbg=black guifg=LightBlue gui=Bold,Italic
:hi doxygenBody ctermfg=Cyan guifg=LightBlue
:hi doxygenSpecialTypeOnelineDesc cterm=bold ctermfg=Red guifg=firebrick3 gui=bold
:hi doxygenBOther cterm=bold ctermfg=Magenta guifg=#aa50aa gui=bold
:hi doxygenParam ctermfg=red guifg=LightGray
:hi doxygenParamName cterm=italic ctermfg=magenta guifg=LightBlue gui=italic,bold
:hi doxygenSpecialOnelineDesc cterm=bold ctermfg=LightCyan guifg=LightCyan gui=bold
:hi doxygenSpecialHeading cterm=bold ctermfg=LightBlue guifg=LightBlue gui=bold
:hi doxygenPrev ctermfg=LightGreen guifg=LightGreen

:hi @comment.documentation.c ctermfg=darkgrey
:hi @keyword.doxygen ctermfg=red 
:hi @variable.doxygen cterm=italic ctermfg=magenta

:hi TelescopePreviewLine ctermbg=magenta
:hi TelescopeSelection ctermbg=magenta


:hi LspReferenceText  ctermbg=232
