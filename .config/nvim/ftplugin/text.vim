""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set textwidth=0
set colorcolumn=0
set spell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Enable universal ctags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gutentags_enabled=1
set iskeyword+=-  " enables ctags to find fig:this-sucks
set iskeyword+=\\ " enables ctags to find /my_shitty_command
