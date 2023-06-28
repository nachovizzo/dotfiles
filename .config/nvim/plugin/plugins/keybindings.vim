""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Format Keybindings (using Neoformat)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent><leader>f  :Neoformat<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Telescope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent><C-p>      <cmd>Telescope find_files<cr>
nnoremap <silent><leader>ag <cmd>Telescope grep_string<cr>
nnoremap <silent><leader>Ag <cmd>Telescope live_grep<cr>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ZenMode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent>Z :ZenMode<CR>
