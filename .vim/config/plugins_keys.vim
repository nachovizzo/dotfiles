""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CoC Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent><leader>ce :CocEnable<cr>
nnoremap <silent><leader>ct :CocToggle<cr>
nnoremap <silent><leader>cd :CocDisable<cr>
nnoremap <silent><leader>cr :CocRestart<cr>
nnoremap <silent><leader>co :CocConfig<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Format Keybindings (using Neoformat)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent><leader>f  :Neoformat<cr>
xmap <silent><leader>f  :Neoformat<cr>
nmap <silent><leader>or :OR<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-fzf Keybindigs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a
nnoremap <silent><leader>cl      :<C-u>CocFzfList<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-explorer bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: Fix this shit!
" let $foo=expand('%:p:h')
nmap <silent><leader>m       :CocCommand explorer<cr>
nmap <silent><leader>n       :CocCommand explorer --preset floating<cr>
nmap <silent><leader>b       :CocCommand explorer --preset buffer<cr>
nmap <silent><leader><space> :CocCommand explorer --preset floating<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SilverSearcher bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent><leader>ag :Ag <c-r><c-w><cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDCommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent>gc <Plug>NERDCommenterToggle<cr>
xmap <silent>gc <Plug>NERDCommenterToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-p> :Files<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => BufferLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jump buffer buffer with just ALT+h or ALT+l
nnoremap <silent><M-h> :BufferLineCyclePrev<CR>
nnoremap <silent><M-l> :BufferLineCycleNext<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimTeX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <localleader>c <Cmd>update<CR><Cmd>VimtexCompileSS<CR>
nmap <localleader>v <plug>(vimtex-view)
