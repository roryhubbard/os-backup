set nocompatible " not compatible with vi

filetype plugin indent on
syntax on

set backspace=indent,eol,start

set number " show line numbers
set clipboard=unnamedplus " copy to system clipboard

set hlsearch " highlight searched words
set incsearch " start searching before pressing Enter

set expandtab " enter spaces when tab is pressed
set tabstop=2 " use 2 spaces to represent tab
set softtabstop=2
set shiftwidth=2 " number of spaces to use for auto indent
set autoindent " copy indent from current line when starting a new line

set undodir=~/.vimdid
set undofile

colorscheme everforest
set bg=dark

let g:python_recommended_style = 0

" keybindings
let mapleader = " "
" set ctrl-j to esc for all modes
map <C-j> <Esc>
map! <C-j> <Esc>
nmap <C-p> :Files<Enter>
nmap <Leader>; :Buffers<Enter>
