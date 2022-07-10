"        _                    
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|


let mapleader=" "

" vim-plug
if empty(glob("$XDG_CONFIG_HOME/nvim/autoload/plug.vim"))
	silent execute '!mkdir -p $XDG_CONFIG_HOME/nvim/autoload/'
	silent execute '!curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > $XDG_CONFIG_HOME/nvim/autoload/plug.vim'
	autocmd VimEnter * PlugInstall
endif

" vundle
"if empty(glob("$XDG_CONFIG_HOME/nvim/bundle/Vundle.vim"))
"	silent execute '!git clone https://github.com/VundleVim/Vundle.vim.git $XDG_CONFIG_HOME/nvim/bundle/Vundle.vim'
"	autocmd VimEnter * PluginInstall
"endif

"set nocompatible
"filetype off

"set rtp+=$XDG_CONFIG_HOME/nvim/bundle/Vundle.vim
"call vundle#rc("$XDG_CONFIG_HOME/nvim/bundle")
"call vundle#begin()
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'junegunn/goyo.vim'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Status bar
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" Theme
Plug 'morhetz/gruvbox'
"Plug 'shinchu/lightline-gruvbox.vim'

" Tree
Plug 'preservim/nerdtree'

" YouCompleteMe
Plug 'ycm-core/YouCompleteMe' "Remember to install it by running 'python3 install.py --all' in '$XDG_CONFIG_HOME/nvim/bundle/YouCompleteMe'

"call vundle#end()
"filetype plugin indent on
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
	colorscheme gruvbox
	let g:gruvbox_contrast_dark = "hard"
	colorscheme peachpuff "Commenting this line will enable gruvbox[-dark] theme

" Enable goyo reading mode
	map <leader>g :Goyo<CR>

" Disable search highlighting by default
	set nohlsearch

" Some shortcuts
	" Run current file
	map <leader>r :w \| !%<CR>
	" Check current file
	map <leader>c :w \| !shellcheck %<CR>
	" Write and quit
	map <leader>w :wq<CR>
	" Toggle search highlighting
	map <leader>h :set hlsearch!<CR>
	" Disable search highlighting<CR>
	map <esc> :noh<CR>


" YouCompleteMe (plugin) remaps
	map <Tab> <C-n>
	map <S-Tab> <C-p>

" Lightline colorscheme
"	let g:lightline = { 'colorscheme': 'wombat', }

" NERDTree shortcuts & config
	nnoremap <leader>f :NERDTreeFind<CR>
	nnoremap <leader>t :NERDTreeToggle<CR>
	let NERDTreeMapActivateNode = "l"
	let NERDTreeMapToggleHidden = "H"
	let NERDTreeMapUpdir = 'h'
