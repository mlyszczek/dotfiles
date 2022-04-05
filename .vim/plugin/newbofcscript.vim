" Vim plugin
" shamelessly stolen from getnoo newinitd.vim

if &compatible || v:version < 603 || exists("g:loaded_newbofcscript")
    finish
endif

let g:loaded_newbofcscript=1

fun! <SID>MakeNewBofcScript()
    0 put ='#!/bin/sh'
    put =''
    put ='. /usr/bofc/lib/utils.sh'
    put ='cat << HELP \| help ne 0 $@'
    put =''
    put ='HELP'
    put =''
    5
endfun

com! -nargs=0 NewBofcScript call <SID>MakeNewBofcScript() | set filetype=sh

augroup NewBofcScript
    au!
    autocmd BufNewFile {/usr/bofc/bin/*}
        \ call <SID>MakeNewBofcScript() | set filetype=sh
augroup END

" vim: set et foldmethod=marker : "
