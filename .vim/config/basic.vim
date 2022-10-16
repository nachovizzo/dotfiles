"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

" Enable filetype plugins
filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set backspace=eol,start,indent
set clipboard^=unnamed
set cmdheight=1
set colorcolumn=+1
set completeopt+=menuone,noselect
set cursorline
set hidden
set ignorecase
set inccommand=split
set incsearch
set lazyredraw
set linebreak
set mouse=a
set nohlsearch
set nowrap
set smartcase
set splitbelow
set splitright
set termguicolors
set textwidth=100
set whichwrap+=<,>,h,l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc.nvim settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set signcolumn=number
set updatetime=300
set shortmess+=c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
" colorscheme xcodedark
colorscheme xcodelight

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
set undodir=~/.vim/temp_dirs/undodir/
set undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smarttab
set autoindent
set smartindent
set wrap
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=-1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Read local .vimrc files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set exrc
set secure
