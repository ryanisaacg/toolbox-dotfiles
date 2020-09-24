"Plugins
"Install the plugin manager
" if empty(glob("~/.config/dotfiles/vim/autoload/plug.vim"))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif
" "Install the plugins
" call plug#begin('~/.config/dotfiles/vim/plugged')
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " File fuzzy finding
" Plug 'airblade/vim-gitgutter' " Show git diff lines
" Plug 'tpope/vim-rsi' " Add the readline keys to Github
" Plug 'tpope/vim-fugitive' " Git wrapper for Vim
" Plug 'tpope/vim-dispatch' " Background tasks for Vim
" Plug 'tpope/vim-sensible' " Some nice defaults for Vim
" Plug 'tpope/vim-eunuch' " Some nice unix stuff for Vim (rename file and buffer, sudo edit)
" Plug 'sheerun/vim-polyglot' " Add a bunch of language support plugins on demand
" Plug 'w0rp/ale' " Erorr highlighting / linting while editing
" Plug 'vimwiki/vimwiki' " Vim wiki
" Plug 'junegunn/goyo.vim'
" call plug#end()

"Some basic utilities
set bg=dark
set number "Line numbers
set clipboard^=unnamed "Use the system clipboard
set mouse=a "Read mouse events
set showmatch "Show matching parens and brackets
set hlsearch "Highlight matching items in a search
set incsearch "Incrementally search: auto-jump to the first match while a search is being typed
set hidden "Buffers should stay alive, even if not visible
set showcmd
set autoread "Reload files automatically when they're changed outside vim
set splitbelow "Open a split below the current split
set splitright "Open a split to the right of the current split

" Use ripgrep for the :grep command
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

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

" Keybinds
let mapleader=" "
" Add keybinds to jump to errors
nmap <silent> <leader>ak <Plug>(ale_previous_wrap)
nmap <silent> <leader>aj <Plug>(ale_next_wrap)
" Add keybinds for split navigation
nmap <silent> <leader>h <C-w>h
nmap <silent> <leader>j <C-w>j
nmap <silent> <leader>k <C-w>k
nmap <silent> <leader>l <C-w>l
" Add bindings for autolab
nmap <silent> <leader>as :!acp %<CR>
nmap <silent> <leader>ar :!ares<CR>
" Add keybinds for using common ALE operations
nmap <silent> K :ALEHover<CR>
nmap <silent> gd :ALEGoToDefinition<CR>
nmap <silent> <leader>fr :ALEFindReferences<CR>
" Fuzzy finder
nmap <silent> t :FZF<CR>
" Clear highlighting
nmap <silent> <leader>c :nohl<CR>
" Display list of buffers
nmap <silent> <leader>s :buffers<CR>:b
" Switch between the last 2 buffers
nmap <silent> <leader>S :b#<CR>
" Execute the currently focused command from 'dispatch.vim'
nmap <silent> <leader>Q :Dispatch<CR>
" Create splits using easy keybindings
nmap <silent> <leader>- :split<CR>
nmap <silent> <leader>\| :vsplit<CR>
" Wiki keybindings
" Add keybinds for opening a link into split
nmap <silent> <leader>w- <Plug>VimwikiSplitLink
nmap <silent> <leader>w\| <Plug>VimwikiVSplitLink
nmap <silent> <leader>wc :VimwikiTOC<CR>

" Configure the statusline
set statusline=%#StatusLine#%f%m%r%h%w%=\ [%Y]\ [%{&ff}]\ [line:\ %0l,\ column:\ %0v]\ [%p%%]
set guicursor=

" Custom commands
" Strip tailing whitespace from files
function! StripTrailingWhitespace()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction
command! StripTrailing :call StripTrailingWhitespace()
au BufWritePre <buffer> :call StripTrailingWhitespace()

" Don't highlight POSIX sh features as errors
let g:is_posix=1

" Leave Vim screen on scrollback instead of clearing it
command! Persist :set t_ti= t_te=

" Configure syntax highlighting
" Enable italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd InsertEnter * highlight ExtraWhitespace ctermbg=black guibg=black
autocmd InsertLeave * highlight ExtraWhitespace ctermbg=red guibg=red

" Configure VimWiki
let g:vimwiki_list = [{ 'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.txt' }]

