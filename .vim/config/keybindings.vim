"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => The most relevant keybindigs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-s>     :w<cr>
nmap <leader>w :w<cr>
nmap <leader>x :x<cr>
nmap <leader>q :q!<cr>

" j+k or k+j escapes insert mode
imap jk <ESC>
imap kj <ESC>

" Copy paste: leader+c / leader+v
map <leader>c "+y
map <leader>p "+p

" Toggle highlight when <leader><cr> is pressed
map <silent><expr> <leader><cr> (&hls && v:hlsearch ? ':set nohlsearch' : ':set hls')."\n"

" Quickly open vim config file
map <leader>e :e! ~/.vimrc<cr>

" Jumb back to last buffer
map <leader>6 <c-^><cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Shortcutting split navigation, saving a keypress:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap split navigations to just CTRL +hjkl
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Remap move windows with just ALT+hjkl
map <M-h> <C-w>H
map <M-j> <C-w>J
map <M-k> <C-w>K
map <M-l> <C-w>L

" Same but using the leader, you can't hold down this key, what a shame
nmap <silent><leader>h :wincmd h<cr>
nmap <silent><leader>j :wincmd j<cr>
nmap <silent><leader>k :wincmd k<cr>
nmap <silent><leader>l :wincmd l<cr>

" Split configurations
nmap <silent><C-Left>  :vertical resize +3<cr>
nmap <silent><C-Right> :vertical resize -3<cr>
nmap <silent><C-Up>    :resize +3<cr>
nmap <silent><C-Down>  :resize -3<cr>

" Always move down with vim keys even in soft-lines
noremap <expr> j v:count ? 'j' : 'gj'
noremap <expr> k v:count ? 'k' : 'gk'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap <silent><leader>r :call VisualSelection('replace', '')<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Function Calls
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>ipdb :call InsertIpdbLine()<cr>
