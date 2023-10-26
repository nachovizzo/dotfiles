call plug#begin('~/.config/nvim/plugged')
Plug 'akinsho/bufferline.nvim', { 'tag': 'v4.*' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'ethanholz/nvim-lastplace'
Plug 'kevinhwang91/nvim-bqf'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'lervag/vimtex'
Plug 'ludovicchabant/vim-gutentags'
Plug 'nachovizzo/committia.vim'
Plug 'nachovizzo/vim-colors-xcode'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-surround'
Plug 'nvimdev/dashboard-nvim'
Plug 'folke/zen-mode.nvim'
call plug#end()

" TODO(Nacho): Transistion this into a plugin in the future !
function! FormatOnClose()
    if &filetype == 'cpp'
        " Force wirte this .cfg. I'm never going to use this crap in my life
        silent execute '!uncrustify -q -c ~/.uncrustify.cfg --replace --no-backup % 2>/dev/null'
    endif
endfunction

function! FormatOnOpen()
    if &filetype == 'cpp'
        silent execute '!clang-format -i %'
    endif
endfunction

autocmd BufUnload * call FormatOnClose()
autocmd BufReadPost * call FormatOnOpen()
