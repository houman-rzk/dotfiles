"        _                    
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|

let mapleader=" "

" Some basiscs
	set number relativenumber
	syntax on
	"set backspace=indent,eol,start
	set encoding=utf-8
	set splitbelow splitright

" Enable autocompletion
	set wildmode=longest,list,full

" Split navigation shortcuts
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Some more shortcuts
	map <C-c> "+y
	map <C-s> "*y

" Set the window title
	set title

" Mouse settings
	set mouse=a

" Eye candy stuff
	:colorscheme peachpuff
