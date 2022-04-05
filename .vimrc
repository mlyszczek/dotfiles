"" ==========================================================================
"                     _                           __
"             _   __ (_)____ ___          ____   / /__  __ ____ _
"            | | / // // __ `__ \ ______ / __ \ / // / / // __ `/
"            | |/ // // / / / / //_____// /_/ // // /_/ // /_/ /
"            |___//_//_/ /_/ /_/       / .___//_/ \__,_/ \__, /
"                                     /_/               /____/
"" ==========================================================================


set nocompatible              " be iMproved, required

" Specify a directory for plugins
" Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'Valloric/MatchTagAlways'        " highlight matching tag
Plug 'godlygeek/tabular'              " dependency for vim-markdown
Plug 'plasticboy/vim-markdown'        " syntax highlight for markdown
Plug 'jlanzarotta/bufexplorer'        " shows window with all buffers
Plug 'scrooloose/nerdtree'            " file explorer
Plug 'Xuyuanp/nerdtree-git-plugin'    " shows git changes in nerdtree
Plug 'airblade/vim-gitgutter'         " shows git changes in gutter
Plug 'tomtom/tcomment_vim'            " toggle comment on line
Plug 'easymotion/vim-easymotion'      " extended 'f' command
"Plug 'guyzmo/notmuch-abook'           " address book for email autocomplete
Plug 'chrisbra/Recover.vim'           " remove .swp when no changes are detected
Plug 'inkarkat/vim-ingo-library'      " deps for smart tabs
" smart tabs (IndentTab) installed manuall in ~/.vim/plugin

" after installing YCM, go into ~/.vim/plugged/YouComleteMe and call
" ./install.py --clang-completer
Plug 'Valloric/YouCompleteMe', { 'for': ['c', 'h'] }

" Initialize plugin system
call plug#end()

" Reload .vimrc and :PlugInstall to install plugins
" note: you might need to restart vim for :PlugInstall to work


"" ==========================================================================
"                  _                                   ____ _
"          _   __ (_)____ ___     _____ ____   ____   / __/(_)____ _
"         | | / // // __ `__ \   / ___// __ \ / __ \ / /_ / // __ `/
"         | |/ // // / / / / /  / /__ / /_/ // / / // __// // /_/ /
"         |___//_//_/ /_/ /_/   \___/ \____//_/ /_//_/  /_/ \__, /
"                                                          /____/
"" ==========================================================================


let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
let g:ycm_auto_trigger=0                    " trigger YCM only on c-space
let g:ycm_enable_diagnostic_signs=1         " draw gutter on the left
let g:ycm_enable_diagnostic_highlighting=0  " but don't highlight clang warnings
let g:ycm_always_populate_location_list=1   " create list of clang warnings
" do not use <TAB> for this, as this will clash with smart tabs
let g:ycm_key_list_select_completion   = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

let g:ctab_enable_default_filetype_maps=1
" nerd tree ignore file list
let NERDTreeIgnore = []

" backup files
let NERDTreeIgnore += ['\~$']
let NERDTreeIgnore += ['\.swp$']
let NERDTreeIgnore += ['\.swo$']

" files that are of no interest to edit
" generated by gcov, cc and autotools,
" some archives and all that shit
let NERDTreeIgnore += ['\.gcda$']
let NERDTreeIgnore += ['\.gcno$']
let NERDTreeIgnore += ['\.o$']
let NERDTreeIgnore += ['\.plist$']
let NERDTreeIgnore += ['\.in$']
let NERDTreeIgnore += ['\.log$']
let NERDTreeIgnore += ['\.trs$']
let NERDTreeIgnore += ['\.tar$']
let NERDTreeIgnore += ['\.gz$']
let NERDTreeIgnore += ['\.lo$']
let NERDTreeIgnore += ['\.la$']
let NERDTreeIgnore += ['\.so$']

let NERDTreeIgnore += ['^aclocal.m4$']
let NERDTreeIgnore += ['^compile$']
let NERDTreeIgnore += ['^config.guess$']
let NERDTreeIgnore += ['^config.status$']
let NERDTreeIgnore += ['^config.sub$']
let NERDTreeIgnore += ['^config.cache$']
let NERDTreeIgnore += ['^configure$']
let NERDTreeIgnore += ['^depcomp$']
let NERDTreeIgnore += ['^install-sh$']
let NERDTreeIgnore += ['^missing$']
let NERDTreeIgnore += ['^stamp-h1$']
let NERDTreeIgnore += ['^coverage.info$']
let NERDTreeIgnore += ['^AUTHORS$']
let NERDTreeIgnore += ['^INSTALL$']
let NERDTreeIgnore += ['^LICENSE$']
let NERDTreeIgnore += ['^COPYING$']
let NERDTreeIgnore += ['^cscope.out$']
let NERDTreeIgnore += ['^tap-driver.sh$']
let NERDTreeIgnore += ['^test-driver$']
let NERDTreeIgnore += ['^autom4te.cache$']
let NERDTreeIgnore += ['^ltmain.sh$']
let NERDTreeIgnore += ['^libtool$']

let g:vimtex_view_method = 'zathura' " use zathura to view latex pdf
let g:tex_flavor = "latex"           " enable latex extensions on tex files

colorscheme lm          " my color scheme

set updatetime=1000     " run plugin code once every 1 second
set encoding=utf-8      " utf-8 for the win!
set fileencoding=utf-8
set termencoding=utf-8

set tabstop=4           " tab character is 4 spaces wide
set shiftwidth=4        " hitting ">>" will move line by 4 spaces
set noexpandtab         " produce tabs when <tab> is hit
set softtabstop=4       " when <tab> is hit, produce 4 spaces
set autoindent          " when <enter> is hit, stay in the same column
set nowrap              " don't wrap long lines, just trim them
set cindent
let g:IndentTab_scopes = 'indent,commentprefix,string'
let g:IndentTab_IsSuperTab = 0

set rnu                 " show relative line numbers
set textwidth=80        " lines should not be longer than 80ch (it's enough)
set colorcolumn=+1,+41  " draw line at 81 column (warning) and 121 (CAREFUL!)

set confirm             "Ask for confirmation rather then refuse certain commands
set cursorline          "Turn on current line highlight
set hlsearch            "Turn on highlighting search text by default
set hidden              "Keep hidden windows
try
	"set listchars=tab:\ ,trail:·    "Strings to use in 'list' mode.
	set listchars=tab:▸―,nbsp:␣,trail:•,extends:»,precedes:«
catch /E474:/
	"set listchars=tab:>-,trail:.    "Failsafe for non-unicode envs
	set list listchars=tab:>-,nbsp:.,trail:.,extends:>,precedes:<
endtry
set number              " show line number at the left of screen
set scrolloff=10        " scroll whole screen when cursor is this away from edge

set list                " show tab characters
set laststatus=2        " always show staus line

set foldmethod=marker   " fold everything between markers (on demand)
set foldmarker=/*,*/    " folder between /* */ (c comment)
set foldenable!         " don't fold anything at startup

set statusline=%t       " tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, " file encoding
set statusline+=%{&ff}] " file format
set statusline+=%h      " help file flag
set statusline+=%m      " modified flag
set statusline+=%r      " read only flag
set statusline+=%y      " filetype
set statusline+=%=      " left/right separator
set statusline+=%c,     " cursor column
set statusline+=%l/%L   " cursor line/total lines
set statusline+=\ %P    " percent through file
set fillchars+=vert:\┃  " set character for the vertical split

" persist undo even after vim restart
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000

" highlight whitespaces
":highlight ExtraWhitespace ctermbg=red guibg=red
":match ExtraWhitespace /\s\+$/


"" ==========================================================================
"                   __                  __                __
"            _____ / /_   ____   _____ / /_ _____ __  __ / /_ _____
"           / ___// __ \ / __ \ / ___// __// ___// / / // __// ___/
"          (__  )/ / / // /_/ // /   / /_ / /__ / /_/ // /_ (__  )
"         /____//_/ /_/ \____//_/    \__/ \___/ \__,_/ \__//____/
"
"" ==========================================================================


let mapleader = ","    " reconfigure <Leader> to be ',' (comma)
set pastetoggle=<leader>p  " toggle betwen paste and nopaste

nnoremap <leader>e :call Equalize()<CR>
vnoremap <leader>e :call Equalize()<CR>
nnoremap <leader>f :call FigletComment("
nnoremap <leader>F :call FigletCommentShort("
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>o :BufExplorer<cr>
noremap  <leader>t :call DeleteTrailingWS()<CR>
vnoremap <leader>w :call EqualizeWide()<CR>
vnoremap <leader>E :call EqualizeNarrow()<CR>

nnoremap <leader>C :call CowsayComment("
nnoremap <leader>E :lopen<CR>
nnoremap <leader>H :call HexMe()<CR>

imap <leader><leader> <Esc>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l


"" ==========================================================================
"              ____                     __   _
"             / __/__  __ ____   _____ / /_ (_)____   ____   _____
"            / /_ / / / // __ \ / ___// __// // __ \ / __ \ / ___/
"           / __// /_/ // / / // /__ / /_ / // /_/ // / / /(__  )
"          /_/   \__,_//_/ /_/ \___/ \__//_/ \____//_/ /_//____/
"
"" ==========================================================================


"" ==========================================================================
"   Prints opening part of comment based on language
"" ==========================================================================


function PrintCommentOpen()
	if (&ft=='c' || &ft=='h')
		read !echo "/* =========================================================================="
	endif

	if (&ft=='sh' || &ft=='python')
		read !echo "\#\# =========================================================================="
	endif

	if (&ft=='vim')
		read !echo "\"\" =========================================================================="
	endif
endfunction


"" ==========================================================================
"   Prints closing part of comment based on language
"" ==========================================================================


function PrintCommentClose()
	if (&ft=='c' || &ft=='h')
		read !echo "   ========================================================================== */"
	endif

	if (&ft=='sh' || &ft=='python')
		read !echo "\#\# =========================================================================="
	endif

	if (&ft=='vim')
		read !echo "\"\" =========================================================================="
	endif
endfunction


"" ==========================================================================
"   Prints opening part of short comment based on language
"" ==========================================================================


function PrintCommentOpenShort()
	if (&ft=='c' || &ft=='h')
		read !echo "    /* =================================================================="
	endif

	if (&ft=='sh' || &ft=='python')
		read !echo "    \#\# =================================================================="
	endif

	if (&ft=='vim')
		read !echo "    \"\" =================================================================="
	endif
endfunction


"" ==========================================================================
"   Prints closing part of short comment based on language
"" ==========================================================================


function PrintCommentCloseShort()
	if (&ft=='c' || &ft=='h')
		read !echo "       ================================================================== */"
	endif

	if (&ft=='sh' || &ft=='python')
		read !echo "    \#\# =================================================================="
	endif

	if (&ft=='vim')
		read !echo "    \"\" =================================================================="
	endif
endfunction


"" ==========================================================================
"   Returns comment character based on language.
"" ==========================================================================


function GetCommentChar()
	if (&ft=='c' || &ft=='h')
		return ''
	endif

	if (&ft=='sh' || &ft=='python')
		return '\#'
	endif

	if (&ft=='vim')
		return '\"'
	endif
endfunction


"" ==========================================================================
"   creates nice figlet comment - just like that "functions" above
"" ==========================================================================


function FigletComment(comment)
	call PrintCommentOpen()
	let l:cc = GetCommentChar()
	let c = system("figlet -w78 -c -fslant -k " . a:comment .
				\ " | sed 's/^/" . l:cc . "/g'")
	put =c
	call PrintCommentClose()
endfunction


"" ==========================================================================
"   same as FigletComment but with shorter delimiters, for embeding in
"   functions.
"" ==========================================================================


function FigletCommentShort(comment)
	call PrintCommentOpenShort()
	let l:cc = "    " . GetCommentChar()
	let c = system("figlet -w78 -c -fsmslant -k " . a:comment .
				\ " | sed 's/^    /" . l:cc . "/g'")
	put =c
	call PrintCommentCloseShort()
endfunction


"" ==========================================================================
"   creates random cowsay with passed string, it's stupid, but cool
"" ==========================================================================


function CowsayComment(comment)
	call PrintCommentOpen()
	let l:cc = GetCommentChar()
	let c = system("cowsay -W 60 -f $(ls /usr/share/cowsay-3.03/cows/ | shuf -n1) " . a:comment .
				\ " | sed 's/^/" . l:cc . "/g'")
	put =c
	call PrintCommentClose()
endfunction


"" ==========================================================================
"   if string is longer than 'width' value, function will process text so
"   it fits into defined line width. Works on marked text in visual mode.
"" ==========================================================================


function EqText(width)
	let &textwidth=a:width
	execute "normal gvgq"
	set textwidth=80
endfunction


"" ==========================================================================
"   Same as EqText but for 50 characters wide
"" ==========================================================================


function EqualizeNarrow()
	call EqText(50)
endfunction

"" ==========================================================================
"   Same as EqText but for 67 characters wide
"" ==========================================================================


function Equalize()
	call EqText(67)
endfunction


"" ==========================================================================
"   Same as EqText but for 76 characters wide
"" ==========================================================================


function EqualizeWide()
	call EqText(76)
endfunction


"" ==========================================================================
"   Current file is converted into hex view
"" ==========================================================================


function HexMe()
	set binary
	set noeol
	if $in_hex>0
		:%!xxd -r
		let $in_hex=0
	else
		:%!xxd
		let $in_hex=1
	endif
endfunction


"" ==========================================================================
"   Changes spaces to tabs, assumes 4spaces = 1tab, works up to max 10
"   indents, quite crude function, but works:)
"" ==========================================================================


function Retab()
	let l:i = 10

	while l:i > 0
		let l:spaces = ""
		let l:tabs = ""
		let l:j = l:i

		while l:j > 0
			let l:spaces .= "    "
			let l:tabs   .= "\t"
			let l:j -= 1
		endwhile

		:execute 'substitute/^' . l:spaces . '/' . l:tabs . '/e'

		let l:i -= 1
	endwhile
endfunction


"" ==========================================================================
"   Removes those pesky trailing spaces at the end of each line
"" ==========================================================================


func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc


"" ==========================================================================
"                          __                               __
"           ____ _ __  __ / /_ ____   _____ ____ ___   ____/ /_____
"          / __ `// / / // __// __ \ / ___// __ `__ \ / __  // ___/
"         / /_/ // /_/ // /_ / /_/ // /__ / / / / / // /_/ /(__  )
"         \__,_/ \__,_/ \__/ \____/ \___//_/ /_/ /_/ \__,_//____/
"
"" ==========================================================================


" remove trailing spaces from c files upon save
autocmd BufWritePre *.c %s/\s\+$//e

" allow per-project .vimrc
set exrc

" but disable autocmd in those files - for security reasons
set secure

" start nerd tree when opening source files
"autocmd VimEnter *.c NERDTree

" enable smart tabs globally
autocmd VimEnter * call IndentTab#Set(1, 1)
