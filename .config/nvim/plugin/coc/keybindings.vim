""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CoC Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent><leader>ce :CocEnable<cr>
nnoremap <silent><leader>ct :CocToggle<cr>
nnoremap <silent><leader>cd :CocDisable<cr>
nnoremap <silent><leader>cr :CocRestart<cr>
nnoremap <silent><leader>co :CocConfig<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-explorer bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent><leader>m       :CocCommand explorer<cr>
nmap <silent><leader>b       :CocCommand explorer --preset buffer<cr>
nmap <silent><leader><space> :CocCommand explorer --preset floating<cr>

