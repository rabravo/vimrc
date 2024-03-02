"Forget about mimicking old vi
set nocompatible


" Remap default LEADER 
let mapleader='\'


" Display the LEADER key at the bottom
set showcmd


"Enable syntax and 'plugin'
syntax enable
filetype plugin on

"Setting for fuzzy/recursive search under root project directory 
set path+=**

set wildmenu

set number
set relativenumber
set cursorline
set mouse=a
set title
set autoindent 
set incsearch
"Show status line
set laststatus=2 
"Show type of file, total number of lines,
"and percent of file were you are
"at. 
set statusline=%y
set statusline+=%L
set statusline+=%P
set directory=$HOME/.vim/swp//
set tags=tags

" NetRW
let g:netrw_banner = 0		" disable annoying banner
let g:netrw_liststyle = 3	" tree view
let g:netrw_browse_split = 4	" open in prior window
let g:netrw_altv=1		" open split to the right
let g:netrw_winsize = 20	" change percent of windows size


function! OpenToRight()
	:normal v
	let g:path=expand('%:p')
	echo g:path
	:q!
	execute 'belowright vnew' g:path
	:normal <C-l>
endfunction

function! OpenBelow()
	:normal v
	let g:path=expand('%p')
	:q!
	execute 'belowright new' g:path
	:normal <C-l>
endfunction

function! NetrwMappings()
	" hack fix to make ctrl-l work properly
	noremap <buffer> <C-l> <C-w>l
	noremap <silent> <C-f> :call ToggleNetrw()<CR>
	noremap <buffer> V :call OpenToRight()<cr>
	noremap <buffer> H :call OpenBelow()<cr>
endfunction

augroup netrw_mappings
	autocmd!	
	autocmd filetype netrw call NetrwMappings()
augroup END


" Allow for netrw to be toggled
function! ToggleNetrw()
	if g:NetrwIsOpen
		let i = bufnr("$")
		while (i >= 1)
			if (getbufvar(i, "&filetype") == "netrw")
				silent ee "bwipeout " . i
			endif
			let i-=1
		endwhile
		let g:NetrwIsOpen=0
	else
		let g:NetrwIsOpen=1
		silent Lexplore
	endif
endfunction


" Close Netrw If It's the only buffer open

autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif



" Make netrw act like a project Draw
augroup ProjectDrawer
	autocmd!
	autocmd vimEnter * :call ToggleNetrw()
augroup END

let g:NetrwIsOpen=0


" Setup leader for emmet autocompletion
let g:user_emmet_leader_key=','

call pathogen#infect() 
" execute pathogen#infect()
syntax on
filetype plugin indent on




" Copilot entries after this line

let g:copilot_filetypes = {
    \ 'gitcommit': v:true,
    \ 'markdown': v:true,
    \ 'yaml': v:true,
    \ 'perl': v:true,
    \ 'java': v:true,
    \ 'c': v:true,
    \ 'html': v:true,
    \ 'css': v:true,
    \ 'javascript': v:true,
    \ 'react': v:true,
    \ 'haskell': v:true,
    \ 'R': v:true
    \ }

" Disable Copilot in large files
 autocmd BufReadPre *
     \ let f=getfsize(expand("<afile>"))
     \ | if f > 100000 || f == -2
     \ | let b:copilot_enabled = v:false
     \ | endif







" Open nerdtree window on opening Vim
"   autocmd VimEnter * NERDTree

" Refresh the current folder if any changes
"   autocmd BufEnter NERD_tree_* | execute 'normal R'
"   au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

"Reload the window if directory is changed
"  augroup DIRCHANGE
"      au!
"      autocmd DirChanged global :NERDTreeCWD
"  augroup END

"Close nerdtree automatically if it is theonly window open
"  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


noremap Q !!sh<CR> 
