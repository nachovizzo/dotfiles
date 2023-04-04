" Make it white
colorscheme xcodelight

" Some stuff, like disabling the bar and enabling spell check
set textwidth=0
set colorcolumn=0
set spell

" override some keybindings
nmap <leader>c <Cmd>update<CR><Cmd>VimtexCompileSS<CR>
nmap <leader>v <plug>(vimtex-view)

" Backward search from pdf->vim in macOS
function! s:TexFocusVim() abort
  silent execute "!open -a iTerm"
  redraw!
endfunction

augroup vimtex_event_focus
  au!
  au User VimtexEventViewReverse call s:TexFocusVim()
augroup END

