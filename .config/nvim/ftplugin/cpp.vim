" WIP ==============================================================================================
" TODO(Nacho): Transistion this into a plugin in the future !
function! FormatOnClose()
    if &filetype == 'cpp'
        " Force wirte this .cfg. I'm never going to use this crap in my life
        silent execute '!uncrustify -q -c ~/.uncrustify.cfg --replace --no-backup % 2>/dev/null'
    endif
endfunction

function! FormatOnOpen()
    if &filetype == 'cpp'
        silent execute '!clang-format -i %'
    endif
endfunction

" autocmd BufUnload * call FormatOnClose()
" autocmd BufReadPost * call FormatOnOpen()
