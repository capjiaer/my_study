"Appearance related information
winpos 5 5 
set lines=30 columns=100
set nu
set cursorline 
set ruler
set showcmd
set cmdheight=1
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
set laststatus=2
set cmdheight=2
set scrolloff=3


" Version realted
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif

" GUI setup for fonts
colorscheme murphy
if (has("gui_running"))
	set guifont=Bitstream\ Vera\ Sans\ Mono\ 16
endif

" Auto Insertion for different file creation
autocmd BufNewfile *.cpp,*.sh,*.java,*.py exec ":call SetTitle()"

function! SetTitle()
	if &filetype == 'sh'
		call setline(1,"\#! /bin/bash")
		call append(line("."), "\############################################################")
		call append(line(".")+1, "\# File Name: ".expand("%"))
		call append(line(".")+2, "\# Author: anping.chen")
		call append(line(".")+3, "\# Email: capjiaer@163.com")
		call append(line(".")+4, "\# Created Time: ".strftime("%c"))
		call append(line(".")+5, "\############################################################")
		call append(line(".")+6, "")
	elseif &filetype == 'python'
		call setline(1,"\#! /usr/bin/python3.9")
		call append(line("."), "\############################################################")
		call append(line(".")+1, "\# File Name: ".expand("%"))
		call append(line(".")+2, "\# Author: anping.chen")
		call append(line(".")+3, "\# Email: capjiaer@163.com")
		call append(line(".")+4, "\# Created Time: ".strftime("%c"))
		call append(line(".")+5, "\############################################################")
		call append(line(".")+6, "")
	elseif &filetype == 'csh'
		call setline(1,"\#! /bin/csh")
		call append(line("."), "\############################################################")
		call append(line(".")+1, "\# File Name: ".expand("%"))
		call append(line(".")+2, "\# Author: anping.chen")
		call append(line(".")+3, "\# Email: capjiaer@163.com")
		call append(line(".")+4, "\# Created Time: ".strftime("%c"))
		call append(line(".")+5, "\############################################################")
		call append(line(".")+6, "")
	else
		call setline(1,"\# un-expected file type, please set your env here by yourself")
		call append(line("."), "\############################################################")
		call append(line(".")+1, "\# File Name: ".expand("%"))
		call append(line(".")+2, "\# Author: anping.chen")
		call append(line(".")+3, "\# Email: capjiaer@163.com")
		call append(line(".")+4, "\# Created Time: ".strftime("%c"))
		call append(line(".")+5, "\############################################################")
		call append(line(".")+6, "")
		
	endif
	autocmd BufNewfile * normal G
endfunction


" Coding autocomplete realted
set completeopt=preview,menu
filetype plugin on
set clipboard+=unnamed

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>

:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>

:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>

:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i

function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction

set completeopt=longest,menu

set cpt=.,k,w,b
set shortmess+=c

autocmd FileType python set dictionary=/home/chenanping/.vim/dict/template.dict/

function! Insert_TAB()
	let col=col('.')-1
	if !col || getline('.')[col-1] !~ '\k'
		return"\<C-X>\<C-F>"
	elseif getline('.')[col-1] == '\\'
		return"\<C-N>"
	else
		return"\<C-N>"
	endif
endfunction
inoremap <TAB> <C-R>=Insert_TAB()<CR>

" Calibre related
autocmd BufRead,BufNewfile *.rules,*.rule,*.svrf,*.tvf,*.top set filetype=calibre
autocmd BufRead,BufNewfile *.cmd,*.cmds,*.mid set filetype=tcl

" Setup a iabbrev
iabbrev @@ anping.chen@joinsilicon.com

" Other settings
set noeb
set confirm
set autoindent
set cindent
filetype on
filetype plugin on
filetype plugin indent on
set iskeyword+=_,$,@,@,%,#,-
set showmatch
set matchtime=2
set scrolloff=3
set smartindent

" Tab related
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
""set smarttab

" Search related
set ignorecase
set hlsearch
set incsearch
