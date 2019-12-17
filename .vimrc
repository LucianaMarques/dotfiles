" Plugins managed with https://github.com/junegunn/vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'

call plug#end()

" General
set number	" Show line numbers
set nowrap	" Wrap lines
set showbreak=+++ 	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally

set autoindent	" Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=2 " Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=2 " Number of spaces per Tab
set ts=2

"" Advanced
set ruler	" Show row and column ruler information

set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

set cursorline
" hide buffers instead of closing them when you :q, keeping their undo history
set hidden

" File name tab completion functions like bash, it gives you a list of
" options instead of automatically filling in the first possible match.
set wildmenu
" It will however, with this option, complete up to the first character of
" ambiguity.
set wildmode=list:longest

syntax enable
filetype plugin indent on

" text search remappings
nnoremap / :set hlsearch<CR>/
nnoremap <CR> :noh<CR><CR>

" enable mouse in console
set mousemodel=extend
set mouse=a
set mousehide

" Remove trailing whitespaces before write, except for binary files
func! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  normal `Z
endfunc
autocmd BufWrite * if ! &bin | call StripTrailingWhitespace() | endif

" Configs for NerdTree
map <C-n> :NERDTreeToggle<CR>
