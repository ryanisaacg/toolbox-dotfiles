"Basic Vim Behavior
set backspace=2 "Make backspaces do what they do for any other editor
let mapleader=","

"Necessary flair
set bg=dark
set number "Line numbers
syntax on "Syntax highlighting

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

"Allow each project to set its own vimrc
set exrc

"Turn on flow support
let g:javascript_plugin_flow = 1

"Plugins
call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mxw/vim-jsx'
Plug 'kien/ctrlp.vim'
call plug#end()

"Set up the colorscheme
colorscheme onedark
let g:airline_theme='onedark'

"Configure the statusline to show syntax errors
let g:airline#extensions#ale#enabled = 1

"Set up buffers to act more like tabs in other editors
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
set hidden

"Add keybinds to jump to errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

