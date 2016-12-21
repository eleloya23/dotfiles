" ### F4 creates block comment
" #############
" #  example  #
" #############
"
nnoremap <F4> <esc>yyp<c-v>$r#<esc>I######<esc>kI#  <esc>A  #<esc>yyP<c-v>$r#<esc>jjj

" ### Modified Shortcuts
"
let mapleader=","
set pastetoggle=<F2>

" ### Windows Splitting
"
" Leader+V for Vertical Split
" Leader+H for Horizonal Split
" Ctrl+JHJKL for Movement
set splitbelow splitright
noremap <Leader>v :vsp^M^W^W<cr>
noremap <Leader>h :split^M^W^W<cr>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" ### Sudo Write
" 
" The missing vim function
cmap w!! w !sudo tee % >/dev/null

" ### Vim Config
" 
syntax on
set t_Co=256
set background=dark
colorscheme industry
filetype on
filetype plugin on
filetype indent on
set nocompatible " Who needs VI compatibility anymore?
set tabstop=2 " No one will need more than 2 spaces wide tabs for a personal computer- Bill Gates
set shiftwidth=2
set expandtab " Spaces > Tabs
au FileType python setl sw=4 sts=4 et
set shiftround " Align to the nearest tab. 2+TAB=4 / 3+TAB=4
set autoindent
set autoread
set showmatch
set backspace=indent,eol,start " See disc at: http://vi.stackexchange.com/a/2163
set history=500 " Dat big history
set number " Show line numbers, can't believe this is not on by default
set ruler
set visualbell " Usefull if you don't have headphones like me :(
set noesckeys " No delay when escaping
set noswapfile " Hardocore mode
set nobackup
set nowritebackup
set showmode
set wildmenu " Autocompletition
set wildmode=list:longest 
set ignorecase " Case insensitive searching
set smartcase  " But sensitive if you use capital letters
set wrap
