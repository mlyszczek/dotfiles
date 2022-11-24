" Vim plugin
" shamelessly stolen from getnoo newinitd.vim

if &compatible || v:version < 603 || exists("g:loaded_newbofcscript")
    finish
endif

let g:loaded_newbofcscript=1

fun! <SID>MakeNewBofcScript()
    0 put ='#!/bin/sh'
/****************************************************************************
 * arch/arm/src/stm32wl5/stm32wl5_allocateheap.c
 *
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.  The
 * ASF licenses this file to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance with the
 * License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
 * License for the specific language governing permissions and limitations
 * under the License.
 *
 ****************************************************************************/

/****************************************************************************
 * Included Files
 ****************************************************************************/

#include <nuttx/config.h>

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/

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
