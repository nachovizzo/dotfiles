" Some stuff, like disabling the bar and enabling spell check
set textwidth=0
set colorcolumn=0
set spell
let g:gutentags_enabled=1

" override some keybindings
nmap <silent><nowait><leader>c <Cmd>update<CR><Cmd>VimtexCompileSS<CR>
nmap <silent><nowait><leader>v <plug>(vimtex-view)
nmap <silent><nowait><leader>t <plug>(vimtex-toc-open)
nmap <silent><nowait><leader>o <plug>(vimtex-errors)

" Backward search from pdf->vim in macOS
function! s:TexFocusVim() abort
  silent execute "!open -a iTerm"
  redraw!
endfunction

augroup vimtex_event_focus
  au!
  au User VimtexEventViewReverse call s:TexFocusVim()
augroup END
