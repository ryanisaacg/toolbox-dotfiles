"Basic Vim Behavior
set backspace=2 "Make backspaces do what they do for any other editor
let mapleader=","

"Necessary flair
set bg=dark
set number "Line numbers
syntax on "Syntax highlighting
colorscheme onedark

"Tabs
"Each indent should be 4 space characters
set tabstop=4 "Make each tab 4 spaces
set shiftwidth=4 "Make sure auto-tabbing only indents 4 spaces
set autoindent
set expandtab
set smarttab
filetype plugin indent on

"Useful flair
set showmatch "Show matching parens and brackets

"Mouse
set mouse=a

"Disable backups completely
set nobackup
set nowritebackup
set noswapfile

"Plugins
call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'mattn/webapi-vim'
Plug 'jdonaldson/vaxe'
Plug 'cespare/vim-toml'
Plug 'tikhomirov/vim-glsl'
Plug 'othree/html5.vim'
Plug 'fatih/vim-go'
call plug#end()
