" Automatically install plug if not there
source ~/.vim/config/plug.vim

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-rooter'
Plug 'antoinemadec/coc-fzf'
Plug 'junegunn/fzf', {'dir': '~/.fzf'}
Plug 'junegunn/fzf.vim'
Plug 'kevinoid/vim-jsonc'
Plug 'morhetz/gruvbox'
Plug 'nachovizzo/committia.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
call plug#end()

" All the real configuration
source ~/.vim/config/basic.vim
source ~/.vim/config/coc.vim
source ~/.vim/config/functions.vim
source ~/.vim/config/keybindings.vim
source ~/.vim/config/plugins_config.vim
source ~/.vim/config/plugins_keys.vim
source ~/.vim/config/extended.vim
