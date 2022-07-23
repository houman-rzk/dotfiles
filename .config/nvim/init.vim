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

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
" Goyo
Plug 'junegunn/goyo.vim'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Status bar
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" Theme
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

" Tree
Plug 'preservim/nerdtree'

" YouCompleteMe
" Remember to install it by running: python3 $XDG_CONFIG_HOME/nvim/plugged/YouCompleteMe/install.py --all
Plug 'ycm-core/YouCompleteMe'
call plug#end()

" Some basiscs
	set number relativenumber
	syntax on
	set backspace=indent,eol,start
	set encoding=utf-8
	set splitbelow splitright
	set noswapfile
    " Tabs
	set tabstop=4 | set shiftwidth=4 | set expandtab

" Enable autocompletion
	set wildmode=longest,list,full

" Disable search highlighting by default
	set nohlsearch

" Set the window title
	set title

" Mouse settings
	set mouse=a

" Shortcuts
	" Split navigation shortcuts
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
	" Run current file
	map <leader>r :w \| !%<CR>
	" Check current file
	map <leader>c :w \| !shellcheck %<CR>
	" Write and quit
	map <leader>w :wq<CR>
    " Quit
    map <leader>q :q!<CR>
	" Clipboard shortcuts
	map <C-c> "+y
	map <C-s> "*y
	" Toggle search highlighting
	map <leader>h :set hlsearch!<CR>
	" Disable search highlighting<CR>
	map <esc> :noh<CR>

" Plugin shortcuts & config
	" Goyo
	map <leader>g :Goyo<CR>
	" YouCompleteMe remaps
	map <Tab> <C-n>
	map <S-Tab> <C-p>
	" NERDTree
	nnoremap <leader>f :NERDTreeFind<CR>
	nnoremap <leader>t :NERDTreeToggle<CR>
	let NERDTreeMapActivateNode = "l"
	let NERDTreeMapToggleHidden = "H"
	let NERDTreeMapUpdir = 'h'

" Eye candy
	let g:gruvbox_contrast_dark = "hard"
	" Enable transparent background when using gruvbox theme
	let g:gruvbox_transparent_bg = 1 | autocmd VimEnter * hi Normal ctermbg=none
	colorscheme gruvbox
    " Lightline colorscheme
	let g:lightline = { 'colorscheme': 'gruvbox' }

" Autocommands
    " When shortcut files are updated, renew shell config
	autocmd BufWritePost bm-files,bm-dirs :!shortcuts
    " Recompile and rerun dwmblocks on config edit
	autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks ; setsid -f dwmblocks }
