""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Format Keybindings (using Neoformat)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent><leader>f  :Neoformat<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Telescope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Find files using Telescope command-line sugar.
nnoremap <C-p>      <cmd>Telescope find_files<cr>
nnoremap <silent><leader>ag <cmd>Telescope grep_string<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDCommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent>gc <Plug>NERDCommenterToggle<cr>
xmap <silent>gc <Plug>NERDCommenterToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => BufferLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent>H :BufferLineCyclePrev<CR>
nnoremap <silent>L :BufferLineCycleNext<CR>
