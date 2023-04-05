"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autoreaload buffer when something changes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
      \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Disable automatic comment insertion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Jump to last line when opening a file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FileType associations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufReadPost *.tmux.* set syntax=tmux
