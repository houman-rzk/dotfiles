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
	silent execute '!python3 $XDG_CONFIG_HOME/nvim/plugged/YouCompleteMe/install.py --all'
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
" Goyo
Plug 'junegunn/goyo.vim'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'
"
" Status bar
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" Theme
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

" Tree
Plug 'preservim/nerdtree'

Plug 'tpope/vim-surround'

" YouCompleteMe
" Remember to install it by running: python3 $XDG_CONFIG_HOME/nvim/plugged/YouCompleteMe/install.py --all
Plug 'ycm-core/YouCompleteMe'

" Color selector
Plug 'KabbAmine/vCoolor.vim'

" Multiple cursors
"Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()

" Some basiscs
	set number relativenumber
	syntax on
	set backspace=indent,eol,start
	set encoding=utf-8
	set splitbelow splitright
	set noswapfile
    " Tabs
	set tabstop=4 | set shiftwidth=4 | set expandtab | set softtabstop=4

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
	"map <C-h> <C-w>h
	"map <C-j> <C-w>j
	"map <C-k> <C-w>k
	"map <C-l> <C-w>l
    " Tabs and buffers
    map <C-j> :tabn<CR>
    map <C-k> :tabp<CR>
    map <leader>tb :tab ball<CR>
    map <leader>t :tabe 
    map <leader>d :bd<CR>
	" Run current file
	map <leader>r :w \| !./%<CR>
	" Shellcheck current file
	map <leader>sc :w \| !shellcheck %<CR>
    " Write and Quit
	map <leader>w :w<CR>
	map <leader>q :wq<CR>
    map <leader>Q :%bd \| q<CR>
	" Clipboard shortcuts
	map <C-c> "+y
	map <C-s> "*y
    noremap <LeftRelease> "*y<LeftRelease>
	" Toggle search highlighting
	map <leader>H :set hlsearch!<CR>
	" Disable search highlighting<CR>
	map <ESC> :noh<CR>:<ESC>
    " Compile .tex file
	map <leader>c :w! \| !texcompile "<c-r>%"<CR><CR>
    " Open a file (only tex)
	map <leader>p :!opout <c-r>%<CR><CR>
    " Coding
    map <leader>b a{<Enter>}<ESC>O
        " HTML
    "map <leader><leader> /++<CR>xxi
    "map <leader>ht i<++>++</++><ESC>9hxxi
    "map <leader>hT i<++><CR>++<CR></++><ESC>4hki      <ESC>k2hxxi
    "map <leader><leader> /++<CR>xx
    "map <leader>ht i<++>++</++><ESC>9hxxi
    "map <leader>hT i<++><CR>++<CR></++><ESC>4hki     <ESC>k2hxxi
    map <leader><leader> i<><ESC>i
    "map <leader>ht ?<<CR>ly$A</<ESC>p?><CR>li
    "map <leader>ht ?<<CR>ly$A</<ESC>plD
    "map <leader>ht yi>A</<ESC>pA><ESC>?><CR>/<\/<CR>i
    map <leader>ht $?<<CR>lyeA</<ESC>pA><ESC>?<\/<CR>i
    map <leader>hT $?<<CR>l"tyeyypldi>i/<ESC>"tpO<><ESC>i
    "map <leader>hT $?<<CR>l"tyeyypldi>i/<ESC>"tpO<><ESC>i
    "map <leader>hT yypa/<ESC>O<><ESC>i
    "map <leader>hT yypa/<ESC>O<><ESC>i
    "map <leader>hT yypa/<ESC>O<Tab><><ESC>i
    map <leader>ho o<><ESC>i
    map <leader>hO O<><ESC>i
    "map <leader><leader> i</><ESC>hi
    "map <leader>ht /\/<CR>x?<<CR>ly$A</<ESC>p?><CR>li
    "map <leader>hT /\/<CR>xyypa/<ESC>O<Tab></><ESC>hi
    
" Plugin shortcuts & config
	" Goyo
	map <leader>g :Goyo \| :hi Normal ctermbg=none<CR><ESC>
	" YouCompleteMe remaps
	map <Tab> <C-n>
	map <S-Tab> <C-p>
	" NERDTree
	nnoremap <leader>f :NERDTreeFind<CR>
	nnoremap <leader>T :NERDTreeToggle<CR>
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

"let g:gruvbox_contrast_dark = "hard" | let g:gruvbox_transparent_bg = 1 | autocmd VimEnter * hi Normal ctermbg=none | colorscheme gruvbox | let g:lightline = { 'colorscheme': 'gruvbox' }

" Autocommands
    " When shortcut files are updated, renew shell config
	autocmd BufWritePost bm-files,bm-dirs :!shortcuts
    " Recompile and rerun dwmblocks on config edit
	autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks ; setsid -f dwmblocks }

" Makes tabfind easier
    set path=.,,**

" This was in old vimrc
":set autochdir
