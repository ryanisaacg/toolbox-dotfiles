"Basic Vim Behavior
set backspace=2 "Make backspaces do what they do for any other editor

"Some basic utilities
set bg=light
set number "Line numbers
syntax on "Syntax highlighting
set clipboard^=unnamed "Use the system clipboard
set mouse=a "Read mouse events
set showmatch "Show matching parens and brackets
set hlsearch "Highlight matching items in a search
set incsearch "Incrementally search: auto-jump to the first match while a search is being typed
set hidden "Buffers should stay alive, even if not visible

"Tabs
"Each indent should be 4 space characters
set tabstop=4 "Make each tab 4 spaces
set shiftwidth=4 "Make sure auto-tabbing only indents 4 spaces
set autoindent
set expandtab
set smarttab
filetype plugin indent on

"Text wrapping
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0
set formatoptions-=t
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$
noremap  <buffer> <silent> <Up> gk
noremap  <buffer> <silent> <Down> gj
noremap  <buffer> <silent> <Home> g0
noremap  <buffer> <silent> <End> g$

"Disable backups completely
set nobackup nowritebackup noswapfile

"Allow each project to set its own vimrc
set exrc

"Plugins
"Install the plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"Install the plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rsi'
Plug 'cohama/lexima.vim'
call plug#end()

" Keybinds
let mapleader=","
" Add keybinds to jump to errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Fuzzy finder
nmap <silent> <leader>t :FZF<CR>
" Clear highlighting
nmap <silent> <leader>c :nohl<CR>
" Display list of buffers
nmap <silent> <leader>s :buffers<CR>:b 
" Switch between the last 2 buffers
nmap <silent> <leader>S :b#<CR>

"Configure syntax highlighting
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight StatusLine ctermfg=white cterm=bold
highlight Comment cterm=italic gui=italic
"Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Configure the statusline
set laststatus=2
set statusline=%#StatusLine#%f%m%r%h%w%=\ [%Y]\ [%{&ff}]\ [line:\ %0l,\ column:\ %0v]\ [%p%%]
set guicursor=

" Custom functions
function! StripTrailing()
    :%s/ \+$//g
endfunction
