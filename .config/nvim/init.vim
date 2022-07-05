"        _                    
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|


let mapleader=" "

if empty(glob("$XDG_CONFIG_HOME/nvim/autoload/plug.vim"))
	silent execute '!mkdir -p $XDG_CONFIG_HOME/nvim/autoload/'
	silent execute '!curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > $XDG_CONFIG_HOME/nvim/autoload/plug.vim'
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'junegunn/goyo.vim'

" Syntax highlighting
"Plug 'sheerun/vim-polyglot'

" Status bar
"Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" Theme
Plug 'morhetz/gruvbox'
"Plug 'shinchu/lightline-gruvbox.vim'

" Tree
Plug 'scrooloose/nerdtree'

" ddc autocomplete plugin
"Plug 'Shougo/ddc.vim'
"Plug 'vim-denops/denops.vim'
"Plug 'Shougo/ddc-around'
"Plug 'Shougo/ddc-matcher_head'
"Plug 'Shougo/ddc-sorter_rank'
"Plug 'Shougo/neco-vim'

call plug#end()

" Some basiscs
	set number relativenumber
	syntax on
	"set backspace=indent,eol,start
	set encoding=utf-8
	set splitbelow splitright
	set noswapfile
	set tabstop=4
	set shiftwidth=4
"	set expandtab

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
	"colorscheme peachpuff
	colorscheme gruvbox
	let g:gruvbox_contrast_dark = "hard"

" Enable goyo reading mode
	map <leader>f :Goyo<CR>

" Enable built-in autocomplete
	filetype plugin on
	set omnifunc=syntaxcomplete#Complete
