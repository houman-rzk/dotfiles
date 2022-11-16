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

"Plug 'ternjs/tern_for_vim'
"Plug 'neoclide/coc.nvim'

" Status bar
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" Theme
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

" Tree
Plug 'preservim/nerdtree'

" Surround
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
    "set nowrapscan
    set ignorecase
    " Tabs
	set tabstop=4 | set shiftwidth=4 | set expandtab | set softtabstop=4
    " Do not match brackets, parenthesis, etc
    "let g:loaded_matchparen=1
    set scrolloff=3

" Enable autocompletion
	set wildmode=longest,list,full

" Disable search highlighting by default
	set nohlsearch

" Set the window title
	set title

" Mouse settings
	set mouse=a

" Shortcuts
    " Shell commands
    map <leader>sh :!
    map <leader>sls :!ls<CR>
    map <leader>sst :!st >/dev/null 2>&1 & <Enter><Enter>
    "map <leader>slf :!setsid -f st -e multi-lf >/dev/null 2>&1 & <Enter><Enter>
	" Split view, tab and buffer navigation shortcuts
	map <leader>vh <C-w>h
	map <leader>vj <C-w>j
	map <leader>vk <C-w>k
	map <leader>vl <C-w>l
    "map <C-l> :tabn<CR>
    "map <C-h> :tabp<CR>
    "map <C-j> :bn<CR>
    "map <C-k> :bp<CR>
    map <leader>j :bn<CR>
    map <leader>k :bp<CR>
    map <leader>l :tabn<CR>
    map <leader>h :tabp<CR>
    map <leader>tb :tab ball<CR>
    map <leader>t :tabe 
    map <leader>e :e 
    map <leader>d :bd<CR>
	" Run current file
	map <leader>r :w \| !run "%"<CR>
	" Shellcheck current file
	map <leader>sc :w \| !shellcheck %<CR>
    " Write and Quit
	map <leader>w :w<CR>
	map <leader>q :wq<CR>
	map <leader>fq :q!<CR>
    map <leader>Q :%bd \| q<CR>
	" Clipboard shortcuts
	map <C-c> "+y
	map <C-s> "*y
    map <leader>as ggVG"*y
    map <leader>ac ggVG"+y
    noremap <LeftRelease> "*y<LeftRelease>
	" Toggle search highlighting
	"map <leader>H :set hlsearch!<CR>
	map <leader>W :set wrapscan!<CR>
	" Disable search highlighting<CR>
	map <ESC> :noh<CR>:<ESC>
    " Compile a [source, tex, groff, ...] file
	map <leader>c :w! \| !compile "<c-r>%"<CR>
    " Open a file
	map <leader>p :!opout "<c-r>%"<CR><CR>
    " Coding & Soy-devvery
    map <leader>b a{<Enter>}<ESC>O
        " HTML
    "map <leader><leader> i<><ESC>i
    function! MappingsHTML()
        map <leader><leader> a<><ESC>i
        map <leader>ht ?<<CR>l"tyi>/><CR>a</<ESC>pa><ESC>?><CR>a
        map <leader>hT $?<<CR>l"ty/><CR>"hyy"hpldi>i/<ESC>"tpO<><ESC>i
        map <leader>ho o<><ESC>i
        map <leader>hO O<><ESC>i
    endfunction
        " JS (omg nooo)
            " User omnicomplete, since YCM-JS doesn't work without ~/.tern-config
    inoremap <C-Space> <C-x><C-o>
    
" Plugin shortcuts & config
	" Goyo
	map <leader>g :Goyo \| :hi Normal ctermbg=none<CR><ESC>
	" YouCompleteMe
        " For YCM-JS's need to have an un-relocatable ~/.tern-config
    let $HOME="/home/hache/.config/nvim"
        " Disable only highlighting (sometimes its illegible)
    let g:ycm_enable_diagnostic_highlighting = 0
        " Disable all graphic stuff
    "let g:ycm_show_diagnostics_ui = 0
        " Remaps
	map <Tab> <C-n>
	map <S-Tab> <C-p>
	" NERDTree
	nnoremap <leader>f :NERDTreeFind<CR>
	nnoremap <leader>T :NERDTreeToggle<CR>
	let NERDTreeMapActivateNode = "l"
	let NERDTreeMapToggleHidden = "H"
	let NERDTreeMapUpdir = 'h'
    let NERDTreeMapJumpNextSibling = '<C-N>'
    let NERDTreeMapJumpPrevSibling = '<C-P>'

" Eye candy
	"let g:gruvbox_contrast_dark = "hard"
	"" Enable transparent background when using gruvbox theme
	"let g:gruvbox_transparent_bg = 1 | autocmd VimEnter * hi Normal ctermbg=none
	"colorscheme gruvbox
    "" Lightline colorscheme
	"let g:lightline = { 'colorscheme': 'gruvbox' }


" Autocommands
    " Open all tabs upon startin vim
    autocmd VimEnter * :tab ball
    " When shortcut files are updated, renew shell config
    autocmd BufWritePost bm-files,bm-dirs :!shortcuts
    " Recompile and rerun dwmblocks on config edit
	"autocmd BufWritePost ~/.local/src/dwmblocks/blocks.h !cd ~/.local/src/dwmblocks/; sudo -S make install && { killall -q dwmblocks ; setsid -f dwmblocks }
    autocmd BufEnter,BufNew *.html :NoMatchParen
    autocmd BufEnter,BufNew *.html call MappingsHTML()
    " File-extension-dependent mappings
    "autocmd BufEnter,BufNew *.java :map <leader>jo aSystem.out.println();<ESC>hi

" Makes tabfind easier
    set path=.,,**

" This was in old vimrc
":set autochdir
