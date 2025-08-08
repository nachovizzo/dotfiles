call plug#begin('~/.config/nvim/plugged')
Plug 'akinsho/bufferline.nvim', { 'tag': 'v4.*' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'ethanholz/nvim-lastplace'
Plug 'folke/zen-mode.nvim'
Plug 'kevinhwang91/nvim-bqf'
Plug 'lambdalisue/vim-suda'
Plug 'lervag/vimtex'
Plug 'ludovicchabant/vim-gutentags'
Plug 'nachovizzo/committia.vim'
Plug 'nachovizzo/vim-colors-xcode'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvimdev/dashboard-nvim'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'preservim/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-surround'
call plug#end()

set clipboard+=unnamedplus
