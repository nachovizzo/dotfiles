"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => The most relevant keybindigs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent><C-s>     :w<cr>
nmap <silent><leader>w :w<cr>
nmap <silent><leader>x :x<cr>
nmap <silent><leader>q :q!<cr>
nmap <silent>Q :bd<cr>

" j+k or k+j escapes insert mode
imap jk <ESC>
imap kj <ESC>

" Copy paste: leader+c / leader+v
map <silent><leader>c "+y
map <silent><leader>p "+p

" Toggle highlight when <leader><cr> is pressed
map <silent><expr> <leader><cr> (&hls && v:hlsearch ? ':set nohlsearch' : ':set hls')."\n"

" Quickly open vim config file
map <silent><nowait><leader>e :e! $MYVIMRC<cr>
map <silent><nowait><leader>r :Runtime <cr>

" Jumb back to last buffer
map <silent><leader>6 <c-^><cr>

" Remap visual block from Ctrl+v -> Ctrl+b
" nmap <C-b> <C-v>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Shortcutting split navigation, saving a keypress:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap split navigations to just CTRL +hjkl
map <silent><C-h> <C-w>h
map <silent><C-j> <C-w>j
map <silent><C-k> <C-w>k
map <silent><C-l> <C-w>l

" Always move down with vim keys even in soft-lines
noremap <expr> j v:count ? 'j' : 'gj'
noremap <expr> k v:count ? 'k' : 'gk'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap <silent><leader>r :call functions#VisualSelection('replace', '')<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Function Calls
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>ipdb :call functions#InsertIpdbLine()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorscheme, TOOD: define a darktheme and a light theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent><leader>d :colorscheme  xcodedark<cr>
nmap <silent><leader>l :colorscheme xcodelight<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Useful mappings to make search results appear in the middle of the screen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
