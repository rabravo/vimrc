"Forget about mimicking old vi
set nocompatible

"Enable syntax and 'plugin'
syntax enable
filetype plugin on

"Setting for fuzzy/recursive search under root project directory 
set path+=**

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


let g:uset_emmet_leader_key=','

execute pathogen#infect()
syntax on
filetype plugin indent on


noremap Q !!sh<CR> 
